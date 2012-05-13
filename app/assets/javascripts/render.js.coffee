window.renders = () ->
  #e += $p.heading(1,"0日連続達成中")
  if typeof($p.data['hopes']['hopes'][1]) == 'undefined'
    e = renderNohope()
  else if  isDone()
    e = renderDoneHope()
  else
    e = renderIndex()

  $('#index').html(e)

  e = ""
  e += $p.heading(1,'<img src="/assets/sp/twitter.png" />')

  e += '<div class="center"><a href="/logout"><img src="/assets/sp/logout.png" /></a></div>'

  $('#friends').html(e)

  e = ""
  e += $p.heading(1, '<img src="/assets/sp/h_setting.png" />')
  e += "<table>"
  for i in [1..5]
    e += '<tr><td class=\"item\">'
    e += "<img src=\"/assets/sp/star_#{i}.png\" /><div class=\"text\"><input type=\"text\" id=\"updt_hope_#{i}\" value=\"#{
      if typeof($p.data['hopes']['hopes'][i]) != 'undefined'
        $p.data['hopes']['hopes'][i]
      else
        ''
    }\"/></div></td><td>"
    e += "<a href=\"##{i}\" class=\"do_cancel_hope_daily\"><img src=\"/assets/sp/cancel.png\" /></a>" if typeof($p.data['hopes']['hope_dailies'][i]) != 'undefined' and $p.data['hopes']['hope_dailies'][i] == true
    e += "</td></tr>"
  e += "</table>"
  e += "「キャンセル」を押すと今日の分の「完了」を取り消します"
  e += "<div class=\"submit\"><a href=\"#\" id=\"do_updt_hopes\" align=\"center\"><img src=\"/assets/sp/submit.png\" /></a></div>"
  e += """<table id="chars">
  <tr>
  <td><img src=\"/assets/sp/cha_1.png\" /></td>
  <td>頑張って！！</td>
  <td><img src=\"/assets/sp/cha_2.png\" /></td>
  </tr>
  </table>
  """

  $('#setting').html(e)


  e = ""
  e += $p.heading(1,'<img src="/assets/sp/help.png" />')
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





window.renderIndex = () ->
  e = ""
  e += '<table>'
  for i, val of $p.data['hopes']['hopes']
    if typeof($p.data['hopes']['hope_dailies'][i]) == 'undefined' or $p.data['hopes']['hope_dailies'][i] == false
      e += '<tr><td class=\"item\">'
      e += "<img src=\"/assets/sp/star_#{i}.png\" /><div class=\"text\">#{
        if typeof($p.data['hopes']['hopes'][i]) != 'undefined'
          $p.data['hopes']['hopes'][i]
        else
          ''
      }</div></td><td><a href=\"##{i}\" class=\"do_done_hope_daily\"><img src=\"/assets/sp/done.png\" class=\"done\" /></a></td></tr>"
  e += '</table>'
  e

window.renderNohope = () ->
  e = '''
    <div id="nohope">
      <div>
      目標を１つ以上登録してね☆
      </div>
      <img src="/assets/sp/cha_6.png" class="cha" />
    </div>

  '''
window.renderDoneHope = () ->
  e = '''
    <div id="done_hope">
      <div>
      今日の目標達成！<br />
      今日はゆっくり休んで明日に備えてね☆
      </div>
      <img src="/assets/sp/cha_5.png" class="cha" />
    </div>

  '''

window.renderLogin = () ->
  e = '''
    <div id="login">
      <img src="/assets/sp/logo.png" />
      <a href="/auth/twitter"><img src="/assets/sp/login.png" /></a>
      <img src="/assets/sp/cha_3.png" class="cha" />
    </div>

  '''
  $('body').html(e)

