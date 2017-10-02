Rails.application.routes.draw do
  resources :cocktails do
    resources :doses, only: [ :edit, :new, :create, :destroy, :update ]
  end
  root 'cocktails#index'
end
