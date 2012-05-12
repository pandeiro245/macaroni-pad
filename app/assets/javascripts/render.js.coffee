window.renders = () ->
  $('body').prepend('<div id="calendar"></div>')
  $('body').prepend('<div id="detail"></div>')
  $('body').prepend('<div id="help"></div>')
  $('#calendar').html(
    $p.heading(1,"毎日の目標")
  )

