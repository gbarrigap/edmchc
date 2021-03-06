# frozen_string_literal: true

Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'home#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'admin', to: 'admin#index', as: :admin
  get 'home', to: 'home#index'

  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :users, only: [:edit, :update]

  resources :attachments, only: [:destroy]

  resources :encuentros, shallow: true do
    resources :exponentes,
              :coordinadores,
              :charlas,
              :conciertos
  end

  get '/charlas/:id/fotos', to: 'charlas#fotos', as: :charla_fotos
  get '/conciertos/:id/fotos', to: 'conciertos#fotos', as: :concierto_fotos
  get '/encuentros/:id/configuracion', to: 'encuentros#configuracion', as: :encuentro_configuracion

  get '/encuentro/quienes_somos/ver/:id', to: 'home#ver_quienes_somos', as: :ver_quienes_somos
  get '/encuentro/cooordinador/ver/:id', to: 'home#ver_coordinador', as: :ver_coordinador
  get '/exponentes/ver/:id', to: 'home#ver_exponente', as: :ver_exponente

  get '/fotos_generales', to: 'home#fotos_generales', as: :ver_fotos_generales
  get '/fotos_ensayos', to: 'home#fotos_ensayos', as: :ver_fotos_ensayos
end
