window.addEventListener('load', () => {


    /* Inicio del slider - Andres */
    let slide = 1;

    /* Total sliders - Andres */
    let slides = document.querySelectorAll(".an-slider ul li");
    total = slides.length;

    /* Mostrar primer slider - Andres */
    showSlide(1);

    next = document.querySelector(".next");
    prev = document.querySelector(".prev")

    /**
     * Evento "Boton siguiente" - Andres
     */
    next.addEventListener('click', (evt) => {
        evt.preventDefault();
        slide++;
        if (slide > total) { slide = 1; }
        showSlide(slide);
    })

    /** 
     * Evento "Boton previo" - Andres
     */
    prev.addEventListener("click", (evt) => {
        evt.preventDefault();
        slide--;
        if (slide < 1) { slide = total; }
        showSlide(slide);
    })

    /**
     * Mostrar Sliders
     * 
     * @param {number} n 
     * @return {null}
     * 
     */
    function showSlide(n) {
        n--; // decrement 1
        for (i = 0; i < slides.length; i++) {
            (i == n) ? slides[n].style.display = "block" : slides[i].style.display = "none";
        }
    }

})