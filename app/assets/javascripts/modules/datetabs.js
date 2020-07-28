$(function(){
  // タブのDOM要素を取得し、変数で定義
  let select_tabs = $(".Due");

  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch() {
    // 全てのactiveクラスのうち、最初の要素を削除
    $(".active").removeClass("active");

    // クリックしたタブにactiveクラスを追加

    $(this).addClass("active");

    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const index = tabs.index(this);

    // クリックしたタブに対応するにshowクラスを追加する
    $(".TaskList__TaskContainer__ManyTasks__Doing").removeClass("show").eq(index).addClass("show");
  }

  // タブメニューの中でクリックイベントが発生した場所を探し、下で定義したtabSwitch関数を呼び出す
  select_tabs.click(tabSwitch);

});