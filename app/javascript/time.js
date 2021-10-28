function time() {
  const time = document.getElementById('time')
  const counter = document.querySelector('.counter');

    function time_limit() {
      //今の日時
      const d1 = new Date();
      const time_1 = time.value.replace( '-', '/' ).replace( '-', '/' ).replace( 'T', ' ' ).replace( 'UTC', '' )

      const d2 = new Date(time_1);
      const d3 = d2 - d1;
      const d3_Sec = Math.floor(d3 / 1000);
  
      //分、時、日の秒数
      const Minute_Sec = 60;
      const Hour_Sec = 60 * 60;
      const Day_Sec = 60 * 60 * 24;
  
      const d4_Day = Math.floor(d3_Sec / Day_Sec);
      const d5_Hour = Math.floor(d3_Sec / Hour_Sec  % 24);
      const d6_Minute = Math.floor(d3_Sec / Minute_Sec % 60);
      const d7_Sec = Math.floor(d3_Sec % 60);

      if (d3 <= 0){
        counter.innerHTML = "あと、0日00時間00分00秒！"
        counter.setAttribute("style", "border-bottom: dashed 4px red;")
      } else if (d3 > 0) {
        counter.innerHTML = "あと、" + d4_Day + "日" + (d5_Hour < 10 ? '0' + d5_Hour : d5_Hour) + "時間" + (d6_Minute < 10 ? '0' + d6_Minute : d6_Minute) + "分" + (d7_Sec < 10 ? '0' + d7_Sec : d7_Sec) + "秒！";
        counter.setAttribute("style", "border-bottom: dashed 4px #FDCE00;")
      } else {
        counter.innerHTML = null
        counter.removeAttribute("style", "border-bottom: dashed 4px #FDCE00;")
        counter.removeAttribute("style", "border-bottom: dashed 4px red;")
      }
      setTimeout(time_limit,1000);
    }
    time_limit();

}

window.addEventListener('load', time);