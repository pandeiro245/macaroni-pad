window.mp ={
}

$(document).ready(() ->
  $p.conf = {
    pages:{
      "index":[],
      "setting":[],
      "friends":[],
      "help":[]
    }
  }
  $p.api('hopes', (data) ->
    $p.init(renders)
  )
)
