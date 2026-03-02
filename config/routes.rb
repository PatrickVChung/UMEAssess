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

  resources :fom_exams do
    collection do
      get 'list_all_blocks', param: :id,  controller: 'fom_exams', to: 'fom_exams#list_all_blocks'
      get 'export_block', controller: 'fom_exams', to: 'fom_exams#export_block'
      get 'process_csv', param: :file_name, controller: 'fom_exams', to: 'fom_exams#process_csv'
      get 'process_fom', controller: 'fom_exams', action: :index, to: 'fom_exams#process_fom'
      get 'download_file', param: :file_name, action: :download_file,  controller: 'fom_exams', to: 'fom_exams#download_file'
      post 'send_alerts', controller: 'fom_exams', action: :send_alerts, to: 'fom_exams#send_alerts'
      get 'send_alerts', controller: 'fom_exams', action: :send_alerts, to: 'fom_exams#send_alerts'
      get 'display_fom', controller: 'fom_exams', action: :display_fom, to: 'fom_exams#display_fom'
      get 'unsubscribe'

    end
  end
  resources :users do
    collection do
        get "update_loa", action: :update_loa, to: "users#update_loa#"
        get "save_update_loa", action: :save_update_loa, to: "users#save_update_loa"
        get "update_career_interests", action: :update_career_interests, to: "users#update_career_interests"
        get "save_career_interests", action: :save_career_interests, to: "users#save_career_interests"
    end
  end
  
  resource :session, only: [:new, :create, :destroy]

  resources :passwords, param: :token
end
