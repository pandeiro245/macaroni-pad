window.prepareUpdtHope = () ->
  $("#do_updt_hopes").click(() ->
    data = {}
    for i in [1..5]
      data[i] = $("#updt_hope_#{i}").val()
    $p.api('hopes/updt', null ,data)
  )

