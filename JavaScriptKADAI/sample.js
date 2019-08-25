  $(document).ready(function(){
    //何かしらの処理
  function score_indicate(){
    // このような記述をすることで、subject_pointsという変数の中に
    // [国語の点数,英語の点数,数学の点数,理科の点数,社会の点数]という配列を作成できる。
    let subject_points = [Number($('#national_language').val()),
                          Number($('#english').val()),
                          Number($('#mathematics').val()),
                          Number($('#science').val()),
                          Number($('#society').val())
                          ];

    // さらにこのような記述をすることで、「合計点：」となっている右の部分に合計点が出力される
    let sum = subject_points[0];
    sum = sum + subject_points[1];
    sum = sum + subject_points[2];
    sum = sum + subject_points[3];
    sum = sum + subject_points[4];
    $("#sum_indicate").text(sum);
    //点数の合計を示す

    let number = subject_points.length;
    let average = (sum / number);
    $("#average_indicate").text(average);

    // ここに、上記を参考にして平均点を出力する処理を書き込む
  };

  function get_achievement(){
    let average = $("#average_indicate").text();
    if (average>=80){
      $("#evaluation").text("A");
    }
    else if (average>=60) {
      $("#evaluation").text("B");

    }
    else if (average>=40) {
      $("#evaluation").text("C");

    }
    else {
      $("#evaluation").text("D");

    }
    // ここに、ランクの値の文字列（平均点が80点以上なら"A"、60点以上なら"B"、40点以上なら"C"、それ以下なら"D"）を出力する処理を書き込む
  };

  function get_pass_or_failure(){
    let subject_points = [Number($('#national_language').val()),
                          //国語に入力された点数
                          Number($('#english').val()),
                          Number($('#mathematics').val()),
                          Number($('#science').val()),
                          Number($('#society').val())
                          ];
                          //Number  入力値が数字である。
    let points= subject_points.length;
    let judge = "合格"
    for (let i=0; i<points; i++ ){
    if (subject_points[i]< 60){
    judge="不合格";
    break;
      }
    }
    $("#judge").text(judge);
  };

    // ここに、全ての教科が60点以上なら"合格"の文字列、一つでも60点未満の教科があったら"不合格"の文字列を出す処理を書き込む


  function judgement(){
    let a= $("#evaluation").text();
    let p= $("#judge").text();
    // ここに、「最終ジャッジ」のボタンを押したら「あなたの成績はAです。合格です」といった内容を出力する処理を書き込む
    // 下記の記述をすることで、「最終ジャッジ」のボタンを押すと「あなたの成績は（ここに「ランク」の値を入れる）です。（ここに「判定」の値を入れる）です」という文字の入った水色のフキダシが出力される処理が実装される。
    $('#declaration').append(`<label id="alert-indicate" class="alert alert-info">あなたの成績は${a}です。${p}です</label>`);
    //.append　要素を追記する。
  };

  $('#national_language, #english, #mathematics, #science, #society').change(function() {
    //数字が入力されればfunction score_indicateの処理が行われる。
    score_indicate();
  });

  $('#btn-evaluation').click(function() {
    //ランクというボタンが推されたら以下の処理をします。
    get_achievement();
  });

  $('#btn-judge').click(function() {
    get_pass_or_failure();
  });

  $('#btn-declaration').click(function() {
    $('#alert-indicate').remove();
    judgement();
  });
});
