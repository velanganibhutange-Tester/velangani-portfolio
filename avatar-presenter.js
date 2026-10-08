(() => {
  const button = document.getElementById("hearIntro");
  const audio = document.getElementById("avatarNarration");
  const status = document.getElementById("speechStatus");
  const label = button.querySelector("span");
  const icon = button.querySelector("use");
  let generation = 0;
  let starting = false;

  function updateButton(playing) {
    label.textContent = playing ? "Stop Introduction" : "Hear My Introduction";
    button.setAttribute("aria-pressed", String(playing));
    button.title = playing ? "Stop introduction" : "Play introduction";
    icon.setAttribute("href", playing ? "#icon-Square" : "#icon-CirclePlay");
  }

  function stop(message = "Introduction stopped.") {
    generation++;
    starting = false;
    audio.pause();
    if (audio.readyState > 0) audio.currentTime = 0;
    updateButton(false);
    status.textContent = message;
  }

  button.addEventListener("click", async () => {
    if (starting || !audio.paused) {
      stop();
      return;
    }
    const request = ++generation;
    starting = true;
    updateButton(true);
    status.textContent = "Starting introduction.";
    if (audio.ended) audio.currentTime = 0;
    try {
      await audio.play();
      if (request !== generation) return;
      starting = false;
      status.textContent = "Playing introduction.";
    } catch {
      if (request !== generation) return;
      starting = false;
      updateButton(false);
      status.textContent = "Introduction audio is unavailable. Please try again.";
    }
  });

  audio.addEventListener("ended", () => {
    generation++;
    starting = false;
    updateButton(false);
    status.textContent = "Introduction finished.";
  });
  audio.addEventListener("error", () => stop("Introduction audio is unavailable."));
  window.addEventListener("keydown", (event) => {
    if (event.key === "Escape" && (starting || !audio.paused)) stop();
  });
  document.addEventListener("visibilitychange", () => {
    if (document.hidden && (starting || !audio.paused)) stop();
  });
  window.addEventListener("pagehide", () => stop());
})();
