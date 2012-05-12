window.renders = () ->
  e = ""
  e += $p.heading(1,"毎日の目標")
  for i in [1..5]
    e += "#{i}:<input type=\"text\" /><a href=\"#\">やった！</a><br />"
  $('#index').html(e)

  e = ""
  e += $p.heading(1,"応援メッセージ")
  $('#messages').html(e)


  e = ""
  e += $p.heading(1,"設定")
  for i in [1..5]
    e += "#{i}:<input type=\"text\" /><br />"
  $('#setting').html(e)


  e = ""
  e += $p.heading(1,"ヘルプ")
  $('#help').html(e)
