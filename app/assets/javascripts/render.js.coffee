window.renders = () ->
  e = ""
  e += $p.heading(1,"0日連続達成中")
  for i in [1..5]
    e += "<img src=\"/assets/sp/star_#{i}.jpg\" /><input type=\"text\" /><a href=\"#\">できた！</a><br />"
  $('#index').html(e)

  e = ""
  e += $p.heading(1,"友達")
  $('#messages').html(e)


  e = ""
  e += $p.heading(1,"設定")
  for i in [1..5]
    e += "<img src=\"/assets/sp/star_#{i}.jpg\" /><input type=\"text\" id=\"updt_hope_#{i}\" /><br />"
  e += "<input type=\"submit\" value=\"保存\" id=\"do_updt_hopes\"/><br />"
  e += $p.div({id:"cha_1"}, "<img src=\"/assets/sp/cha_1.png\" />")
  e += $p.div({id:"cha_2"}, "<img src=\"/assets/sp/cha_2.png\" />")

  $('#setting').html(e)


  e = ""
  e += $p.heading(1,"マカロニパッド？")
  e += """「一日の終わりを楽しくする」をテーマに
  2012年5月12日にマカロニパッドは産まれました"""

  e += $p.heading(2,"毎日やることを登録しよう")
  e += """「一日の終わりを楽しくする」をテーマに
  2012年5月12日にマカロニパッドは産まれました"""

  $('#help').html(e)

  prepareUpdtHope()

