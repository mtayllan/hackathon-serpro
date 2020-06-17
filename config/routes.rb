# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :dashboard do
    get '/', to: 'main#index'
    get 'main/index'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins
  devise_for :organization_users, controllers: { sessions: 'organization_users/sessions' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'application#index'
  get '/login', to: 'application#login'
end
