Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#get 'top' => 'homes#top'
get "homes/about" => "homes#about", as: "about"
root to: 'homes#top'

resources :books, only: [:top, :new, :create, :index, :show, :edit, :destroy]
resources :users, only: [:top, :show, :edit, :index]
end
