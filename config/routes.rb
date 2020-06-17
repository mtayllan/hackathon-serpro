# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins
  devise_for :organization_users, controllers: {
    sessions: 'organization_users/sessions'
  }

  namespace :dashboard do
    get '/', to: 'main#index'
    get 'main/index'
    resources :medics, except: [:show]
  end
end
