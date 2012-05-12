window.$p = {
data:{}
conf:{}
hashes:{}
init:(renders) ->
  tabs = @div({id:"tabs"},"""#{
  e = ''
  for key, val of @conf['pages']
    e += "<a href=\"#tab_#{key}\" id=\"tab_#{key}\" href=\"#\"><img src=\"/assets/sp/#{key}_btn_off.png\" /></a>"
  e
  }""")
  e2 = ""
  for key, val of @conf['pages']
    e2 += @div({id:key},"now loading..")
  $('body').prepend(tabs + e2)
  renders()
  @initImgHover()

  $(window).bind("hashchange", () ->
    $p.hashChange(this.location.hash)
  )

hashChange:(hash) ->
  act = hash.replace(/#*/g,'').split('_')
  if act[0] == "invite"
    invite()
  else if act[0] == "tab"
    @tab_change(act[1])
  else if act[0] == "remove"
    @remove(act[1], act[2])

initImgHover:() ->
  $("img[src*='_on']").addClass("current")
  $("img,input").mouseover(() ->
    if ($(this).attr("src"))
      $(this).attr("src",$(this).attr("src").replace("_off.", "_on."))
  )
  $("img[class!='current'],input").mouseout(() ->
    if ($(this).attr("src"))
      $(this).attr("src",$(this).attr("src").replace("_on.", "_off."))
  )

cache_or_api:(key, callback) ->
  if localStorage[key]?
    @cache(key, callback)
  else
    @api(key, callback)

api_last:{key:"", updated_at:""}

api: (key, callback = null, data = null) ->
  if data
    type = "POST"
  else
    type = "GET"

  $.ajax({
    type:type
    url:"/api/#{key}",
    data:data,
    success:(data) ->
      $p.data[key] = data
      localStorage[key] = JSON.stringify(data)
      if callback != null
        callback(data)
      else
        alert(data['msg'])
        location.reload()
    })

remove:(key, id) ->
  $p.api(key + '/remove/' + id, (data) ->
     alert(data['msg'])
     location.reload()
  )

cache:(key, callback) ->
    data = JSON.parse(localStorage[key])
    @data[key] = data
    callback(data)

div:(params, data="") ->
  @tag('div', params, data)

span:(params, data="") ->
  @tag('span', params, data)

quote:(params, data="") ->
  @tag('blockquote', params, data)

p:(params, data="") ->
  @tag('p', params, data)


tag:(name, params, data="") ->
  e = ""
  data = data.replace(/\n/g, '<br />') if name is "p" or name is "blockquote"
  for key, val of params
    e += " #{key}=\"#{val}\""
  return """
    <#{name}#{e}>
    #{data}
    </#{name}>
  """

heading:(level, data) ->
  return "<h#{level}>#{data}</h#{level}>"

hr:(level) ->
  if level == 1
    return "<div align=\"center\"><img src=\"/assets/sp/border_1.png\" width=\"294px\" height=\"7px\" /></div>"
  else
    return "<div align=\"center\"><img src=\"/assets/sp/border_2.png\" width=\"305px\" height=\"2px\" /></div>"
    
input:(params) ->
  return "<input id=\"#{params['id']}\" value=\"\" />"

submit:(params) ->
  return "<input id=\"#{params['id']}\" type=\"submit\" value=\"#{params['val']}\" />"

plain:(data) ->
  return data

link:(title, params) ->
  return "<a href=\"##{params['href']}\" class=\"#{params['class']}\">#{title}</a>"


select:() ->
  e = ""
  for year in [2030..1830]
    e += "<option value=\"#{year}\">#{year}年</option>"
  e

tab_change:(tab_id) ->
  for key, val of @conf['pages']
    $('#' + key).css('display', 'none')
  $('#'+tab_id).css('display', 'block')
  $thisimg = $('#tab_' + tab_id + ' img')
  $thisimg.attr("src", $thisimg.attr("src").replace("_off.", "_on."))
  @do_adjust()
  data = {tab:tab_id}
  mumei = () ->
  @api('updt_last_tab', mumei, data)

zero:(num) ->
  if num < 10
    return  "0" + num
  else
    return num

do_adjust:() ->
  if gadget?
    gadgets.window.adjustHeight()
}
