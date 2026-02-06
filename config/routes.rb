Rails.application.routes.draw do
  # get "artifacts/index"
  # get "artifacts/show"
  # get "artifacts/new"
  # get "artifacts/edit"

  # root "sessions#new"
  root "homes#index"

  resources :homes

  resources :artifacts

  resources :cohorts do
    get :students
  end

  resources :categories do
    get :subcategories
  end

  resources :searches do
    collection do
      get 'download_file'
    end
  end

  resource :session, only: [:new, :create, :destroy]

  resources :passwords, param: :token
end
