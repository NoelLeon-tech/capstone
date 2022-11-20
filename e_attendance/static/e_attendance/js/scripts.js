document.addEventListener("DOMContentLoaded", () => {
    // Navlinks
    const navLinks = document.querySelectorAll(".nav-link");

    for (let link of navLinks) {
        link.addEventListener("click", () => {
            document.querySelector(".active").classList.remove("active");
            link.classList.add("active");
        })
    }

    // "Select a block" modal
    const courses = document.querySelectorAll(".courses");
    const blocks = document.querySelector("#blocks");

    for (let course of courses) {
        course.addEventListener("click", () => {
            blocks.innerHTML = "";
            for (let i = 1; i <= parseInt(course.dataset.blockCount); i++) {
                button = document.createElement("button");
                button.classList.add("btn", "btn-primary");
                button.innerHTML = i;
                blocks.append(button);
            }
        })
    }
});