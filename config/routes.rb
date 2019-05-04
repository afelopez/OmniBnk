Rails.application.routes.draw do
  constraints subdomain: 'api' do
    resource :users
    resources :movies
    post '/auth/login', to: 'authentication#login'
    get '/*a', to: 'application#not_found'
  end
end
