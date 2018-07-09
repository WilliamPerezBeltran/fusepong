Rails.application.routes.draw do
  resources :voters
	#Aquí guardamos las propuestas dentro de los recursos de candidatos 
  resources :candidates do
    resource :votes 
  	resources :proposals, only: [:create]
  end 
  get 'proposals_candidate/:id',as:'proposals_candidate', to: 'candidates#proposals_candidate'
  get 'login', to: 'sessions#new'
  post  'login', to: 'sessions#create'
  get 'logi_incorrect', to: 'sessions#no_exist'
  delete 'logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create]
  root 'mains#index'
  get 'admin', to:'mains#admin'
  get 'consummate', to: 'votes#vote_consummate'
  get 'admin', to: 'users#view_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
