Macaronipad::Application.routes.draw do
  root :to => 'index#index'
  match '/auth/twitter/callback' => 'twitters#login'
end
