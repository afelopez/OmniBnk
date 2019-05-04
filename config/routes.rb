Rails.application.routes.draw do
  constraints subdomain: 'api' do
    resources :users, param: :_username
    post '/auth/login', to: 'authentication#login'
    get '/*a', to: 'application#not_found'
  end
end
