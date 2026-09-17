const year = document.getElementById('currentYear');
const carouselElement = document.getElementById('suingaCarousel');

if (year) {
  year.textContent = new Date().getFullYear();
}

window.addEventListener('load', () => {
  document.body.classList.add('is-ready');
});

if (carouselElement && window.bootstrap) {
  const carousel = window.bootstrap.Carousel.getOrCreateInstance(carouselElement);
  const interactiveSelector = 'a, button, input, select, textarea, [contenteditable="true"]';

  document.addEventListener('keydown', (event) => {
    const target = event.target;
    const hasInteractiveFocus = target instanceof Element && target.closest(interactiveSelector);

    if (hasInteractiveFocus || event.altKey || event.ctrlKey || event.metaKey) {
      return;
    }

    if (event.key === 'ArrowLeft') {
      event.preventDefault();
      carousel.prev();
    }

    if (event.key === 'ArrowRight') {
      event.preventDefault();
      carousel.next();
    }

    if (event.key === 'Home') {
      event.preventDefault();
      carousel.to(0);
    }

    if (event.key === 'End') {
      event.preventDefault();
      carousel.to(7);
    }
  });
}
