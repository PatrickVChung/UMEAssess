Rails.application.routes.draw do
  namespace :admin do
      resources :advisors
      resources :advisor_types
      resources :artifacts
      resources :badging_dates
      resources :categories
      resources :competencies
      resources :csl_feedbacks
      resources :eg_cohorts
      resources :eg_members
      resources :eg_reasons
      resources :epas
      resources :epa_masters
      resources :epa_reviews
      resources :events
      resources :fom_exams
      resources :fom_labels
      resources :formative_feedbacks
      resources :meetings
      resources :new_competencies
      resources :permission_groups
      resources :permission_ls_groups
      resources :preceptor_assesses
      resources :preceptor_evals
      resources :sessions
      resources :sub_categories
      resources :users

      root to: "advisors#index"
    end
  # get "artifacts/index"
  # get "artifacts/show"
  # get "artifacts/new"
  # get "artifacts/edit"

  namespace :api do
    namespace :v1 do
      post 'microsoft_bookings', to: 'bookings_webhook#create'
    end
  end


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
    member do
      get :subcategories # Creates /categories/:id/subcategories
    end
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
      get 'process_mid_block'

    end
  end
  resources :users do
    resources :competencies, param: :user_id, only: [:index, :new]
    resources :overall_progresses, param: :user_id, only: [:index]
    resources :new_competencies, param: :user_id, only: [:index, :new]
    collection do
        get "update_loa", action: :update_loa, to: "users#update_loa#"
        get "save_update_loa", action: :save_update_loa, to: "users#save_update_loa"
        get "update_career_interests", action: :update_career_interests, to: "users#update_career_interests"
        get "save_career_interests", action: :save_career_interests, to: "users#save_career_interests"
    end
  end
  resources :badging_dates
  resources :eg_members
  resources :new_competencies do
    collection  do
      get 'competency_rpt', action: :competency_rpt, controller: 'new_competencies', to: 'new_competencies#competency_rpt'
      get 'download_file', param: :file_name, action: :download_file,  controller: 'new_competencies', to: 'new_competencies#download_file'
    end
  end

  resources :fix_eg_members, only: :index do
    collection do
      get  :process_eg_file
      get  :reviewer_update
      get  :eg_assignment
      get  :download_file
      delete  :delete_cohort
    end
  end

  resources :epa_reviews do
    collection do
      post 'local_storage'
      get 'unbadged', action: :unbadged
    end
  end

  resources :epa_masters do
    collection  do
      get 'search_student'
      get 'eg_mismatch', action: :eg_report, controller: 'epa_masters', to: 'epa_masters#eg_mismatch'
      get 'eg_badged', action: :eg_report, controller: 'epa_masters', to: 'epa_masters#eg_badged'
      get 'epa_qa', controller: 'epa_masters', to: 'epa_masters#epa_qa'
      get 'wba_epa', action: :wba_epa, controller: 'epa_masters', to: 'epa_masters#wba_epa'
      get 'wba_clinical', action: :wba_clinical, controller: 'epa_masters', to: 'epa_masters#wba_clinical'
      get 'download_file', param: :file_name, action: :download_file,  controller: 'epa_masters', to: 'epa_masters#download_file'
      get 'badged_graph', action: :badged_graph, controller: 'epa_masters', to: 'epa_masters#badged_graph'
      get 'wba_epa_graph', action: :wba_epa_graph, controller: 'epa_masters', to: 'epa_masters#wba_epa_graph'
      get 'average_wba_epa', action: :average_wba_epa, controller: 'epa_masters', to: 'epa_masters#average_wba_epa'
      get 'query_ai', action: :query_ai, controller: 'epa_masters', to: 'epa_masters#query_ai'

    end
  end

  resources :eg_members

  resources :fix_eg_members, only: :index do
    collection do
      get  :process_eg_file
      get  :reviewer_update
      get  :eg_assignment
      get  :download_file
    end
  end

  resources :badging_dates
  resources :competencies, only: [:index, :new, :create, :destroy]
  resources :new_competencies do
    collection  do
      get 'competency_rpt', action: :competency_rpt, controller: 'new_competencies', to: 'new_competencies#competency_rpt'
      get 'download_file', param: :file_name, action: :download_file,  controller: 'new_competencies', to: 'new_competencies#download_file'
    end
  end

  resources :advisor_types do
    resources :advisors, only: :index
    member do
      get :meeting_advisors
      get :primary_reasons
    end
  end

  resources :advisors do
    member do
      get :availabilities
    end
  end

  # resources :advisor_types do
  #   resources :advisors, only: :index
  # end


  resources :meeting_reports

  resources :events do
    collection do
      get 'create_batch_appointments', action: :create_batch_appointments, controller: 'events', to: 'events#create_batch_appointments'
      post 'save_batch_appointments'
      get 'create_random_appointments', to: 'events#create_random_appointments'
      get 'list_past_valid_appointments', action: :list_past_valid_appointments, controller: 'events', to: 'events#list_past_valid_appointments'
      get 'save_all', param: :appointments,  action: :save_all, controller: 'events', to: 'events#save_all'
      get 'save_all_random', param: :appointments,  action: :save_all_random, controller: 'events', to: 'events#save_all_random'
      get 'check_events', action: :check_events, controller: 'events', to: 'events#check_events'
      get 'resend_calendar_invite', action: :resend_calendar_invite, controller: 'events', to: 'events#resend_calendar_invite'
      get 'resend_invite', action: :resend_invite, controller: 'events', to: 'events#resend_invite'
      get 'batch_delete', action: :batch_delete, controller: 'events', to: 'events#batch_delete'
      get 'delete_all', action: :delete_all, controller: 'events', to: 'events#delete_all'
      get 'get_events_by_advisor', action: :get_events_by_advisor, controller: 'events', to: 'events#get_events_by_advisor'
      post 'calendly_click', action: :calendly_click, controller: 'events', to: 'events#calendly_click'
      get 'download_file', param: :file_name, action: :download_file,  controller: 'events', to: 'events#download_file'
      get 'get_ics_files', param: :ics_file, controller: 'events', to: 'events#get_ics_files'
      get 'purge_ics_files',  param: :ics_file, action: :purge_ics_files, to: 'events#purge_ics_files'
    end
  end

  resource :session, only: [:new, :create, :destroy]

  resources :passwords, param: :token

  resources :meetings do
    member do
      get 'show_detail'
      patch :cancel # Using PATCH because we are updating the record
    end
  end

  resources :course_schedules
  resources :courses do
    collection do
      get 'contact_form'
    end
  end

  resources :create_pdfs do
    collection do
      get "create_and_move_pdf", to: 'create_pdfs#create_and_move_pdf'
      get "move_pdf", to: 'create_pdfs#move_pdf'
    end
  end
  resources :usmle_exams

  # Error pages routing
    match "/404", to: "errors#show", via: :all
    match "/422", to: "errors#show", via: :all
    match "/500", to: "errors#show", via: :all

end
