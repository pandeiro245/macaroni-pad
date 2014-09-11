window.isDone = () ->
  res = true
  for key, val of $p.data['hopes']['hopes']
    if typeof($p.data['hopes']['hope_dailies'][key]) == 'undefined' or $p.data['hopes']['hope_dailies'][key] == false
      res = false
  res

window.prepareUpdtHope = () ->
  $("#do_updt_hopes").click(() ->
    data = {}
    for i in [1..5]
      data[i] = $("#updt_hope_#{i}").val()
    $p.api('hopes/updt', null ,data)
  )

window.prepareDoneHopeDaily = () ->
  $(".do_done_hope_daily").click(() ->
    data = {}
    data["hope_number"] = $(this).attr('href').replace(/#/,'')
    $p.api('hopes/done_daily', null ,data)
  )

window.prepareCancelHopeDaily = () ->
  $(".do_cancel_hope_daily").click(() ->
    data = {}
    data["hope_number"] = $(this).attr('href').replace(/#/,'')
    $p.api('hopes/cancel_daily', null ,data)
  )


