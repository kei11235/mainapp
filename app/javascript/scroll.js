function scroll() {
  function scrollToEnd() {
      const scrollend = document.getElementById('scroll');
      scrollend.scrollTop = scrollend.scrollHeight;
  }
  scrollToEnd()
}

window.addEventListener('load',scroll)