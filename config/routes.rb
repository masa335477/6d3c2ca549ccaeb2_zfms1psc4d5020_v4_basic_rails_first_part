Rails.application.routes.draw do
  get 'blogs', to:'blogs#index'
  resources :blogs, only: [:create, :new, :edit, :show, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
end
