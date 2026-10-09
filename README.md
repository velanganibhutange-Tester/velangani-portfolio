# 👩‍💻 Velangani Bhutange | Software Quality Engineer Portfolio

### Quality Engineering • Test Automation • AI/LLM Testing • Enterprise SaaS

A modern, responsive portfolio showcasing my experience as a **Software Quality Engineer**, with a focus on building reliable software through thoughtful testing, automation, and continuous quality improvement.

I specialize in **AI/LLM feature testing, UI automation, API validation, integration testing, and enterprise SaaS quality engineering**.

[![Live Portfolio](https://img.shields.io/badge/🌐_Live_Portfolio-Visit_Website-2563EB?style=for-the-badge)](https://velanganibhutange-tester.github.io/velangani-portfolio/)
[![GitHub](https://img.shields.io/badge/GitHub-View_Profile-181717?style=for-the-badge&logo=github)](https://github.com/velanganibhutange-Tester)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/velangani-bhutange-025646165/)

---

## ✨ Portfolio Preview

![Velangani Bhutange Portfolio Preview](office-scene-labelled.webp)

*An evening-inspired professional workspace featuring a static presenter avatar, an office environment, and a recruiter-friendly portfolio experience.*

### 🌐 [Explore My Live Portfolio](https://velanganibhutange-tester.github.io/velangani-portfolio/)

---

## 🚀 Portfolio Highlights

- 🎨 **Modern responsive design** — A polished single-page experience across desktop, tablet, and mobile devices.
- 👩‍💻 **Professional avatar** — A steady, full-body presenter avatar against a reference-inspired evening office scene.
- 🎙️ **Voice introduction** — An optional, locally stored introduction played only when requested.
- 🧪 **Quality engineering showcase** — Dedicated sections for automation, AI/LLM testing, API testing, and integration validation.
- 🛠️ **Technical expertise** — Clear presentation of testing tools, frameworks, and engineering practices.
- 💼 **Career journey** — Professional experience, responsibilities, and education presented for recruiters.
- 📱 **Mobile navigation** — Responsive navigation with an accessible mobile menu.
- 📬 **Easy contact** — Accessible contact dialog with email and LinkedIn options.
- ♿ **Accessibility focused** — Semantic HTML, keyboard navigation, visible focus states, alt text, and reduced-motion support.
- 🔎 **SEO ready** — Open Graph metadata, JSON-LD Person schema, robots.txt, and sitemap.xml.
- ⚡ **Lightweight architecture** — Plain HTML, CSS, and JavaScript with no framework or build dependency.

---

## 🧰 Technical Skills

### 🔹 Test Automation

![Selenium](https://img.shields.io/badge/Selenium-43B02A?style=flat-square&logo=selenium&logoColor=white)
![Java](https://img.shields.io/badge/Java-ED8B00?style=flat-square&logo=openjdk&logoColor=white)
![C%23](https://img.shields.io/badge/C%23-512BD4?style=flat-square&logo=dotnet&logoColor=white)
![Cucumber](https://img.shields.io/badge/Cucumber-23D96C?style=flat-square&logo=cucumber&logoColor=white)
![Maven](https://img.shields.io/badge/Maven-C71A36?style=flat-square&logo=apachemaven&logoColor=white)

- Selenium WebDriver automation
- Java and C# test development
- BDD with Cucumber and Reqnroll
- xUnit testing
- Maven-based test execution
- Regression and smoke test automation

### 🔹 API & Integration Testing

![Postman](https://img.shields.io/badge/Postman-FF6C37?style=flat-square&logo=postman&logoColor=white)
![Azure](https://img.shields.io/badge/Microsoft_Azure-0078D4?style=flat-square)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=flat-square)

- REST API validation using Postman
- API request and response verification
- SQL and data validation
- CRM integration testing
- Azure Functions
- Azure Service Bus
- Azure Blob Storage
- End-to-end integration workflows

### 🔹 Quality Engineering

- 🤖 AI/LLM feature testing
- 🧪 Manual and exploratory testing
- 🔄 Regression and smoke testing
- 🔗 Integration and end-to-end testing
- 🐞 Defect identification, reporting, and retesting
- ✅ Release-readiness validation

### 🔹 Agile & Collaboration

- Jira-based defect tracking
- Agile and sprint collaboration
- Test planning and execution
- Cross-functional communication
- Quality reporting and release support

---

## 🏗️ Website Architecture

The portfolio uses a lightweight, framework-free architecture.

| Layer | Technology | Purpose |
|---|---|---|
| Structure | HTML5 | Semantic page layout and content |
| Styling | CSS3 | Responsive layouts and visual design |
| Interaction | JavaScript | Navigation, contact dialog, and audio controls |
| Audio | Local WAV | On-demand voice introduction |
| Images | WebP | Optimized portfolio visuals |
| Hosting | GitHub Pages | Static website deployment |
| SEO | JSON-LD, Open Graph | Search and social sharing metadata |

### 🔄 User Experience Flow

**Visitor opens portfolio**  
↓  
**Explores skills and career journey**  
↓  
**Views experience and quality engineering expertise**  
↓  
**Optionally plays voice introduction**  
↓  
**Downloads resume or opens contact options**

---

## 🎙️ Hear My Introduction

The portfolio includes an optional voice introduction designed to provide a more personal visitor experience.

### How It Works

1. The visitor selects **Hear My Introduction**.
2. A local WAV recording begins playing.
3. The button changes to **Stop Introduction**.
4. Selecting the button again stops playback.
5. Playback also stops when Escape is pressed or the browser tab becomes hidden.
6. The button resets when narration finishes.

### Key Design Decisions

- 🔇 No autoplay
- 🖼️ Completely static avatar
- 🎧 Locally hosted narration
- 🔒 No external avatar API or service
- ⚡ Audio loaded on demand
- ♿ Keyboard-accessible playback controls
- 🚫 No mouth animation, walking animation, or speech bubble

### Voice Technology

The introduction uses the installed **Microsoft Heera (English, India)** voice.

The recording is synthesized with:

- Plain, conversational English
- Short, understandable sentences
- Brief pauses between paragraphs
- A slightly relaxed speaking rate
- Explicit pronunciation guidance for technical abbreviations

The recording is generated during development. Visitors do not need Windows, PowerShell, or additional software.

---

## 📁 Project Structure

```text
velangani-portfolio/
│
├── 📄 index.html
├── 🎨 styles.css
├── ⚙️ script.js
├── 🎙️ avatar-presenter.js
│
├── 🖼️ avatar.png
├── 🖼️ avatar-enhanced.png
├── 🖼️ avatar-enhanced.webp
├── 🖼️ avatar-fullbody.png
├── 🖼️ avatar-fullbody.webp
│
├── 🌆 office-scene.png
├── 🌆 office-scene-labelled.png
├── 🌆 office-scene-labelled.webp
│
├── 🔊 introduction.wav
├── 📝 introduction.txt
├── ⚙️ introduction-pronunciations.json
│
├── 📂 scripts/
│   ├── build-introduction.ps1
│   └── office-background-prompt.txt
│
├── 📄 Velangani-Profile.pdf
├── 📄 THIRD_PARTY_LICENSES.txt
├── 📄 robots.txt
├── 📄 sitemap.xml
└── 📄 README.md
```

---

## 💻 Run the Portfolio Locally

### Option 1 — Open Directly

Clone the repository and open `index.html` in your browser.

### Option 2 — Start a Local Server

```bash
python -m http.server 8000
```

Open:

`http://localhost:8000`

No package installation, framework setup, or build process is required.

---

## 🔊 Regenerate the Voice Introduction

The narration is generated locally using Windows speech synthesis.

### Step 1 — Update the Transcript

Edit:

`introduction.txt`

### Step 2 — Generate Audio

Run:

```powershell
.\scripts\build-introduction.ps1
```

### Step 3 — Optional Voice Configuration

```powershell
.\scripts\build-introduction.ps1 -VoiceName 'Microsoft Heera' -SpeakingRate 0.95
```

### Pronunciation Support

The `introduction-pronunciations.json` file controls spoken aliases without changing the visible transcript.

| Term | Speech Handling |
|---|---|
| AI | Letter-by-letter pronunciation |
| LLM | Letter-by-letter pronunciation |
| API | Letter-by-letter pronunciation |
| SaaS | Software as a service |
| zCon Solutions | Zee-Con So-lu-tions |
| Velangani Bhutange | Voice's original unsplit pronunciation |

The script uses [Microsoft PromptBuilder pronunciation aliases](https://learn.microsoft.com/en-us/dotnet/api/system.speech.synthesis.promptbuilder.appendtextwithalias?view=netframework-4.8.1).

**Important notes:**

- A female English (India) voice is required by default.
- The script does not silently fall back to US or UK voices.
- PowerShell 7 automatically delegates to Windows PowerShell.
- The existing recording is replaced only after the new WAV file passes validation.
- Keep `avatarTranscript` in `index.html` synchronized with `introduction.txt`.
- Listen to the generated recording to verify names and pronunciation.
- Owner-recorded audio remains the best option for fully natural personal-name pronunciation.

---

## ♿ Accessibility & Performance

Accessibility is a core part of the portfolio design.

| Feature | Implementation |
|---|---|
| Semantic structure | HTML landmarks and meaningful sections |
| Keyboard navigation | Accessible links, buttons, and dialogs |
| Focus visibility | Clear keyboard focus indicators |
| Skip navigation | Skip-to-content link |
| Image accessibility | Descriptive alt text |
| Motion preferences | Reduced-motion support |
| Audio control | Explicit user-triggered playback |
| Responsive design | Mobile, tablet, and desktop layouts |
| Image optimization | WebP delivery |
| Dependency footprint | No external framework |

Clipboard functionality is available on localhost and HTTPS. If clipboard access is unavailable, the email address and email link remain accessible.

Icons are embedded from Lucide without requiring external icon scripts. Relevant license notices are included in `THIRD_PARTY_LICENSES.txt`.

---

## 🧪 Quality Validation Checklist

### Functional Testing

- [ ] Verify navigation links and section scrolling.
- [ ] Validate the mobile navigation menu.
- [ ] Test the contact dialog.
- [ ] Confirm email copy functionality.
- [ ] Verify LinkedIn and email links.
- [ ] Confirm resume download works.

### Audio Testing

- [ ] Verify narration starts only after user interaction.
- [ ] Confirm the button changes to Stop Introduction.
- [ ] Test stopping narration with the same button.
- [ ] Test Escape-key behavior.
- [ ] Confirm playback stops when the browser tab is hidden.
- [ ] Verify the button resets after narration finishes.
- [ ] Confirm the avatar remains completely still.

### Responsive & Accessibility Testing

- [ ] Test desktop, tablet, and mobile viewports.
- [ ] Verify keyboard navigation across interactive elements.
- [ ] Confirm visible focus indicators.
- [ ] Validate alt text.
- [ ] Test reduced-motion preferences.
- [ ] Confirm accessible dialog behavior.

### Deployment & Asset Testing

- [ ] Verify all WebP images load.
- [ ] Confirm CSS and JavaScript files load.
- [ ] Verify `introduction.wav` is accessible.
- [ ] Confirm the resume PDF opens correctly.
- [ ] Validate `robots.txt`.
- [ ] Validate `sitemap.xml`.
- [ ] Verify Open Graph metadata.
- [ ] Check the final GitHub Pages URLs.

---

## 🌆 Design & Image Assets

The portfolio uses an evening-inspired office scene featuring:

- A professional workspace
- A presenter avatar
- A chair and laptop
- A coffee mug
- Books and office accessories
- Labelled background details

The labelled office background was edited using the built-in image generation tool while retaining the original source assets.

The image-editing prompt is preserved in:

`scripts/office-background-prompt.txt`

Original PNG assets are retained for editing, while optimized WebP assets are used on the website.

---

## 🚀 Deployment

This portfolio is hosted using **GitHub Pages**.

### Deployment Steps

1. Push the project to GitHub.
2. Open the repository **Settings**.
3. Navigate to **Pages**.
4. Select **Deploy from a branch**.
5. Choose the `main` branch and `/ (root)` folder.
6. Save the configuration.
7. Open the published website.

### 🌐 Live Website

**[velanganibhutange-tester.github.io/velangani-portfolio](https://velanganibhutange-tester.github.io/velangani-portfolio/)**

---

## 📬 Let's Connect

I'm passionate about improving software reliability through strong testing practices, meaningful automation, and continuous learning.

Feel free to explore my portfolio or connect with me to discuss **Software Quality Engineering, Test Automation, API Testing, and AI/LLM Quality Assurance**.

| Platform | Contact |
|---|---|
| 🌐 Portfolio | [Visit Website](https://velanganibhutange-tester.github.io/velangani-portfolio/) |
| 💼 LinkedIn | [Connect on LinkedIn](https://www.linkedin.com/in/velangani-bhutange-025646165/) |
| 💻 GitHub | [velanganibhutange-Tester](https://github.com/velanganibhutange-Tester) |
| 📧 Email | [velanganibhutange@gmail.com](mailto:velanganibhutange@gmail.com) |
| 📄 Resume | [View My Resume](Velangani-Profile.pdf) |

---

### ⭐ Built with a Passion for Quality

*Testing is not just about finding defects — it's about building confidence in every release.*

**© 2026 Velangani Bhutange · Software Quality Engineer**
