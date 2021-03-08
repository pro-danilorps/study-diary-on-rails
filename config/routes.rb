Rails.application.routes.draw do
  root "study_items#index"
  resources :study_items, only: [:new, :create, :edit, :update, :destroy]
end
