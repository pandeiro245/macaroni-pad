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


