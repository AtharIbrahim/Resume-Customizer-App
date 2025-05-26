# 🤖 Resume Customizer App

A smart AI-powered Flutter app that customizes your resume based on a job description. Just upload your PDF resume and paste the job description URL — the app uses **Mistral.ai** to tailor your resume to match the job requirements.

---

## 🚀 Features

- 📄 Upload your existing **resume PDF**
- 🔗 Enter a **job description URL**
- 🧠 AI (Mistral) understands and customizes the resume
- 🎯 Tailored suggestions based on job requirements
- ⚡ Fast and lightweight Flutter frontend
- 💬 Human-like, job-matching resume customization

---

## 🤖 Powered By

- **[Mistral AI API](https://mistral.ai/)** — Open-source language model used to analyze the resume and job description and generate a customized resume version.

---

## 🛠 Tech Stack

| Layer       | Tech                         |
|-------------|------------------------------|
| Frontend    | Flutter                      |
| State Mgmt  | BLoC                         |
| AI Model    | Mistral AI (via HTTP API)    |
| File Input  | PDF Upload                   |
| Job Input   | Web URL                      |

---

## 📦 Demo

<img src="https://github.com/AtharIbrahim/Resume-Customizer-App/blob/main/screenshots/Screenshot%202025-05-26%20155845.png" alt="Main Interface">
<img src="https://github.com/AtharIbrahim/Resume-Customizer-App/blob/main/screenshots/Screenshot%202025-05-26%20160556.png" alt="Main Interface">

---

## 🧑‍💻 Getting Started

  - Clone the repo:
    ```bash
    git clone https://github.com/AtharIbrahim/Resume-Customizer-App.git
    ```

  - Install dependencies:
    ```bash
    flutter pub get
    ```

  - Run the app:
    ```bash
    flutter run
    ```

## 📝 How It Works
  - You upload your resume (PDF)
  - You paste the job post URL
  - The app fetches the job description and sends both the resume and job data to Mistral.ai
  - The AI returns a customized resume suggestion aligned with the job
  - You receive a tailored resume draft


## 📬 Contact
<ul>
  <li><strong>Name</strong>: Athar Ibrahim Khalid</li>
  <li><strong>GitHub</strong>: <a href="https://github.com/AtharIbrahim/" target="_blank">https://github.com/AtharIbrahim/</a></li>
  <li><strong>LinkedIn</strong>: <a href="https://www.linkedin.com/in/athar-ibrahim-khalid-0715172a2/" target="_blank">LinkedIn Profile</a></li>
  <li><strong>Website</strong>: <a href="https://atharibrahimkhalid.netlify.app/" target="_blank">Athar Ibrahim Khalid</a></li>
</ul>


## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE.txt) file for details.
