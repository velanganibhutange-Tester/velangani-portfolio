# Velangani Bhutange | Software Quality Engineer Portfolio

Static portfolio website for **Velangani Bhutange**, a Software Tester focused on AI/LLM testing, test automation, API validation, integration testing, and enterprise SaaS quality engineering.

[Visit the Portfolio Website](https://velanganibhutange-tester.github.io/velangani-portfolio/)

## Highlights

- Responsive single-page portfolio built with plain HTML, CSS, and JavaScript.
- Reference-inspired evening office scene, steady avatar, and career journey.
- Mobile navigation menu and an accessible contact dialog with email and LinkedIn options.
- Recruiter-friendly sections for expertise, work focus, experience, process, education, and contact.
- One Hear My Introduction button plays a local voice introduction on demand. The avatar stays completely still.
- Accessible structure with semantic landmarks, skip link, keyboard focus states, alt text, and reduced-motion support.
- SEO and sharing metadata, including Open Graph tags and JSON-LD person schema.
- No build step or framework dependency required.

## Project Structure

```text
.
├── avatar.png (original)
├── avatar-enhanced.png (portrait source)
├── avatar-enhanced.webp (small portrait)
├── avatar-fullbody.png (avatar source)
├── avatar-fullbody.webp (hero avatar)
├── office-scene.png (original background edit source)
├── office-scene-labelled.png (labelled background source)
├── office-scene-labelled.webp (hero background)
├── index.html
├── styles.css
├── script.js
├── avatar-presenter.js (manual intro playback)
├── introduction.txt (narration source)
├── introduction-pronunciations.json (spoken aliases)
├── introduction.wav (local narration)
├── scripts/build-introduction.ps1
├── scripts/office-background-prompt.txt (built-in image edit prompt)
├── THIRD_PARTY_LICENSES.txt
├── README.md
├── robots.txt
├── sitemap.xml
└── Velangani-Profile.pdf
```

## Skills Represented

| Category | Technologies and Practices |
| --- | --- |
| Test Automation | Selenium, Java, C#, Cucumber, Maven, Reqnroll, xUnit, BDD |
| API and Integration | Postman, REST APIs, SQL, CRM, Azure Functions, Service Bus, Blob Storage |
| Quality Engineering | Manual testing, regression, smoke, integration, end-to-end, AI/LLM feature testing |
| Delivery | Jira, Agile collaboration, defect reporting, release-readiness validation |

## Local Preview

Open `index.html` directly in a browser, or run a small static server from the project root:

```bash
python -m http.server 8000
```

Then visit:

```text
http://localhost:8000
```

## Validation Checklist

- Confirm the WebP images, stylesheet, JavaScript files, `introduction.wav`, and resume load.
- Test desktop, tablet, and mobile viewport widths.
- Verify keyboard navigation reaches all links and buttons.
- Check that the avatar remains still before, during, and after narration.
- Confirm `robots.txt` and `sitemap.xml` use the final GitHub Pages URL.
- Confirm the resume download and contact links work after GitHub Pages deployment.
- Test the mobile menu, contact dialog, email copy, and Hear My Introduction button with a mouse and keyboard.
- Verify that narration starts only after selecting Hear My Introduction, resets after finishing, and stops on a second click, Escape, or when the browser tab is hidden.

The introduction is a local recording synthesized with the installed Microsoft Heera voice (English, India). It uses plain English, short sentences, brief pauses between paragraphs, and a slightly relaxed speaking rate. There is no external avatar service or API key. Audio loads on demand; the page does not load animation assets or amplitude metadata.

Select Hear My Introduction to play the narration. The same button changes to Stop Introduction during playback and resets when the recording finishes. The avatar is a static image with no interaction, walking, or mouth animation. There is no autoplay or speech bubble.

To update the narration on Windows, edit `introduction.txt` and run:

```powershell
.\scripts\build-introduction.ps1
```

The script regenerates and validates the WAV recording only. It uses Windows' installed WinRT voices and requires a female English (India) voice by default; it does not silently fall back to a US or UK accent. PowerShell 7 delegates to Windows PowerShell automatically. Visitors do not need Windows or PowerShell. `-VoiceName 'Microsoft Heera'` selects a specific installed voice; `-SpeakingRate 0.95` controls pace. The existing recording is replaced only after the new audio passes validation.

`introduction-pronunciations.json` controls spoken aliases without changing the transcript. AI, LLM, and API use explicit letter-by-letter speech hints, not guessed word pronunciation. Other aliases, such as SaaS to software as a service, remain available for future script changes. The builder uses [Microsoft's PromptBuilder pronunciation aliases](https://learn.microsoft.com/en-us/dotnet/api/system.speech.synthesis.promptbuilder.appendtextwithalias?view=netframework-4.8.1). Add owner-confirmed syllabic aliases for personal and company names when available. Keep `avatarTranscript` in `index.html` synchronized with the narration text. Listen to the recording after regeneration; synthesized speech cannot guarantee pronunciation from spelling alone. An owner-recorded introduction is the best choice for genuinely human delivery and exact personal-name pronunciation.

The labelled office image includes the reference's poster, chair, laptop, mug, and book text. It was edited with the built-in image generation tool, preserving the original source. The exact prompt is retained in `scripts/office-background-prompt.txt`.

Velangani Bhutange uses the voice's earlier unsplit name pronunciation, without a syllabic override. The owner-provided company alias remains `Zee-Con So-lu-tions` for zCon Solutions. These affect the recording only; the visible spelling and transcript are unchanged.

Clipboard access works on localhost or HTTPS; when unavailable, the email address and email link remain available.

Icons are embedded from Lucide, so the site requires no external icon scripts. License notices are in `THIRD_PARTY_LICENSES.txt`. Generated PNG source assets are retained; the page loads optimized WebP versions.

## Deployment

This portfolio is GitHub Pages friendly because it is a static site. Enable Pages from the repository settings and publish from the `main` branch root.

Live website: [Velangani Bhutange's Portfolio](https://velanganibhutange-tester.github.io/velangani-portfolio/)

## Contact

- GitHub: [velanganibhutange-Tester](https://github.com/velanganibhutange-Tester)
- LinkedIn: [Velangani Bhutange](https://www.linkedin.com/in/velangani-bhutange-025646165/)
- Email: <velanganibhutange@gmail.com>
