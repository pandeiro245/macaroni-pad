
$(document).ready(() ->
  $p.conf = {
    pages:{
      "index":[],
      "setting":[],
      "friends":[],
      "help":[]
    }
  }
  if viewer_status == "login"
    $p.api('hopes', (data) ->
      $p.init(renders)
    )
  else
    renderLogin()
)
