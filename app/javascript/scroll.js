function scroll() {
  function scrollToEnd() {
      const scrollend = document.getElementById('scroll');
      scrollend.scrollTop = scrollend.scrollHeight;
  }
  scrollToEnd()

  const scrollSubmit = document.getElementById("scroll-submit")
  scrollSubmit.addEventListener("click", function() {
    window.setTimeout(function(){
      scrollToEnd()
  }, 200);
  });
}

window.addEventListener('load',scroll)