Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'homes#index'
get "home/about" => "homes#about"
get 'users' => 'users#index'

resources :users, only:[:index, :show, :edit, :update, :create, :new]

resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
	 resource :favorites, only: [:create, :destroy]
	resources :book_comments, only: [:create, :destroy]
end

end
