Macaronipad::Application.routes.draw do
  match '/auth/twitter/callback' => 'twitters#login'
  match '/logout' => 'twitters#logout'

  scope 'api' do
    match 'hopes/updt' => 'hopes#updt'
    match 'updt_last_tab' => 'api#updt_last_tab'
    match 'hopes' => 'hopes#viewer'
  end
  root :to => 'index#index'
end
