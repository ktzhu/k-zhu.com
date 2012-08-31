KZhuCom::Application.routes.draw do
  root :to => "projects#index"

  resources :about, controller: :pages, only: [:index]
  get '/contact', to: 'pages#contact'
  get '/labs', to:'pages#labs'
  resources :projects
  resources :users

  # Admin
  get "admin" => "admin#index"

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
end
