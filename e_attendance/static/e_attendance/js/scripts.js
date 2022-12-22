document.addEventListener("DOMContentLoaded", () => {
    // Navlinks
    const navLinks = document.querySelectorAll(".nav-link");

    for (let link of navLinks) {
        link.addEventListener("click", () => {
            document.querySelector(".active").classList.remove("active");
            link.classList.add("active");
        })
    }
});