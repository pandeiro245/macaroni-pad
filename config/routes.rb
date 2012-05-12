Macaronipad::Application.routes.draw do
  root :to => 'index#index'
  match '/auth/twitter/callback' => 'twitters#login'
  match '/logout' => 'twitters#logout'


  scope 'api' do
    match 'hopes/updt' => 'hopes#updt'
    match 'updt_last_tab' => 'api#updt_last_tab'
    match 'hopes' => 'hopes#viewer'
    match 'hopes/done_daily' => 'hopes#done_daily'
    match 'hopes/cancel_daily' => 'hopes#cancel_daily'
  end

end
