Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#get 'top' => 'homes#top'
get "home/about" => "homes#about", as: "about"
root to: 'homes#top'

# resources :post_images, only: [:new, :create, :index, :show, :destroy] do
resources :books, only: [:top, :new, :create, :index, :show, :edit, :update, :destroy] do
resource :favorites, only: [:create, :destroy]
resources :post_comments, only: [:create, :destroy]
end

# resources :books, only: [:top, :new, :create, :index, :show, :edit, :update, :destroy]
resources :users, only: [:top, :show, :edit, :index, :update]
resources :posts, only: [:index, :show, :create]

end

# resources :posts do
#   resource :favorites, only: [:create, :destroy]
# end
# end
