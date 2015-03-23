Rails.application.routes.draw do

  devise_for :users
  get 'schedule/index'

  resources :appointments, except: [:index, :edit, :update]

  root 'schedule#index'
end
