Rails.application.routes.draw do
  constraints subdomain: 'api' do
    resource :users
    resources :movies
    get 'recommendations', to: 'movies#recommendations'
    post '/auth/login', to: 'authentication#login'
    get '/*a', to: 'application#not_found'
  end
end
