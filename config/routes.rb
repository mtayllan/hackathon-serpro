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
    resources :contacts, except: [:show]
    resources :medics, except: [:show]
    resource :organization, only: %i[edit update]
    resources :organization_health_plan_expertises, except: %i[show]
    resources :organization_users, except: [:show]
    resources :occupancies, only: :create
  end
end
