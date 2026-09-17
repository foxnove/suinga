const year = document.getElementById('currentYear');

if (year) {
  year.textContent = new Date().getFullYear();
}
