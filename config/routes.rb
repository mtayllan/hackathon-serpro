# frozen_string_literal: true

Rails.application.routes.draw do
  authenticate :admin do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end

  devise_for :admins
  devise_for :organization_users, controllers: {
    sessions: 'organization_users/sessions'
  }

  namespace :dashboard do
    get '/', to: 'main#index'
    get 'main/index'
    resources :medics, except: :show
    resource :organization, only: %i[edit update]
    resources :contacts, except: :show
    resources :organization_users, except: :show
    resources :organization_health_plan_expertises, except: :show
    resources :occupancies, only: :create
    resource :emergency_medics, only: %i[create destroy]
    resources :reports, only: %i[index show]
  end

  root to: 'app#index'
  resources :solicitations, only: :create

  namespace :app do
    get '/', to: 'main#index'
    resources :organizations, only: %i[index show]
    resources :reports, only: %i[new create]
  end
end
