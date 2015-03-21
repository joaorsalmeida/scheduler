Rails.application.routes.draw do

  devise_for :users
  get 'schedule/index'

  resource :appointments, only: [:new, :create, :show, :destroy]

  root 'schedule#index'
end
