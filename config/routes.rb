Rails.application.routes.draw do
  # get "artifacts/index"
  # get "artifacts/show"
  # get "artifacts/new"
  # get "artifacts/edit"

  # root "sessions#new"
  root "homes#index"

  resources :homes

  resources :artifacts do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
     member do
      delete :delete_document
       get 'move_files'
       get 'step_2_move_files'
       get 'process_preceptor_eval'
       get 'process_formative_feedback'
       get 'process_informatics_feedback'
       get 'process_usmle_exam'
       get 'process_comp_excel'
       get 'process_bls_excel'
       get 'ultimate_method'

     end
     collection do
       get 'get_sub_components'
       get 'bulk_remove', controller: 'artifacts', action: :bulk_remove, to: 'artifacts#bulk_remove'
       get 'purge_all_documents', controller: 'artifacts', to: 'artifacts#purge_all_documents'
     end
   end

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
