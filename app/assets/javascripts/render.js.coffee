window.renders = () ->
  e = ""
  e += $p.heading(1,"毎日の目標")
  for i in [1..5]
    e += "#{i}:<input type=\"text\" /><br />"
  $('#hopes').prepend(e)

