Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'memos#new'
  resources :memos, only: [:new, :create, :show] do   
    member do
      get :tag
    end
  end
end
