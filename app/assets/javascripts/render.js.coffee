window.renders = () ->
  e = ""
  e += $p.heading(1,"0日連続達成中")
  for i in [1..5]
    e += "<img src=\"/assets/sp/star_#{i}.png\" /><input type=\"text\" /><a href=\"#\">できた！</a><br />"
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
    }\"/><br />"
  e += "<input type=\"submit\" value=\"保存\" id=\"do_updt_hopes\"/><br />"
  e += $p.div({id:"cha_1"}, "<img src=\"/assets/sp/cha_1.png\" />")
  e += $p.div({id:"cha_2"}, "<img src=\"/assets/sp/cha_2.png\" />")

  $('#setting').html(e)


  e = ""
  e += $p.heading(1,"マカロニパッド？")
  e += """マカロニパッドは
 「一日の終わりを 楽しくする」
  為に作られたタスク管理ツールです。

 「英語を5分だけ勉強する」
 「誰かに感謝の気持ちを伝える」
  など、毎日簡単に続けられそうな
  目標を最大5個まで登録しておくと
  それらをワンクリックで管理できます。

  全て完了にすると野菜の妖精が
  お祝いしてくれます。
  """

  e += $p.heading(2,"毎日やることを登録しよう")
  e += """「一日の終わりを楽しくする」をテーマに
  2012年5月12日にマカロニパッドは産まれました"""

  $('#help').html(e)

  prepareUpdtHope()

