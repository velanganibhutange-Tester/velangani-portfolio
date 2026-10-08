(() => {
  const nav = document.getElementById("primaryNav");
  const menu = document.getElementById("menuToggle");
  function closeMenu() {
    nav.classList.remove("open");
    menu.setAttribute("aria-expanded", "false");
    menu.setAttribute("aria-label", "Open navigation");
  }
  menu.addEventListener("click", () => {
    const expanded = nav.classList.toggle("open");
    menu.setAttribute("aria-expanded", String(expanded));
    menu.setAttribute("aria-label", expanded ? "Close navigation" : "Open navigation");
  });
  nav.querySelectorAll("a").forEach((link) => link.addEventListener("click", closeMenu));
  window.addEventListener("keydown", (event) => {
    if (event.key === "Escape" && nav.classList.contains("open")) {
      closeMenu();
      menu.focus();
    }
  });

  const navLinks = [...nav.querySelectorAll("a[href^='#']")];
  const sections = navLinks.map((link) => document.querySelector(link.getAttribute("href"))).filter(Boolean);
  function updateNavigation() {
    const marker = document.querySelector(".site-header").getBoundingClientRect().height + 100;
    let current = sections[0];
    for (const section of sections) {
      if (section.getBoundingClientRect().top <= marker) current = section;
    }
    if (window.innerHeight + window.scrollY >= document.documentElement.scrollHeight - 4) current = sections[sections.length - 1];
    navLinks.forEach((link) => {
      if (link.hash === `#${current.id}`) link.setAttribute("aria-current", "page");
      else link.removeAttribute("aria-current");
    });
  }
  let ticking = false;
  window.addEventListener("scroll", () => {
    if (ticking) return;
    ticking = true;
    window.requestAnimationFrame(() => { updateNavigation(); ticking = false; });
  }, { passive: true });
  window.addEventListener("resize", updateNavigation);
  updateNavigation();

  const years = Math.max(0, Math.floor((Date.now() - new Date("2024-06-01T00:00:00Z").getTime()) / (365.25 * 86400000)));
  document.getElementById("experienceYears").textContent = `${years}+`;
  document.getElementById("copyrightYear").textContent = new Date().getFullYear();

  const dialog = document.getElementById("contactDialog");
  document.getElementById("chatTrigger").addEventListener("click", () => dialog.showModal());
  document.getElementById("closeContact").addEventListener("click", () => dialog.close());
  dialog.addEventListener("click", (event) => {
    if (event.target !== dialog) return;
    const bounds = dialog.getBoundingClientRect();
    if (event.clientX < bounds.left || event.clientX > bounds.right || event.clientY < bounds.top || event.clientY > bounds.bottom) dialog.close();
  });

  document.querySelectorAll("[data-copy-email]").forEach((button) => {
    button.addEventListener("click", async () => {
      const label = button.querySelector("span");
      try {
        await navigator.clipboard.writeText("velanganibhutange@gmail.com");
        label.textContent = "Email copied";
      } catch {
        label.textContent = "Use the email link";
      }
      window.setTimeout(() => { label.textContent = "Copy email"; }, 2200);
    });
  });
})();
