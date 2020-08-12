window.addEventListener("turbolinks:load", function(){

  // テーマ入力時のsubmitを回避
  const memoTheme = document.getElementById("memo-theme");
  const tagInput = document.getElementById("tag-add");
  enterCancel(memoTheme);
  enterCancel(tagInput);
  
  // タグ追加機能
  const btn = document.getElementById("tag-add-btn");
  const tagArea = document.getElementById("tag-area");

  btn.addEventListener("click", function(){
    const str = tagInput.value.replace(/\s+/g, "")
    if (str.length > 10 ) {
      alert("タグは１０文字以内です！");
      return false;
    }
    if ( tagArea.childElementCount >= 6 ){
      alert("タグの登録は５つまでです！")
      return false;
    }
    let div
    if ( tagInput.value != "" ) {
      div = document.createElement("div");
      div.setAttribute("class", "tag");
      div.innerHTML = `<input type="hidden" name="memo_tag[tags][]" id="memo_tags_" value="${str}">${str}`
      tagArea.appendChild(div);
      tagInput.value = "";
      div.addEventListener('click', function() {
        div.animate({
          opacity: 0
          }, 202
        );
        setTimeout(function(){
          div.style.opacity = 0;
          }, 200
        );
        setTimeout(function(){
          div.animate({
            width: 0
            }, 201);
          }, 200
        );
        setTimeout(function(){
          div.remove();
          }, 400
        );
      });
    }

  });

  // submit前確認
  const submit = document.getElementById("submit");
  submit.addEventListener("click", function(e){
    console.log(memoTheme.value);
    console.log(memoText.value);
    if ( memoText.value == "" || memoTheme.value == "" ) {
      e.preventDefault();
      alert("テーマ・メモが空欄たのめ、保存できません。");
    }
  });

  
  const timer = document.getElementById("timer");
  const meter = document.getElementById("meter");
  const time = document.getElementById("time");
  const memoText = document.getElementById("memo-text");

  timer.addEventListener("click", function(){
    if (memoTheme.value != "" ) {
      let seconds = 60.0
      let interval
      memoText.focus();
      meter.animate({
        width: 0
      }, 60000 );
      setTimeout(function(){
        meter.style.width = 0;
        memoText.style.background = "lightgoldenrodyellow";
        }, 60000
      );
      interval = setInterval(
        function(){
          seconds -= 0.1;
          time.textContent = seconds.toFixed(1);
          if (seconds <= 0 ) {
            time.textContent = "0.0"
            clearInterval(interval);
          }
        },100
      )
    } else {
      memoTheme.focus();
      alert("メモのテーマを入力してください！");
    }
  });



});

function enterCancel(elem){
  elem.addEventListener("keydown", function (e) {
    if (e.key === 'Enter') {
      e.preventDefault();
    }
  });
}