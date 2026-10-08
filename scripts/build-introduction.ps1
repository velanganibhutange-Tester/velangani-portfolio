param([string]$VoiceName, [ValidateRange(0.75, 1.25)][double]$SpeakingRate = 0.95)

$ErrorActionPreference = 'Stop'
# WinRT voices are available through Windows PowerShell, not PowerShell Core.
if ($PSVersionTable.PSEdition -eq 'Core') {
    $arguments = @('-NoProfile', '-File', $PSCommandPath, '-SpeakingRate', $SpeakingRate)
    if ($VoiceName) { $arguments += @('-VoiceName', $VoiceName) }
    & "$env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell.exe" @arguments
    if ($LASTEXITCODE -ne 0) { throw 'Narration generation failed in Windows PowerShell.' }
    return
}
Add-Type -AssemblyName System.Speech
Add-Type -AssemblyName System.Runtime.WindowsRuntime
$null = [Windows.Media.SpeechSynthesis.SpeechSynthesizer, Windows.Media.SpeechSynthesis, ContentType = WindowsRuntime]
$null = [Windows.Media.SpeechSynthesis.SpeechSynthesisStream, Windows.Media.SpeechSynthesis, ContentType = WindowsRuntime]
$voices = [Windows.Media.SpeechSynthesis.SpeechSynthesizer]::AllVoices
if ($VoiceName) {
    $voice = $voices | Where-Object { $_.DisplayName -eq $VoiceName } | Select-Object -First 1
} else {
    $voice = $voices | Where-Object { $_.Language -eq 'en-IN' -and $_.Gender -eq 1 } | Select-Object -First 1
}
if (!$voice) { throw 'Requested voice is not installed. Install an English (India) female speech voice, or specify -VoiceName explicitly.' }
$projectDirectory = Split-Path -Parent $PSScriptRoot
$narrationText = (Get-Content -LiteralPath (Join-Path $projectDirectory 'introduction.txt') -Raw).Trim()
$aliases = Get-Content -LiteralPath (Join-Path $projectDirectory 'introduction-pronunciations.json') -Raw | ConvertFrom-Json
$aliasByTerm = @{}
foreach ($property in $aliases.PSObject.Properties) {
    if ([string]::IsNullOrWhiteSpace($property.Name) -or $property.Value -isnot [string] -or [string]::IsNullOrWhiteSpace($property.Value)) {
        throw 'Pronunciation entries must have nonempty text keys and spoken aliases.'
    }
    $aliasByTerm[$property.Name] = $property.Value
}
$prompt = [System.Speech.Synthesis.PromptBuilder]::new([System.Globalization.CultureInfo]::GetCultureInfo($voice.Language))
# Match whole terms, longest first, without changing the written transcript.
$terms = $aliasByTerm.Keys | Sort-Object -Property Length -Descending | ForEach-Object { [regex]::Escape($_) }
$pattern = '(?<!\w)(?:' + ($terms -join '|') + ')(?!\w)'
$paragraphs = [regex]::Split($narrationText, '\r?\n\s*\r?\n')
for ($paragraphIndex = 0; $paragraphIndex -lt $paragraphs.Count; $paragraphIndex++) {
    if ($paragraphIndex -gt 0) { $prompt.AppendBreak([TimeSpan]::FromMilliseconds(250)) }
    $paragraph = $paragraphs[$paragraphIndex].Trim()
    if ($aliasByTerm.Count -gt 0) {
        $position = 0
        foreach ($match in [regex]::Matches($paragraph, $pattern, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)) {
            if ($match.Index -gt $position) { $prompt.AppendText($paragraph.Substring($position, $match.Index - $position)) }
            $alias = $aliasByTerm[$match.Value]
            if ($match.Value -cmatch '^[A-Z]{2,}$' -and ($alias -replace '\s', '') -ceq $match.Value) {
                $prompt.AppendTextWithHint($match.Value, [System.Speech.Synthesis.SayAs]::SpellOut)
            } else {
                $prompt.AppendTextWithAlias($match.Value, $alias)
            }
            $position = $match.Index + $match.Length
        }
        if ($position -lt $paragraph.Length) { $prompt.AppendText($paragraph.Substring($position)) }
    } else {
        $prompt.AppendText($paragraph)
    }
}
$wavePath = Join-Path $projectDirectory 'introduction.wav'
$temporaryWavePath = Join-Path $projectDirectory ('.introduction-' + [guid]::NewGuid().ToString('N') + '.wav')
$narrator = [Windows.Media.SpeechSynthesis.SpeechSynthesizer]::new()
$stream = $null
$inputStream = $null
$outputStream = $null
try {
    $narrator.Voice = $voice
    $narrator.Options.SpeakingRate = $SpeakingRate
    $operation = $narrator.SynthesizeSsmlToStreamAsync($prompt.ToXml())
    $asTask = [System.WindowsRuntimeSystemExtensions].GetMethods() | Where-Object {
        $_.Name -eq 'AsTask' -and $_.IsGenericMethodDefinition -and $_.GetGenericArguments().Count -eq 1 -and $_.GetParameters().Count -eq 1 -and $_.GetParameters()[0].ParameterType.Name -eq 'IAsyncOperation`1'
    } | Select-Object -First 1
    $task = $asTask.MakeGenericMethod([Windows.Media.SpeechSynthesis.SpeechSynthesisStream]).Invoke($null, @($operation))
    $stream = $task.GetAwaiter().GetResult()
    $inputStream = [System.IO.WindowsRuntimeStreamExtensions]::AsStreamForRead($stream)
    $outputStream = [System.IO.File]::Create($temporaryWavePath)
    $inputStream.CopyTo($outputStream)
    $selectedVoice = $voice.DisplayName
} finally {
    if ($outputStream) { $outputStream.Dispose() }
    if ($inputStream) { $inputStream.Dispose() }
    if ($stream) { $stream.Dispose() }
    $narrator.Dispose()
}

$reader = [System.IO.BinaryReader]::new([System.IO.File]::OpenRead($temporaryWavePath))
try {
    if ([System.Text.Encoding]::ASCII.GetString($reader.ReadBytes(4)) -ne 'RIFF') { throw 'Invalid WAV header.' }
    $null = $reader.ReadUInt32()
    if ([System.Text.Encoding]::ASCII.GetString($reader.ReadBytes(4)) -ne 'WAVE') { throw 'Invalid WAV format.' }
    $sampleRate = 0
    $sampleBytes = $null
    while ($reader.BaseStream.Position + 8 -le $reader.BaseStream.Length) {
        $chunkId = [System.Text.Encoding]::ASCII.GetString($reader.ReadBytes(4))
        $chunkLength = $reader.ReadUInt32()
        $nextChunk = $reader.BaseStream.Position + $chunkLength + ($chunkLength % 2)
        if ($nextChunk -gt $reader.BaseStream.Length) { throw 'Truncated WAV chunk.' }
        if ($chunkId -eq 'fmt ') {
            $encoding = $reader.ReadUInt16()
            $channels = $reader.ReadUInt16()
            $sampleRate = $reader.ReadUInt32()
            $null = $reader.ReadUInt32()
            $null = $reader.ReadUInt16()
            $bits = $reader.ReadUInt16()
            if ($encoding -ne 1 -or $channels -ne 1 -or $bits -ne 16) { throw 'Expected mono 16-bit PCM.' }
        } elseif ($chunkId -eq 'data') {
            $sampleBytes = $reader.ReadBytes($chunkLength)
        }
        $reader.BaseStream.Position = $nextChunk
    }
} finally {
    $reader.Dispose()
}
if (!$sampleBytes -or !$sampleRate) { throw 'Missing audio samples or sample rate.' }

$sampleCount = [int]($sampleBytes.Length / 2)
$peak = 0.0
for ($index = 0; $index -lt $sampleCount; $index++) {
    $sample = [System.BitConverter]::ToInt16($sampleBytes, 2 * $index) / 32768.0
    $peak = [Math]::Max($peak, [Math]::Abs($sample))
}
if ($peak -lt 0.001) { throw 'Narration contains no audible speech.' }
$duration = [Math]::Round($sampleCount / $sampleRate, 3)
Move-Item -LiteralPath $temporaryWavePath -Destination $wavePath -Force
Write-Output "Generated narration with $selectedVoice, $($voice.Language), rate $SpeakingRate ($duration seconds); pronunciation aliases applied."
