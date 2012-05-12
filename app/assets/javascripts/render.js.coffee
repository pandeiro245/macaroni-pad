window.renders = () ->
  e = ""
  e += $p.heading(1,"0日連続達成中")
  for i, val of $p.data['hopes']['hopes']
    if typeof($p.data['hopes']['hope_dailies'][i]) == 'undefined' or $p.data['hopes']['hope_dailies'][i] == false
      e += "<img src=\"/assets/sp/star_#{i}.png\" />#{
        if typeof($p.data['hopes']['hopes'][i]) != 'undefined'
          $p.data['hopes']['hopes'][i]
        else
          ''
      }<a href=\"##{i}\" class=\"do_done_hope_daily\">できた！</a><br />"
  $('#index').html(e)

  e = ""
  e += $p.heading(1,"友達")
  $('#friends').html(e)


  e = ""
  e += $p.heading(1,"設定")
  for i in [1..5]
    e += "<img src=\"/assets/sp/star_#{i}.png\" /><input type=\"text\" id=\"updt_hope_#{i}\" value=\"#{
      if typeof($p.data['hopes']['hopes'][i]) != 'undefined'
        $p.data['hopes']['hopes'][i]
      else
        ''
    }\"/>"
    e += "<a href=\"##{i}\" class=\"do_cancel_hope_daily\">キャンセル</a>" if typeof($p.data['hopes']['hope_dailies'][i]) != 'undefined' and $p.data['hopes']['hope_dailies'][i] == true
    e += "<br />"
  e += "「キャンセル」を押すと今日の分の「完了」を取り消します"
  e += "<input type=\"submit\" value=\"保存\" id=\"do_updt_hopes\"/><br /><br />"
  e += $p.div({id:"chars"}, """#{
    $p.div({id:"cha_1"}, "<img src=\"/assets/sp/cha_1.png\" />") +
    $p.div({id:"cha_2"}, "<img src=\"/assets/sp/cha_2.png\" />")
  }""")

  $('#setting').html(e)


  e = ""
  e += $p.heading(1,"マカロニパッド？")
  e += $p.p({},"""マカロニパッドは
 「一日の終わりを 楽しくする」
  為に作られた習慣タスク管理ツールです。

 「英語を5分だけ勉強する」
 「誰かに感謝の気持ちを伝える」
  など、毎日無理なく続けられそうな
  目標を最大5個まで登録しておくと
  それらをワンクリックで管理できます。

  全て完了にすると野菜の妖精が
  お祝いしてくれます。
  一日の終わりにちょっとした達成感を
  味わいながら、明日に備えて
  ゆっくりお休みくださいませ。
  """)
  $('#help').html(e)

  prepareUpdtHope()
  prepareDoneHopeDaily()
  prepareCancelHopeDaily()
