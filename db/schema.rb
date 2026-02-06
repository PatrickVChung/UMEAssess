# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2026_02_04_171627) do
  create_schema "source"
  create_schema "target"
  create_schema "transform"

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "uuid-ossp"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "advisors", force: :cascade do |t|
    t.string "advisor_type"
    t.string "name"
    t.string "email"
    t.string "status"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "title"
    t.string "specialty"
    t.string "formal_name"
    t.text "brief_cv"
  end

  create_table "artifacts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_artifacts_on_user_id"
  end

  create_table "badging_dates", force: :cascade do |t|
    t.integer "permission_group_id"
    t.date "release_date"
    t.date "last_review_end_date"
    t.date "next_review_end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chart_series", id: :serial, force: :cascade do |t|
    t.integer "chart_id"
    t.text "group_filter"
    t.text "entity_filter"
    t.text "category_filter"
    t.text "question_filter"
    t.text "question_options_filter"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["chart_id"], name: "index_chart_series_on_chart_id"
  end

  create_table "charts", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.text "title"
    t.text "output"
    t.text "chart_type"
    t.text "aggregator_type"
    t.text "cols"
    t.text "rows"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["user_id"], name: "index_charts_on_user_id"
  end

  create_table "cohorts", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "permission_group_id"
    t.string "title"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["permission_group_id"], name: "index_cohorts_on_permission_group_id"
    t.index ["user_id"], name: "index_cohorts_on_user_id"
  end

  create_table "competencies", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "permission_group_id"
    t.string "student_uid"
    t.string "email"
    t.string "medhub_id"
    t.string "course_name"
    t.string "course_id"
    t.date "start_date"
    t.date "end_date"
    t.date "submit_date"
    t.string "evaluator"
    t.string "final_grade"
    t.string "environment"
    t.integer "ics1", limit: 2
    t.integer "ics2", limit: 2
    t.integer "ics3", limit: 2
    t.integer "ics4", limit: 2
    t.integer "ics5", limit: 2
    t.integer "ics6", limit: 2
    t.integer "ics7", limit: 2
    t.integer "ics8", limit: 2
    t.integer "mk1", limit: 2
    t.integer "mk2", limit: 2
    t.integer "mk3", limit: 2
    t.integer "mk4", limit: 2
    t.integer "mk5", limit: 2
    t.integer "pbli1", limit: 2
    t.integer "pbli2", limit: 2
    t.integer "pbli3", limit: 2
    t.integer "pbli4", limit: 2
    t.integer "pbli5", limit: 2
    t.integer "pbli6", limit: 2
    t.integer "pbli7", limit: 2
    t.integer "pbli8", limit: 2
    t.integer "pcp1", limit: 2
    t.integer "pcp2", limit: 2
    t.integer "pcp3", limit: 2
    t.integer "pcp4", limit: 2
    t.integer "pcp5", limit: 2
    t.integer "pcp6", limit: 2
    t.integer "pppd1", limit: 2
    t.integer "pppd2", limit: 2
    t.integer "pppd3", limit: 2
    t.integer "pppd4", limit: 2
    t.integer "pppd5", limit: 2
    t.integer "pppd6", limit: 2
    t.integer "pppd7", limit: 2
    t.integer "pppd8", limit: 2
    t.integer "pppd9", limit: 2
    t.integer "pppd10", limit: 2
    t.integer "pppd11", limit: 2
    t.integer "sbpic1", limit: 2
    t.integer "sbpic2", limit: 2
    t.integer "sbpic3", limit: 2
    t.integer "sbpic4", limit: 2
    t.integer "sbpic5", limit: 2
    t.text "prof_concerns"
    t.text "comm_prof_concerns"
    t.text "overall_summ_comm_perf"
    t.text "add_comm_on_perform"
    t.text "mspe"
    t.text "clinic_exp_comment"
    t.text "feedback"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["permission_group_id"], name: "index_competencies_on_permission_group_id"
    t.index ["user_id"], name: "index_competencies_on_user_id"
  end

  create_table "content_slugs", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.text "content"
    t.boolean "public"
    t.integer "sizex"
    t.integer "sizey"
    t.boolean "resizeable", default: true
  end

  create_table "course_schedules", force: :cascade do |t|
    t.bigint "course_id"
    t.integer "year"
    t.string "block"
    t.date "start_date"
    t.date "end_date"
    t.integer "no_of_seats"
    t.string "comment"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["course_id"], name: "index_course_schedules_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "category"
    t.string "course_number"
    t.string "course_name"
    t.string "content_type"
    t.integer "medhub_course_id"
    t.boolean "rural"
    t.boolean "continuity"
    t.boolean "available_through_the_lottery"
    t.string "department"
    t.string "course_purpose_statement"
    t.string "special_notes"
    t.boolean "prerequisites"
    t.string "required_prerequisites"
    t.boolean "waive_prereq_requirements"
    t.string "waive_notes"
    t.string "grading_method"
    t.string "duration"
    t.string "site"
    t.integer "weekly_workload"
    t.decimal "credits"
    t.string "course_director"
    t.string "course_director_email"
    t.string "course_coordinator"
    t.string "course_coordinator_email"
    t.string "qualified_assessor"
    t.string "qualified_assessor_email"
    t.text "competencies", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "competency_note"
  end

  create_table "cpxes", force: :cascade do |t|
    t.bigint "user_id"
    t.string "email"
    t.string "full_name"
    t.json "cpx_data"
    t.index ["email"], name: "index_cpxes_on_email", unique: true
    t.index ["user_id"], name: "index_cpxes_on_user_id"
  end

  create_table "csl_evals", force: :cascade do |t|
    t.bigint "user_id"
    t.string "csl_title"
    t.date "submit_date"
    t.string "cohorts"
    t.string "instructor"
    t.string "selected_student"
    t.integer "c1"
    t.integer "c2"
    t.integer "c3"
    t.integer "c4"
    t.integer "c5"
    t.integer "c6"
    t.integer "c7"
    t.integer "c8"
    t.integer "c9"
    t.text "feedback"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_csl_evals_on_user_id"
  end

  create_table "csl_feedbacks", force: :cascade do |t|
    t.bigint "user_id"
    t.string "csl_title"
    t.date "submit_date"
    t.string "cohorts"
    t.string "instructor"
    t.string "selected_student"
    t.string "c1"
    t.string "c1_feedback"
    t.string "c2"
    t.string "c2_feedback"
    t.text "feedback_strength"
    t.text "feedback_improve"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "response_id"
    t.index ["response_id"], name: "index_csl_feedbacks_on_response_id", unique: true
    t.index ["user_id"], name: "index_csl_feedbacks_on_user_id"
  end

  create_table "dashboard_widgets", id: :serial, force: :cascade do |t|
    t.integer "dashboard_id"
    t.integer "position"
    t.integer "sizex"
    t.integer "sizey"
    t.boolean "resizeable", default: true
    t.text "widget_type"
    t.integer "widget_id"
    t.string "widget_title", limit: 255
  end

  create_table "dashboards", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.text "theme"
    t.index ["user_id"], name: "index_dashboards_on_user_id"
  end

  create_table "data_migrations", id: :serial, force: :cascade do |t|
    t.text "version", null: false
  end

  create_table "eg_cohorts", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "permission_group_id"
    t.string "email"
    t.string "eg_full_name1"
    t.string "eg_email1"
    t.string "eg_full_name2"
    t.string "eg_email2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_eg_cohorts_on_user_id"
  end

  create_table "eg_members", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "eg_type"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eg_reasons", force: :cascade do |t|
    t.string "reason"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "epa_masters", force: :cascade do |t|
    t.string "epa"
    t.string "status"
    t.datetime "status_date", precision: nil
    t.datetime "expiration_date", precision: nil
    t.bigint "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id", "epa"], name: "by_user_epas", unique: true
    t.index ["user_id"], name: "index_epa_masters_on_user_id"
  end

  create_table "epa_reviews", force: :cascade do |t|
    t.string "epa"
    t.datetime "review_date1", precision: nil
    t.string "reviewer1"
    t.string "badge_decision1"
    t.string "trust1"
    t.text "evidence1"
    t.text "general_comments1"
    t.datetime "review_date2", precision: nil
    t.string "reviewer2"
    t.string "badge_decision2"
    t.string "trust2"
    t.text "evidence2"
    t.text "general_comments2"
    t.string "reviewable_type"
    t.bigint "reviewable_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "reason1"
    t.string "reason2"
    t.string "student_comments1"
    t.string "student_comments2"
    t.index ["epa", "id"], name: "by_epa_reviews", unique: true
    t.index ["reviewable_type", "reviewable_id"], name: "index_epa_reviews_on_reviewable_type_and_reviewable_id"
  end

  create_table "epas", force: :cascade do |t|
    t.datetime "submit_date", precision: nil
    t.string "student_assessed"
    t.string "epa"
    t.string "clinical_discipline"
    t.string "clinical_setting"
    t.string "clinical_assessor"
    t.string "assessor_name"
    t.string "no_of_times_with_super"
    t.integer "involvement"
    t.string "more_independent"
    t.boolean "encounter_complex"
    t.string "assessor_email"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "user_id"
    t.string "response_id"
    t.boolean "attending_faculty"
    t.string "other_role"
    t.string "meta_browser"
    t.string "meta_os"
    t.string "meta_device"
    t.string "meta_screen_size"
    t.index ["response_id"], name: "index_epas_on_response_id"
    t.index ["user_id"], name: "index_epas_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_date", precision: nil
    t.datetime "end_date", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.integer "advisor_id"
    t.index ["advisor_id", "id"], name: "index_events_on_advisor_id_and_id", unique: true
    t.index ["user_id", "id"], name: "index_events_on_user_id_and_id"
  end

  create_table "fileupload_settings", force: :cascade do |t|
    t.integer "permission_group_id"
    t.string "code"
    t.boolean "visible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_group_id", "code"], name: "index_fileupload_settings_on_permission_group_id_and_code", unique: true
  end

  create_table "fom_exams", force: :cascade do |t|
    t.string "course_code"
    t.datetime "submit_date", precision: nil
    t.decimal "comp1_wk1"
    t.decimal "comp1_wk2"
    t.decimal "comp1_wk3"
    t.decimal "comp1_wk4"
    t.decimal "comp1_wk5"
    t.decimal "comp1_wk6"
    t.decimal "comp1_wk7"
    t.decimal "comp1_wk8"
    t.decimal "comp1_wk9"
    t.decimal "comp1_wk10"
    t.decimal "comp1_wk11"
    t.decimal "comp1_wk12"
    t.decimal "comp1_dropped_score"
    t.string "comp1_dropped_quiz"
    t.decimal "comp2a_hss1"
    t.decimal "comp2a_hss2"
    t.decimal "comp2a_hss3"
    t.decimal "comp2a_hss4"
    t.decimal "comp2a_hss5"
    t.decimal "comp2a_hss6"
    t.decimal "comp2a_hssavg"
    t.decimal "comp2b_bss1"
    t.decimal "comp2b_bss2"
    t.decimal "comp2b_bss3"
    t.decimal "comp2b_bss4"
    t.decimal "comp2b_bss5"
    t.decimal "comp2b_bss6"
    t.decimal "comp2b_bss7"
    t.decimal "comp2b_bss8"
    t.decimal "comp2b_bss9"
    t.decimal "comp2b_bssavg"
    t.decimal "comp3_final1"
    t.decimal "comp3_final2"
    t.decimal "comp3_final3"
    t.decimal "comp4_nbme"
    t.decimal "comp5a_hss1"
    t.decimal "comp5a_hss2"
    t.decimal "comp5a_hss3"
    t.decimal "comp5a_hssavg"
    t.decimal "comp5b_bss1"
    t.decimal "comp5b_bss2"
    t.decimal "comp5b_bss3"
    t.decimal "comp5b_bss4"
    t.decimal "comp5b_bss5"
    t.decimal "comp5b_bssavg"
    t.decimal "summary_comp1"
    t.decimal "summary_comp2a"
    t.decimal "summary_comp2b"
    t.decimal "summary_comp3"
    t.decimal "summary_comp4"
    t.decimal "summary_comp5a"
    t.decimal "summary_comp5b"
    t.bigint "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "permission_group_id"
    t.decimal "comp2a_hss7"
    t.decimal "comp2b_bss10"
    t.decimal "comp2b_bss11"
    t.decimal "comp2b_bss12"
    t.date "course_end_date"
    t.decimal "comp2a_hss8"
    t.decimal "comp2a_hss9"
    t.decimal "comp2a_hss10"
    t.decimal "comp2a_hss11"
    t.decimal "comp2a_hss12"
    t.decimal "comp2a_hss13"
    t.decimal "comp2a_hss14"
    t.decimal "comp2a_hss15"
    t.decimal "comp2a_hss16"
    t.decimal "comp2a_hss17"
    t.decimal "comp2a_hss18"
    t.decimal "comp2a_hss19"
    t.decimal "comp2a_hss20"
    t.decimal "comp2a_hss21"
    t.index ["user_id", "permission_group_id", "course_code"], name: "by_user_permission_group_course_code", unique: true
    t.index ["user_id"], name: "index_fom_exams_on_user_id"
  end

  create_table "fom_labels", force: :cascade do |t|
    t.integer "permission_group_id"
    t.string "course_code"
    t.json "labels"
    t.boolean "block_enabled"
    t.index ["permission_group_id", "course_code"], name: "by_permission_group_course_code", unique: true
  end

  create_table "fom_remeds", force: :cascade do |t|
    t.integer "user_id"
    t.string "block"
    t.string "component_failed"
    t.string "component_desc"
    t.decimal "initial_test_result"
    t.string "areas_of_deficiency"
    t.decimal "re_test_result"
    t.string "passed_failed"
    t.integer "prev_comp_failures"
    t.integer "no_of_failures_to_date"
    t.string "acad_probation"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fom_remeds_on_user_id"
  end

  create_table "formative_feedbacks", force: :cascade do |t|
    t.bigint "user_id"
    t.string "block_code"
    t.string "csa_code"
    t.string "response_id"
    t.date "submit_date"
    t.string "q1"
    t.string "q2"
    t.string "q3"
    t.string "q4"
    t.string "q5"
    t.string "q6"
    t.string "q7"
    t.string "q8"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["response_id"], name: "index_formative_feedbacks_on_response_id"
    t.index ["user_id"], name: "index_formative_feedbacks_on_user_id"
  end

  create_table "goals", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "g_status"
    t.string "competency_tag"
    t.datetime "target_date", precision: nil
    t.integer "user_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "ipe_courses", primary_key: "course_id", id: { type: :string, limit: 10 }, force: :cascade do |t|
    t.string "course_code", limit: 20, null: false
    t.string "course_name", limit: 100

    t.unique_constraint ["course_code"], name: "ipe_courses_course_code"
  end

  create_table "lime_answer_l10ns", id: :serial, force: :cascade do |t|
    t.integer "aid", null: false
    t.text "answer", null: false
    t.string "language", limit: 20, null: false
    t.index ["aid", "language"], name: "lime_idx1_answer_l10ns", unique: true
  end

  create_table "lime_answers", primary_key: "aid", id: :serial, force: :cascade do |t|
    t.integer "qid", null: false
    t.string "code", limit: 5, null: false
    t.integer "sortorder", null: false
    t.integer "assessment_value", default: 0, null: false
    t.integer "scale_id", default: 0, null: false
    t.text "answer"
    t.index ["qid", "code", "scale_id"], name: "lime_answers_idx", unique: true
    t.index ["sortorder"], name: "lime_answers_idx2"
  end

  create_table "lime_archived_table_settings", id: :serial, force: :cascade do |t|
    t.integer "survey_id", null: false
    t.integer "user_id", null: false
    t.string "tbl_name", limit: 255, null: false
    t.string "tbl_type", limit: 10, null: false
    t.datetime "created", precision: nil, null: false
    t.text "properties", null: false
    t.text "attributes"
  end

  create_table "lime_assessments", primary_key: ["id", "language"], force: :cascade do |t|
    t.serial "id", null: false
    t.integer "sid", default: 0, null: false
    t.string "scope", limit: 5, default: "", null: false
    t.integer "gid", default: 0, null: false
    t.text "name", null: false
    t.string "minimum", limit: 50, default: "", null: false
    t.string "maximum", limit: 50, default: "", null: false
    t.text "message", null: false
    t.string "language", limit: 20, default: "en", null: false
    t.index ["gid"], name: "assessments_idx3"
    t.index ["sid"], name: "assessments_idx2"
  end

  create_table "lime_asset_version", id: :serial, force: :cascade do |t|
    t.text "path", null: false
    t.integer "version", null: false
  end

  create_table "lime_boxes", id: :serial, force: :cascade do |t|
    t.integer "position"
    t.text "url"
    t.text "title"
    t.text "desc"
    t.text "page"
    t.string "ico", limit: 255
    t.integer "usergroup"
  end

  create_table "lime_conditions", primary_key: "cid", id: :serial, force: :cascade do |t|
    t.integer "qid", default: 0, null: false
    t.integer "cqid", default: 0, null: false
    t.string "cfieldname", limit: 50, default: "", null: false
    t.string "method", limit: 5, default: "", null: false
    t.string "value", limit: 255, default: "", null: false
    t.integer "scenario", default: 1, null: false
    t.index ["cqid"], name: "conditions_idx3"
    t.index ["qid"], name: "conditions_idx2"
  end

  create_table "lime_defaultvalue_l10ns", id: :serial, force: :cascade do |t|
    t.integer "dvid", default: 0, null: false
    t.string "language", limit: 20, null: false
    t.text "defaultvalue"
    t.index ["dvid", "language"], name: "lime_idx1_defaultvalue_l10ns", unique: true
  end

  create_table "lime_defaultvalues", primary_key: "dvid", id: :serial, force: :cascade do |t|
    t.integer "qid", default: 0, null: false
    t.integer "scale_id", default: 0, null: false
    t.integer "sqid", default: 0, null: false
    t.string "specialtype", limit: 20, default: "", null: false
    t.index ["qid", "scale_id", "sqid", "specialtype"], name: "lime_idx1_defaultvalue"
  end

  create_table "lime_expression_errors", id: :serial, force: :cascade do |t|
    t.string "errortime", limit: 50
    t.integer "sid"
    t.integer "gid"
    t.integer "qid"
    t.integer "gseq"
    t.integer "qseq"
    t.string "type", limit: 50
    t.text "eqn"
    t.text "prettyprint"
  end

  create_table "lime_failed_login_attempts", id: :serial, force: :cascade do |t|
    t.string "ip", limit: 40, null: false
    t.string "last_attempt", limit: 20, null: false
    t.integer "number_attempts", null: false
  end

  create_table "lime_group_l10ns", id: :serial, force: :cascade do |t|
    t.integer "gid", null: false
    t.text "group_name", null: false
    t.text "description"
    t.string "language", limit: 20, null: false
    t.index ["gid", "language"], name: "lime_idx1_group_l10ns", unique: true
  end

  create_table "lime_groups", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.integer "sid", default: 0, null: false
    t.integer "group_order", default: 0, null: false
    t.string "randomization_group", limit: 20, default: "", null: false
    t.text "grelevance"
    t.string "group_name"
    t.index ["sid"], name: "lime_idx1_groups"
  end

  create_table "lime_label_l10ns", id: :serial, force: :cascade do |t|
    t.integer "label_id", null: false
    t.text "title"
    t.string "language", limit: 20, default: "en", null: false
    t.index ["label_id", "language"], name: "lime_idx1_label_l10ns", unique: true
  end

  create_table "lime_labels", id: :serial, force: :cascade do |t|
    t.integer "lid", null: false
    t.string "code", limit: 5, null: false
    t.integer "sortorder", null: false
    t.integer "assessment_value", default: 0, null: false
    t.index ["lid", "code"], name: "lime_idx5_labels", unique: true
  end

  create_table "lime_labelsets", primary_key: "lid", id: :serial, force: :cascade do |t|
    t.string "label_name", limit: 100, default: "", null: false
    t.string "languages", limit: 255, null: false
  end

  create_table "lime_map_tutorial_users", primary_key: ["uid", "tid"], force: :cascade do |t|
    t.integer "tid", null: false
    t.integer "uid", null: false
    t.integer "taken", default: 1
  end

  create_table "lime_notifications", id: :serial, force: :cascade do |t|
    t.string "entity", limit: 15, null: false
    t.integer "entity_id", null: false
    t.string "title", limit: 255, null: false
    t.text "message", null: false
    t.string "status", limit: 15, default: "new"
    t.integer "importance", default: 1
    t.string "display_class", limit: 31, default: "default"
    t.datetime "created", precision: nil, null: false
    t.datetime "first_read", precision: nil
    t.string "hash", limit: 64
    t.index ["entity", "entity_id", "status"], name: "notif_index"
    t.index ["hash"], name: "lime_notif_hash_index"
  end

  create_table "lime_old_survey_466694_20190709111307", id: :integer, default: -> { "nextval('lime_survey_466694_id_seq1'::regclass)" }, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "466694X1333X14400"
    t.text "466694X1334X14401"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_466694_31886"
  end

  create_table "lime_old_survey_595124_20200310065839", id: :integer, default: -> { "nextval('lime_survey_595124_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "595124X1498X16328StudentYear"
    t.text "595124X1498X16328StudentEmail"
    t.text "595124X1498X16328StudentName"
    t.text "595124X1498X16328CoachEmail"
    t.text "595124X1498X16328CoachName"
    t.text "595124X1499X16329CourseYear"
    t.text "595124X1499X16329CourseName"
    t.decimal "595124X1499X16330Week1MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week2MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week3MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week4MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week5MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week6MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week7MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week8MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week9MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week10MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week11MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week11MCQAve", precision: 30, scale: 10
    t.text "595124X1499X16331DroppedQuiz"
    t.text "595124X1499X16331DroppedScore"
    t.decimal "595124X1499X16332CSA01", precision: 30, scale: 10
    t.decimal "595124X1499X16332CSA02", precision: 30, scale: 10
    t.decimal "595124X1499X16332CSA03", precision: 30, scale: 10
    t.decimal "595124X1499X16332CSL1", precision: 30, scale: 10
    t.decimal "595124X1499X16332HSS1", precision: 30, scale: 10
    t.decimal "595124X1499X16332HSS2Ave", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS1AnatPB", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS2AnatPL1", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS3AnatPract1", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS4Histo1", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS5Histo2", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS6Path", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS7AnatPL2", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS8AnatPract2", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS9Histo3", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS10Ave", precision: 30, scale: 10
    t.decimal "595124X1499X16333Cardio", precision: 30, scale: 10
    t.decimal "595124X1499X16333Renal", precision: 30, scale: 10
    t.decimal "595124X1499X16333Pulm", precision: 30, scale: 10
    t.decimal "595124X1499X16334NBME", precision: 30, scale: 10
    t.decimal "595124X1499X16335CSAOSCE", precision: 30, scale: 10
    t.decimal "595124X1499X16335HSSInfAve", precision: 30, scale: 10
    t.decimal "595124X1499X16339BSSAnat", precision: 30, scale: 10
    t.decimal "595124X1499X16339BSSBchem", precision: 30, scale: 10
    t.decimal "595124X1499X16339BSSPath", precision: 30, scale: 10
    t.decimal "595124X1499X16339BSSMicrobio", precision: 30, scale: 10
    t.decimal "595124X1499X16339BSSAve", precision: 30, scale: 10
    t.decimal "595124X1499X16336Component1", precision: 30, scale: 10
    t.decimal "595124X1499X16336Component2A", precision: 30, scale: 10
    t.decimal "595124X1499X16336Component2B", precision: 30, scale: 10
    t.decimal "595124X1499X16336Component3", precision: 30, scale: 10
    t.decimal "595124X1499X16336Component4", precision: 30, scale: 10
    t.decimal "595124X1499X16336Component5A", precision: 30, scale: 10
    t.decimal "595124X1499X16336Component5B", precision: 30, scale: 10
    t.text "595124X1499X16337"
    t.integer "595124X1499X16337_filecount"
    t.index ["token"], name: "idx_survey_token_595124_16545"
  end

  create_table "lime_old_survey_856292_20220421060524", id: :integer, default: -> { "nextval('lime_survey_856292_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "856292X133X2068StudentYear"
    t.text "856292X133X2068StudentEmail"
    t.text "856292X133X2068StudentName"
    t.text "856292X133X2068CoachEmail"
    t.text "856292X133X2068CoachName"
    t.text "856292X134X2069CourseYear"
    t.text "856292X134X2069CourseName"
    t.decimal "856292X134X2070Week1MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week2MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week3MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week4MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week5MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week6MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week7MCQ", precision: 30, scale: 10
    t.text "856292X134X2071DroppedQuiz"
    t.text "856292X134X2071DroppedScore"
    t.decimal "856292X134X2072CSA1", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA2", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA3", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA4", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA5", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA6", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA7", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA8", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA9", precision: 30, scale: 10
    t.decimal "856292X134X2073FinalBlock", precision: 30, scale: 10
    t.decimal "856292X134X2074", precision: 30, scale: 10
    t.decimal "856292X134X2075OSCE", precision: 30, scale: 10
    t.decimal "856292X134X2075Genetics", precision: 30, scale: 10
    t.decimal "856292X134X2075CellBiology", precision: 30, scale: 10
    t.decimal "856292X134X2075Informatics", precision: 30, scale: 10
    t.decimal "856292X134X2076Component1", precision: 30, scale: 10
    t.decimal "856292X134X2076Component2", precision: 30, scale: 10
    t.decimal "856292X134X2076Component3", precision: 30, scale: 10
    t.decimal "856292X134X2076Component4", precision: 30, scale: 10
    t.decimal "856292X134X2076Component5", precision: 30, scale: 10
    t.text "856292X134X2077"
    t.integer "856292X134X2077_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_856292_23796"
  end

  create_table "lime_old_survey_856292_20220421063014", id: :integer, default: -> { "nextval('lime_survey_856292_id_seq1'::regclass)" }, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "856292X133X2068StudentYear"
    t.text "856292X133X2068StudentEmail"
    t.text "856292X133X2068StudentName"
    t.text "856292X133X2068CoachEmail"
    t.text "856292X133X2068CoachName"
    t.text "856292X134X2069CourseYear"
    t.text "856292X134X2069CourseName"
    t.decimal "856292X134X2070Week1MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week2MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week3MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week4MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week5MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week6MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week7MCQ", precision: 30, scale: 10
    t.text "856292X134X2071DroppedQuiz"
    t.text "856292X134X2071DroppedScore"
    t.decimal "856292X134X2072CSA1", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA2", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA3", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA4", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA5", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA6", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA7", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA8", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA9", precision: 30, scale: 10
    t.decimal "856292X134X2073FinalBlock", precision: 30, scale: 10
    t.decimal "856292X134X2074", precision: 30, scale: 10
    t.decimal "856292X134X2075OSCE", precision: 30, scale: 10
    t.decimal "856292X134X2075Genetics", precision: 30, scale: 10
    t.decimal "856292X134X2075CellBiology", precision: 30, scale: 10
    t.decimal "856292X134X2075Informatics", precision: 30, scale: 10
    t.decimal "856292X134X2076Component1", precision: 30, scale: 10
    t.decimal "856292X134X2076Component2", precision: 30, scale: 10
    t.decimal "856292X134X2076Component3", precision: 30, scale: 10
    t.decimal "856292X134X2076Component4", precision: 30, scale: 10
    t.decimal "856292X134X2076Component5", precision: 30, scale: 10
    t.text "856292X134X2077"
    t.integer "856292X134X2077_filecount"
    t.index ["token"], name: "idx_survey_token_856292_2508"
  end

  create_table "lime_old_survey_966338_20190808070842", id: :integer, default: -> { "nextval('lime_survey_966338_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "966338X1475X15865StudentYear"
    t.text "966338X1475X15865StudentEmail"
    t.text "966338X1475X15865StudentName"
    t.text "966338X1475X15865CoachEmail"
    t.text "966338X1475X15865CoachName"
    t.text "966338X1476X15866CourseYear"
    t.text "966338X1476X15866CourseName"
    t.decimal "966338X1476X15867Week1MCQ", precision: 30, scale: 10
    t.decimal "966338X1476X15867Week2MCQ", precision: 30, scale: 10
    t.decimal "966338X1476X15867Week3MCQ", precision: 30, scale: 10
    t.decimal "966338X1476X15867Week4MCQ", precision: 30, scale: 10
    t.decimal "966338X1476X15867Week5MCQ", precision: 30, scale: 10
    t.decimal "966338X1476X15867Week6MCQ", precision: 30, scale: 10
    t.decimal "966338X1476X15867Week7MCQ", precision: 30, scale: 10
    t.decimal "966338X1476X15867Week8MCQ", precision: 30, scale: 10
    t.decimal "966338X1476X15867Week9MCQAve", precision: 30, scale: 10
    t.text "966338X1476X15868DroppedQuiz"
    t.text "966338X1476X15868DroppedScore"
    t.decimal "966338X1476X15869CSA01", precision: 30, scale: 10
    t.decimal "966338X1476X15869CSA02", precision: 30, scale: 10
    t.decimal "966338X1476X15869CSA03", precision: 30, scale: 10
    t.decimal "966338X1476X15869CSL1", precision: 30, scale: 10
    t.decimal "966338X1476X15869HSS1", precision: 30, scale: 10
    t.decimal "966338X1476X15869HSS2Ave", precision: 30, scale: 10
    t.decimal "966338X1476X15875BSS1Anat1", precision: 30, scale: 10
    t.decimal "966338X1476X15875BSS2Histo1", precision: 30, scale: 10
    t.decimal "966338X1476X15875BSS3Anat2", precision: 30, scale: 10
    t.decimal "966338X1476X15875BSS4Histo2", precision: 30, scale: 10
    t.decimal "966338X1476X15875BSS5Histo3", precision: 30, scale: 10
    t.decimal "966338X1476X15875BSS6Anat3", precision: 30, scale: 10
    t.decimal "966338X1476X15875BSS7Ave", precision: 30, scale: 10
    t.decimal "966338X1476X15870FinalFund", precision: 30, scale: 10
    t.decimal "966338X1476X15871NBME", precision: 30, scale: 10
    t.decimal "966338X1476X15872CSAOSCE", precision: 30, scale: 10
    t.decimal "966338X1476X15872HSSInfor", precision: 30, scale: 10
    t.decimal "966338X1476X15872HSSInfAve", precision: 30, scale: 10
    t.decimal "966338X1476X15876BSSAnat", precision: 30, scale: 10
    t.decimal "966338X1476X15876BSSHisto", precision: 30, scale: 10
    t.decimal "966338X1476X15876BSSGenetics", precision: 30, scale: 10
    t.decimal "966338X1476X15876BSSCellBio", precision: 30, scale: 10
    t.decimal "966338X1476X15876BSSMicro", precision: 30, scale: 10
    t.decimal "966338X1476X15876BSSAve", precision: 30, scale: 10
    t.decimal "966338X1476X15873Component1", precision: 30, scale: 10
    t.decimal "966338X1476X15873Component2A", precision: 30, scale: 10
    t.decimal "966338X1476X15873Component2B", precision: 30, scale: 10
    t.decimal "966338X1476X15873Component3", precision: 30, scale: 10
    t.decimal "966338X1476X15873Component4", precision: 30, scale: 10
    t.decimal "966338X1476X15873Component5A", precision: 30, scale: 10
    t.decimal "966338X1476X15873Component5B", precision: 30, scale: 10
    t.text "966338X1476X15874"
    t.integer "966338X1476X15874_filecount"
    t.index ["token"], name: "idx_survey_token_966338_32523"
  end

  create_table "lime_old_tokens_466694_20190709111307", primary_key: "tid", id: :integer, default: -> { "nextval('lime_tokens_466694_tid_seq2'::regclass)" }, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["token"], name: "idx_token_token_466694_10224"
  end

  create_table "lime_old_tokens_966338_20190807092921", primary_key: "tid", id: :integer, default: -> { "nextval('lime_tokens_966338_tid_seq'::regclass)" }, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["token"], name: "idx_token_token_966338_32398"
  end

  create_table "lime_old_tokens_966338_20190807093503", primary_key: "tid", id: :integer, default: -> { "nextval('lime_tokens_966338_tid_seq1'::regclass)" }, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["token"], name: "idx_token_token_966338_9563"
  end

  create_table "lime_participant_attribute", primary_key: ["participant_id", "attribute_id"], force: :cascade do |t|
    t.string "participant_id", limit: 50, null: false
    t.integer "attribute_id", null: false
    t.text "value", null: false
  end

  create_table "lime_participant_attribute_names", primary_key: "attribute_id", id: :serial, force: :cascade do |t|
    t.string "attribute_type", limit: 4, null: false
    t.string "defaultname", limit: 255, null: false
    t.string "visible", limit: 5, null: false
    t.string "encrypted", limit: 5, default: "", null: false
    t.string "core_attribute", limit: 5, default: "", null: false
  end

  create_table "lime_participant_attribute_names_lang", primary_key: ["attribute_id", "lang"], force: :cascade do |t|
    t.integer "attribute_id", null: false
    t.string "attribute_name", limit: 255, null: false
    t.string "lang", limit: 20, null: false
  end

  create_table "lime_participant_attribute_values", primary_key: "value_id", id: :serial, force: :cascade do |t|
    t.integer "attribute_id", null: false
    t.text "value", null: false
  end

  create_table "lime_participant_shares", primary_key: ["participant_id", "share_uid"], force: :cascade do |t|
    t.string "participant_id", limit: 50, null: false
    t.integer "share_uid", null: false
    t.datetime "date_added", precision: nil, null: false
    t.string "can_edit", limit: 5, null: false
  end

  create_table "lime_participants", primary_key: "participant_id", id: { type: :string, limit: 50 }, force: :cascade do |t|
    t.text "firstname"
    t.text "lastname"
    t.text "email", null: false
    t.string "language", limit: 40
    t.string "blacklisted", limit: 1, null: false
    t.integer "owner_uid", null: false
    t.integer "created_by", null: false
    t.datetime "created", precision: nil
    t.datetime "modified", precision: nil
  end

  create_table "lime_permissions", id: :serial, force: :cascade do |t|
    t.string "entity", limit: 50, null: false
    t.integer "entity_id", null: false
    t.integer "uid", null: false
    t.string "permission", limit: 100, null: false
    t.integer "create_p", default: 0, null: false
    t.integer "read_p", default: 0, null: false
    t.integer "update_p", default: 0, null: false
    t.integer "delete_p", default: 0, null: false
    t.integer "import_p", default: 0, null: false
    t.integer "export_p", default: 0, null: false
    t.index ["entity_id", "entity", "uid", "permission"], name: "permissions_idx2", unique: true
  end

  create_table "lime_permissiontemplates", primary_key: "ptid", id: :serial, force: :cascade do |t|
    t.string "name", limit: 127, null: false
    t.text "description"
    t.datetime "renewed_last", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.integer "created_by", null: false
    t.index ["name"], name: "lime_idx1_name", unique: true
  end

  create_table "lime_plugin_settings", id: :serial, force: :cascade do |t|
    t.integer "plugin_id", null: false
    t.string "model", limit: 50
    t.integer "model_id"
    t.string "key", limit: 50, null: false
    t.text "value"
  end

  create_table "lime_plugins", id: :serial, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.integer "active", default: 0, null: false
    t.string "version", limit: 32
    t.integer "load_error", default: 0
    t.text "load_error_message"
    t.string "plugin_type", limit: 6, default: "user"
    t.integer "priority", default: 0, null: false
  end

  create_table "lime_question_attributes", primary_key: "qaid", id: :serial, force: :cascade do |t|
    t.integer "qid", default: 0, null: false
    t.string "attribute", limit: 50
    t.text "value"
    t.string "language", limit: 20
    t.index ["attribute"], name: "question_attributes_idx3"
    t.index ["qid"], name: "question_attributes_idx2"
  end

  create_table "lime_question_l10ns", id: :serial, force: :cascade do |t|
    t.integer "qid", null: false
    t.text "question", null: false
    t.text "help"
    t.string "language", limit: 20, null: false
    t.text "script"
    t.index ["qid", "language"], name: "lime_idx1_question_l10ns", unique: true
  end

  create_table "lime_question_themes", id: :serial, force: :cascade do |t|
    t.string "name", limit: 150, null: false
    t.string "visible", limit: 1
    t.string "xml_path", limit: 255
    t.string "image_path", limit: 255
    t.string "title", limit: 100, null: false
    t.datetime "creation_date", precision: nil
    t.string "author", limit: 150
    t.string "author_email", limit: 255
    t.string "author_url", limit: 255
    t.text "copyright"
    t.text "license"
    t.string "version", limit: 45
    t.string "api_version", limit: 45, null: false
    t.text "description"
    t.datetime "last_update", precision: nil
    t.integer "owner_id"
    t.string "theme_type", limit: 150
    t.string "question_type", limit: 150, null: false
    t.boolean "core_theme"
    t.string "extends", limit: 150
    t.string "group", limit: 150
    t.text "settings"
    t.index ["name"], name: "lime_idx1_question_themes"
  end

  create_table "lime_questions", primary_key: "qid", id: :serial, force: :cascade do |t|
    t.integer "parent_qid", default: 0, null: false
    t.integer "sid", default: 0, null: false
    t.integer "gid", default: 0, null: false
    t.string "type", limit: 30, default: "T", null: false
    t.string "title", limit: 20, default: "", null: false
    t.text "preg"
    t.string "other", limit: 1, default: "N", null: false
    t.string "mandatory", limit: 1
    t.integer "question_order", null: false
    t.integer "scale_id", default: 0, null: false
    t.integer "same_default", default: 0, null: false
    t.text "relevance"
    t.string "modulename", limit: 255
    t.string "encrypted", limit: 1, default: "N"
    t.string "question_theme_name", limit: 150
    t.text "question"
    t.index ["gid"], name: "lime_idx2_questions"
    t.index ["parent_qid"], name: "lime_idx5_questions"
    t.index ["sid"], name: "lime_idx1_questions"
    t.index ["title"], name: "lime_idx4_questions"
    t.index ["type"], name: "lime_idx3_questions"
  end

  create_table "lime_quota", id: :serial, force: :cascade do |t|
    t.integer "sid"
    t.string "name", limit: 255
    t.integer "qlimit"
    t.integer "action"
    t.integer "active", default: 1, null: false
    t.integer "autoload_url", default: 0, null: false
    t.index ["sid"], name: "quota_idx2"
  end

  create_table "lime_quota_languagesettings", primary_key: "quotals_id", id: :serial, force: :cascade do |t|
    t.integer "quotals_quota_id", default: 0, null: false
    t.string "quotals_language", limit: 45, default: "en", null: false
    t.string "quotals_name", limit: 255
    t.text "quotals_message", null: false
    t.string "quotals_url", limit: 255
    t.string "quotals_urldescrip", limit: 255
  end

  create_table "lime_quota_members", id: :serial, force: :cascade do |t|
    t.integer "sid"
    t.integer "qid"
    t.integer "quota_id"
    t.string "code", limit: 11
    t.index ["sid", "qid", "quota_id", "code"], name: "lime_quota_members_ixcode_idx"
  end

  create_table "lime_saved_control", primary_key: "scid", id: :serial, force: :cascade do |t|
    t.integer "sid", default: 0, null: false
    t.integer "srid", default: 0, null: false
    t.text "identifier", null: false
    t.text "access_code", null: false
    t.string "email", limit: 254
    t.text "ip", null: false
    t.text "saved_thisstep", null: false
    t.string "status", limit: 1, default: "", null: false
    t.datetime "saved_date", precision: nil, null: false
    t.text "refurl"
    t.index ["sid"], name: "saved_control_idx2"
  end

  create_table "lime_sessions", id: { type: :string, limit: 32 }, force: :cascade do |t|
    t.integer "expire"
    t.binary "data"
    t.index ["expire"], name: "sess_expire"
  end

  create_table "lime_settings_global", primary_key: "stg_name", id: { type: :string, limit: 50, default: "" }, force: :cascade do |t|
    t.text "stg_value", null: false
  end

  create_table "lime_settings_user", id: :serial, force: :cascade do |t|
    t.integer "uid", null: false
    t.string "entity", limit: 15
    t.string "entity_id", limit: 31
    t.string "stg_name", limit: 63, null: false
    t.text "stg_value"
  end

  create_table "lime_survey_115373", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "115373X118X1879StudentYear"
    t.text "115373X118X1879StudentEmail"
    t.text "115373X118X1879StudentName"
    t.text "115373X118X1879CoachEmail"
    t.text "115373X118X1879CoachName"
    t.text "115373X117X1880CourseYear"
    t.text "115373X117X1880CourseName"
    t.decimal "115373X117X1873Week1MCQ", precision: 30, scale: 10
    t.decimal "115373X117X1873Week2MCQ", precision: 30, scale: 10
    t.decimal "115373X117X1873Week3MCQ", precision: 30, scale: 10
    t.decimal "115373X117X1873Week4MCQ", precision: 30, scale: 10
    t.decimal "115373X117X1873Week5MCQ", precision: 30, scale: 10
    t.decimal "115373X117X1873Week6MCQ", precision: 30, scale: 10
    t.decimal "115373X117X1873Week7MCQ", precision: 30, scale: 10
    t.decimal "115373X117X1873Week8MCQ", precision: 30, scale: 10
    t.decimal "115373X117X1873Week9MCQ", precision: 30, scale: 10
    t.text "115373X117X1878DroppedQuiz"
    t.text "115373X117X1878DroppedScore"
    t.decimal "115373X117X1874CSA1", precision: 30, scale: 10
    t.decimal "115373X117X1874CSA2", precision: 30, scale: 10
    t.decimal "115373X117X1874CSA3", precision: 30, scale: 10
    t.decimal "115373X117X1874CSA4", precision: 30, scale: 10
    t.decimal "115373X117X1874CSA5", precision: 30, scale: 10
    t.decimal "115373X117X1874CSA6", precision: 30, scale: 10
    t.decimal "115373X117X1874CSA7", precision: 30, scale: 10
    t.decimal "115373X117X1875", precision: 30, scale: 10
    t.decimal "115373X117X1876", precision: 30, scale: 10
    t.decimal "115373X117X1877Neuro", precision: 30, scale: 10
    t.decimal "115373X117X1877Histology", precision: 30, scale: 10
    t.decimal "115373X117X1877Anatomy", precision: 30, scale: 10
    t.decimal "115373X117X1877GrossAnatomy", precision: 30, scale: 10
    t.decimal "115373X117X1881Component1", precision: 30, scale: 10
    t.decimal "115373X117X1881Component2", precision: 30, scale: 10
    t.decimal "115373X117X1881Component3", precision: 30, scale: 10
    t.decimal "115373X117X1881Component4", precision: 30, scale: 10
    t.decimal "115373X117X1881Component5", precision: 30, scale: 10
    t.text "115373X117X1882"
    t.integer "115373X117X1882_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_115373_45301"
  end

  create_table "lime_survey_115743", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "115743X1128X13254SQ001", limit: 5
    t.string "115743X1128X13254SQ002", limit: 5
    t.string "115743X1128X13254SQ005", limit: 5
    t.string "115743X1128X13254SQ004", limit: 5
    t.string "115743X1129X13268SQ001", limit: 5
    t.string "115743X1129X13268SQ004", limit: 5
    t.string "115743X1129X13268SQ003", limit: 5
    t.string "115743X1129X13268SQ002", limit: 5
    t.string "115743X1130X13273SQ001", limit: 5
    t.string "115743X1130X13273SQ004", limit: 5
    t.string "115743X1130X13273SQ003", limit: 5
    t.string "115743X1130X13273SQ002", limit: 5
    t.string "115743X1152X13350SQ001", limit: 5
    t.text "115743X1131X13278"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_115743_42533"
  end

  create_table "lime_survey_117798", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "117798X193X2411", limit: 5
    t.string "117798X193X2410", limit: 255
    t.string "117798X188X2405", limit: 255
    t.string "117798X188X2399", limit: 255
    t.text "117798X188X2400"
    t.string "117798X189X2401", limit: 255
    t.text "117798X189X2402"
    t.decimal "117798X190X2403", precision: 30, scale: 10
    t.text "117798X190X2404"
    t.decimal "117798X191X2406", precision: 30, scale: 10
    t.text "117798X191X2407"
    t.decimal "117798X192X2408", precision: 30, scale: 10
    t.text "117798X192X2409"
    t.text "117798X198X2426"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_117798_18168"
  end

  create_table "lime_survey_118128", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "118128X1471X15791StudentYear"
    t.text "118128X1471X15791StudentEmail"
    t.text "118128X1471X15791StudentName"
    t.text "118128X1471X15791CoachEmail"
    t.text "118128X1471X15791CoachName"
    t.text "118128X1470X15790"
    t.integer "118128X1470X15790_filecount"
    t.index ["token"], name: "idx_survey_token_118128_6285"
  end

  create_table "lime_survey_127551", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "127551X573X7078"
    t.text "127551X573X7081"
    t.string "127551X576X7082", limit: 5
    t.text "127551X576X7083"
    t.text "127551X576X7077StudentYear"
    t.text "127551X576X7077StudentEmail"
    t.text "127551X576X7077StudentName"
    t.text "127551X576X7077CoachEmail"
    t.text "127551X576X7077CoachName"
    t.string "127551X574X7079C1", limit: 5
    t.string "127551X574X7079C2", limit: 5
    t.string "127551X574X7079C3", limit: 5
    t.string "127551X574X7079C4", limit: 5
    t.string "127551X574X7079C5", limit: 5
    t.string "127551X574X7079C6", limit: 5
    t.string "127551X574X7079C7", limit: 5
    t.string "127551X574X7079C8", limit: 5
    t.string "127551X574X7079C9", limit: 5
    t.text "127551X575X7080"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_127551_6831"
  end

  create_table "lime_survey_128963", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.decimal "128963X737X8832", precision: 30, scale: 10
    t.text "128963X737X8836"
    t.string "128963X737X8843", limit: 5
    t.text "128963X737X8843other"
    t.string "128963X737X8855SQ001", limit: 5
    t.string "128963X737X8855SQ002", limit: 5
    t.string "128963X737X8855SQ003", limit: 5
    t.string "128963X737X8855SQ004", limit: 5
    t.string "128963X737X8855SQ005", limit: 5
    t.text "128963X737X8855other"
    t.string "128963X744X8893SQ001", limit: 5
    t.string "128963X744X8893SQ002", limit: 5
    t.string "128963X744X8893SQ003", limit: 5
    t.string "128963X755X8935SQ001", limit: 5
    t.string "128963X755X8935SQ002", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_128963_15721"
  end

  create_table "lime_survey_133379", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "133379X1320X14301", limit: 5
    t.text "133379X1320X14277StudentEmail"
    t.text "133379X1320X14277StudentName"
    t.text "133379X1320X14277StudentID"
    t.text "133379X1320X14277CoachEmail"
    t.text "133379X1320X14277CoachName"
    t.string "133379X1321X14271RateYourHealth4Weeks", limit: 5
    t.string "133379X1321X14272ProblemsWalking", limit: 5
    t.string "133379X1321X14272DifficultDailyWork", limit: 5
    t.string "133379X1321X14272EmotionsProb", limit: 5
    t.string "133379X1321X14272PersonalProbUsualWor", limit: 5
    t.string "133379X1321X14273BodilyPain", limit: 5
    t.string "133379X1321X14274Past4WeekEnergyLevel", limit: 5
    t.string "133379X1321X14275BotheredEmotionalPro", limit: 5
    t.string "133379X1322X14276BennUpset", limit: 5
    t.string "133379X1322X14276UnableControl", limit: 5
    t.string "133379X1322X14276FeltNervous", limit: 5
    t.string "133379X1322X14276FeltConfident", limit: 5
    t.string "133379X1322X14276FeltGoingYourWay", limit: 5
    t.string "133379X1322X14276CouldNotCope", limit: 5
    t.string "133379X1322X14276AbleToControl", limit: 5
    t.string "133379X1322X14276OnTopOfThings", limit: 5
    t.string "133379X1322X14276BeenAngered", limit: 5
    t.string "133379X1322X14276PilingUpHigh", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_133379_23379"
  end

  create_table "lime_survey_135694", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "135694X1370X14626"
    t.text "135694X1370X14629"
    t.string "135694X1373X14630", limit: 5
    t.text "135694X1373X14631"
    t.string "135694X1371X14627C1", limit: 5
    t.string "135694X1371X14627C2", limit: 5
    t.string "135694X1371X14627C3", limit: 5
    t.string "135694X1371X14627C4", limit: 5
    t.string "135694X1371X14627C5", limit: 5
    t.string "135694X1371X14627C6", limit: 5
    t.string "135694X1371X14627C7", limit: 5
    t.string "135694X1371X14627C8", limit: 5
    t.string "135694X1371X14627C9", limit: 5
    t.text "135694X1372X14628"
    t.text "135694X1416X15225StudentYear"
    t.text "135694X1416X15225StudentEmail"
    t.text "135694X1416X15225StudentName"
    t.text "135694X1416X15225CoachEmail"
    t.text "135694X1416X15225CoachName"
    t.index ["token"], name: "idx_survey_token_135694_13172"
  end

  create_table "lime_survey_135887", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "135887X875X9833"
    t.text "135887X875X9836"
    t.string "135887X878X9837", limit: 5
    t.text "135887X878X9838"
    t.text "135887X878X9832StudentYear"
    t.text "135887X878X9832StudentEmail"
    t.text "135887X878X9832StudentName"
    t.text "135887X878X9832CoachEmail"
    t.text "135887X878X9832CoachName"
    t.string "135887X876X9834C1", limit: 5
    t.string "135887X876X9834C2", limit: 5
    t.string "135887X876X9834C3", limit: 5
    t.string "135887X876X9834C4", limit: 5
    t.string "135887X876X9834C5", limit: 5
    t.string "135887X876X9834C6", limit: 5
    t.string "135887X876X9834C7", limit: 5
    t.string "135887X876X9834C8", limit: 5
    t.string "135887X876X9834C9", limit: 5
    t.text "135887X877X9835"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_135887_15696"
  end

  create_table "lime_survey_137847", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "137847X253X3146"
    t.text "137847X253X3149"
    t.string "137847X256X3150", limit: 5
    t.text "137847X256X3151"
    t.text "137847X256X3145StudentYear"
    t.text "137847X256X3145StudentEmail"
    t.text "137847X256X3145StudentName"
    t.text "137847X256X3145CoachEmail"
    t.text "137847X256X3145CoachName"
    t.string "137847X254X3147C1", limit: 5
    t.string "137847X254X3147C2", limit: 5
    t.string "137847X254X3147C3", limit: 5
    t.string "137847X254X3147C4", limit: 5
    t.string "137847X254X3147C5", limit: 5
    t.string "137847X254X3147C6", limit: 5
    t.string "137847X254X3147C7", limit: 5
    t.string "137847X254X3147C8", limit: 5
    t.string "137847X254X3147C9", limit: 5
    t.text "137847X255X3148"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_137847_38530"
  end

  create_table "lime_survey_144697", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "144697X394X4289", limit: 5
    t.text "144697X394X4290"
    t.string "144697X391X4283Clarify", limit: 5
    t.string "144697X391X4283Represents", limit: 5
    t.string "144697X391X4283Responsible", limit: 5
    t.string "144697X391X4283Inspire", limit: 5
    t.string "144697X391X4283Determine", limit: 5
    t.string "144697X391X4283Active", limit: 5
    t.string "144697X391X4283Honest", limit: 5
    t.string "144697X392X4284SeekAndHear", limit: 5
    t.string "144697X392X4284LearnAbout", limit: 5
    t.string "144697X392X4284ConveyAny", limit: 5
    t.string "144697X392X4284DevelopAShared", limit: 5
    t.string "144697X392X4284SpecificMeasurable", limit: 5
    t.string "144697X392X4284WorkWithYourStudent", limit: 5
    t.string "144697X392X4284OrganizeInterpret", limit: 5
    t.string "144697X392X4284DetermineTimelines", limit: 5
    t.string "144697X392X4284MonitorYourProgress", limit: 5
    t.string "144697X392X4284IdentifyProblems", limit: 5
    t.string "144697X392X4284SolveProblems", limit: 5
    t.string "144697X392X4284Characterize", limit: 5
    t.text "144697X393X4285"
    t.text "144697X393X4286"
    t.text "144697X390X4282"
    t.text "144697X390X4288"
    t.text "144697X390X4287"
    t.text "144697X390X4291"
    t.text "144697X390X4292"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_144697_35918"
  end

  create_table "lime_survey_146548", id: :serial, force: :cascade do |t|
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "146548X944X10512", limit: 5
    t.text "146548X944X10512other"
    t.string "146548X944X10513", limit: 1
    t.string "146548X944X10514", limit: 1
    t.string "146548X944X10515SQ001", limit: 5
    t.string "146548X944X10515SQ002", limit: 5
    t.string "146548X944X10515SQ003", limit: 5
    t.string "146548X944X10515SQ004", limit: 5
    t.string "146548X944X10515SQ005", limit: 5
    t.text "146548X944X10515other"
    t.string "146548X944X10526SQ001", limit: 5
    t.string "146548X944X10526SQ002", limit: 5
    t.string "146548X944X10526SQ003", limit: 5
    t.string "146548X944X10526SQ004", limit: 5
    t.text "146548X944X10526other"
    t.string "146548X944X10516", limit: 1
    t.string "146548X944X10517", limit: 5
    t.text "146548X944X10517other"
    t.string "146548X944X10518", limit: 1
    t.text "146548X944X10519"
    t.text "146548X944X10520"
    t.string "seed", limit: 31
  end

  create_table "lime_survey_147365", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "147365X271X3289StudentYear"
    t.text "147365X271X3289StudentEmail"
    t.text "147365X271X3289StudentName"
    t.text "147365X271X3289CoachEmail"
    t.text "147365X271X3289CoachName"
    t.decimal "147365X272X3290Comm", precision: 30, scale: 10
    t.decimal "147365X272X3290Patient", precision: 30, scale: 10
    t.decimal "147365X272X3290Exam", precision: 30, scale: 10
    t.decimal "147365X272X3290Clinical", precision: 30, scale: 10
    t.decimal "147365X272X3290Prof", precision: 30, scale: 10
    t.decimal "147365X272X3290Total", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_147365_11370"
  end

  create_table "lime_survey_147694", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "147694X1145X13324SQ001", limit: 5
    t.string "147694X1145X13324SQ002", limit: 5
    t.string "147694X1145X13324SQ005", limit: 5
    t.string "147694X1145X13324SQ004", limit: 5
    t.string "147694X1145X13324SQ006", limit: 5
    t.string "147694X1146X13325SQ001", limit: 5
    t.string "147694X1146X13325SQ004", limit: 5
    t.string "147694X1146X13325SQ003", limit: 5
    t.string "147694X1146X13325SQ002", limit: 5
    t.text "147694X1147X13326"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_147694_8192"
  end

  create_table "lime_survey_153794", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "153794X969X10680StudentYear"
    t.text "153794X969X10680StudentEmail"
    t.text "153794X969X10680StudentName"
    t.text "153794X969X10680CoachEmail"
    t.text "153794X969X10680CoachName"
    t.text "153794X969X10680Course"
    t.decimal "153794X969X10681FUND", precision: 30, scale: 10
    t.decimal "153794X969X10681BLHD", precision: 30, scale: 10
    t.decimal "153794X969X10681SBM", precision: 30, scale: 10
    t.decimal "153794X969X10681CPR", precision: 30, scale: 10
    t.decimal "153794X969X10681HODI", precision: 30, scale: 10
    t.decimal "153794X969X10681NSF", precision: 30, scale: 10
    t.decimal "153794X969X10681DEVH", precision: 30, scale: 10
    t.decimal "153794X969X10682FUND", precision: 30, scale: 10
    t.decimal "153794X969X10682BLHD", precision: 30, scale: 10
    t.decimal "153794X969X10682SBM", precision: 30, scale: 10
    t.decimal "153794X969X10682CPR", precision: 30, scale: 10
    t.decimal "153794X969X10682HODI", precision: 30, scale: 10
    t.decimal "153794X969X10682NSF", precision: 30, scale: 10
    t.decimal "153794X969X10682DEVH", precision: 30, scale: 10
    t.decimal "153794X969X10683FUND", precision: 30, scale: 10
    t.decimal "153794X969X10683BLHD", precision: 30, scale: 10
    t.decimal "153794X969X10683SBM", precision: 30, scale: 10
    t.decimal "153794X969X10683CPR", precision: 30, scale: 10
    t.decimal "153794X969X10683HODI", precision: 30, scale: 10
    t.decimal "153794X969X10683NSF", precision: 30, scale: 10
    t.decimal "153794X969X10683DEVH", precision: 30, scale: 10
    t.decimal "153794X969X10684FUND", precision: 30, scale: 10
    t.decimal "153794X969X10684BLHD", precision: 30, scale: 10
    t.decimal "153794X969X10684SBM", precision: 30, scale: 10
    t.decimal "153794X969X10684CPR", precision: 30, scale: 10
    t.decimal "153794X969X10684HODI", precision: 30, scale: 10
    t.decimal "153794X969X10684NSF", precision: 30, scale: 10
    t.decimal "153794X969X10684DEVH", precision: 30, scale: 10
    t.decimal "153794X969X10685FUND", precision: 30, scale: 10
    t.decimal "153794X969X10685BLHD", precision: 30, scale: 10
    t.decimal "153794X969X10685SBM", precision: 30, scale: 10
    t.decimal "153794X969X10685CPR", precision: 30, scale: 10
    t.decimal "153794X969X10685HODI", precision: 30, scale: 10
    t.decimal "153794X969X10685NSF", precision: 30, scale: 10
    t.decimal "153794X969X10685DEVH", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_153794_7839"
  end

  create_table "lime_survey_154741", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "154741X1385X14746StudentYear"
    t.text "154741X1385X14746StudentEmail"
    t.text "154741X1385X14746StudentName"
    t.text "154741X1385X14746CoachEmail"
    t.text "154741X1385X14746CoachName"
    t.text "154741X1382X14722FirstName"
    t.text "154741X1382X14722LastName"
    t.text "154741X1382X14722Address1"
    t.text "154741X1382X14722Address2"
    t.text "154741X1382X14722City"
    t.text "154741X1382X14722State"
    t.text "154741X1382X14722ZipCode"
    t.text "154741X1382X14722HomePhone"
    t.text "154741X1382X14722MobilePhone"
    t.datetime "154741X1382X14723", precision: nil
    t.string "154741X1382X14724", limit: 5
    t.text "154741X1382X14724other"
    t.string "154741X1382X14725", limit: 5
    t.text "154741X1382X14725other"
    t.string "154741X1382X14726", limit: 5
    t.string "154741X1382X147271", limit: 5
    t.string "154741X1382X147272", limit: 5
    t.string "154741X1382X147273", limit: 5
    t.string "154741X1382X147274", limit: 5
    t.string "154741X1382X147275", limit: 5
    t.text "154741X1382X14727other"
    t.string "154741X1382X14728", limit: 5
    t.string "154741X1382X14742", limit: 1
    t.text "154741X1382X14729Child1_Age1"
    t.text "154741X1382X14729Child2_Age1"
    t.text "154741X1382X14729Child3_Age1"
    t.text "154741X1382X14729Child4_Age1"
    t.text "154741X1382X14729Child5_Age1"
    t.text "154741X1382X14730City"
    t.text "154741X1382X14730State"
    t.text "154741X1382X14730Country"
    t.text "154741X1382X14731City"
    t.text "154741X1382X14731State"
    t.text "154741X1382X14731Country"
    t.text "154741X1382X14743Hobby1"
    t.text "154741X1382X14743Hobby2"
    t.text "154741X1382X14743Hobby3"
    t.decimal "154741X1383X14732", precision: 30, scale: 10
    t.text "154741X1383X14733Row1_Institution"
    t.text "154741X1383X14733Row1_DegreeAttained"
    t.text "154741X1383X14733Row1_MajorAreaStudy"
    t.text "154741X1383X14733Row1_MinorAreaStudy"
    t.text "154741X1383X14733Row1_YrGrad"
    t.text "154741X1383X14733Row1_ScienceCoursesHrs"
    t.text "154741X1383X14733Row1_ScienceCoursesGPA"
    t.text "154741X1383X14733Row1_OverallGPA"
    t.text "154741X1383X14733Row2_Institution"
    t.text "154741X1383X14733Row2_DegreeAttained"
    t.text "154741X1383X14733Row2_MajorAreaStudy"
    t.text "154741X1383X14733Row2_MinorAreaStudy"
    t.text "154741X1383X14733Row2_YrGrad"
    t.text "154741X1383X14733Row2_ScienceCoursesHrs"
    t.text "154741X1383X14733Row2_ScienceCoursesGPA"
    t.text "154741X1383X14733Row2_OverallGPA"
    t.text "154741X1383X14733Row3_Institution"
    t.text "154741X1383X14733Row3_DegreeAttained"
    t.text "154741X1383X14733Row3_MajorAreaStudy"
    t.text "154741X1383X14733Row3_MinorAreaStudy"
    t.text "154741X1383X14733Row3_YrGrad"
    t.text "154741X1383X14733Row3_ScienceCoursesHrs"
    t.text "154741X1383X14733Row3_ScienceCoursesGPA"
    t.text "154741X1383X14733Row3_OverallGPA"
    t.text "154741X1383X14733Row4_Institution"
    t.text "154741X1383X14733Row4_DegreeAttained"
    t.text "154741X1383X14733Row4_MajorAreaStudy"
    t.text "154741X1383X14733Row4_MinorAreaStudy"
    t.text "154741X1383X14733Row4_YrGrad"
    t.text "154741X1383X14733Row4_ScienceCoursesHrs"
    t.text "154741X1383X14733Row4_ScienceCoursesGPA"
    t.text "154741X1383X14733Row4_OverallGPA"
    t.text "154741X1383X14734Row1_YrMCAT"
    t.text "154741X1383X14734Row1_PhsySciences"
    t.text "154741X1383X14734Row1_VerbalReasoning"
    t.text "154741X1383X14734Row1_BioSciences"
    t.text "154741X1383X14734Row1_MCATTotScore"
    t.text "154741X1383X14734Row2_YrMCAT"
    t.text "154741X1383X14734Row2_PhsySciences"
    t.text "154741X1383X14734Row2_VerbalReasoning"
    t.text "154741X1383X14734Row2_BioSciences"
    t.text "154741X1383X14734Row2_MCATTotScore"
    t.text "154741X1383X14734Row3_YrMCAT"
    t.text "154741X1383X14734Row3_PhsySciences"
    t.text "154741X1383X14734Row3_VerbalReasoning"
    t.text "154741X1383X14734Row3_BioSciences"
    t.text "154741X1383X14734Row3_MCATTotScore"
    t.text "154741X1383X14735Row1_YrMCAT"
    t.text "154741X1383X14735Row1_ChemPhyBioSys"
    t.text "154741X1383X14735Row1_CriticalAnalysis"
    t.text "154741X1383X14735Row1_BioFoundOfLivingSys"
    t.text "154741X1383X14735Row1_PsychSocBioFoundOfBe"
    t.text "154741X1383X14735Row1_MCATTotScore"
    t.text "154741X1383X14735Row2_YrMCAT"
    t.text "154741X1383X14735Row2_ChemPhyBioSys"
    t.text "154741X1383X14735Row2_CriticalAnalysis"
    t.text "154741X1383X14735Row2_BioFoundOfLivingSys"
    t.text "154741X1383X14735Row2_PsychSocBioFoundOfBe"
    t.text "154741X1383X14735Row2_MCATTotScore"
    t.text "154741X1383X14735Row3_YrMCAT"
    t.text "154741X1383X14735Row3_ChemPhyBioSys"
    t.text "154741X1383X14735Row3_CriticalAnalysis"
    t.text "154741X1383X14735Row3_BioFoundOfLivingSys"
    t.text "154741X1383X14735Row3_PsychSocBioFoundOfBe"
    t.text "154741X1383X14735Row3_MCATTotScore"
    t.text "154741X1383X14744"
    t.string "154741X1383X14736", limit: 5
    t.text "154741X1383X14737Row1_HealthcareSetting"
    t.text "154741X1383X14737Row1_CountryServed"
    t.text "154741X1383X14737Row1_Role"
    t.text "154741X1383X14737Row1_InclusiveYrs"
    t.text "154741X1383X14737Row2_HealthcareSetting"
    t.text "154741X1383X14737Row2_CountryServed"
    t.text "154741X1383X14737Row2_Role"
    t.text "154741X1383X14737Row2_InclusiveYrs"
    t.text "154741X1383X14737Row3_HealthcareSetting"
    t.text "154741X1383X14737Row3_CountryServed"
    t.text "154741X1383X14737Row3_Role"
    t.text "154741X1383X14737Row3_InclusiveYrs"
    t.text "154741X1383X14745Experience1"
    t.text "154741X1383X14745Experience2"
    t.text "154741X1383X14745Experience3"
    t.string "154741X1383X14738", limit: 5
    t.string "154741X1383X147391", limit: 5
    t.string "154741X1383X147392", limit: 5
    t.string "154741X1383X147393", limit: 5
    t.string "154741X1383X147394", limit: 5
    t.string "154741X1383X147395", limit: 5
    t.string "154741X1383X147396", limit: 5
    t.string "154741X1383X147397", limit: 5
    t.string "154741X1383X147398", limit: 5
    t.string "154741X1383X147399", limit: 5
    t.string "154741X1383X1473910", limit: 5
    t.string "154741X1383X1473911", limit: 5
    t.string "154741X1383X1473912", limit: 5
    t.string "154741X1383X1473913", limit: 5
    t.string "154741X1383X1473914", limit: 5
    t.string "154741X1383X1473915", limit: 5
    t.string "154741X1383X1473916", limit: 5
    t.string "154741X1383X1473917", limit: 5
    t.string "154741X1383X1473918", limit: 5
    t.string "154741X1383X1473919", limit: 5
    t.string "154741X1383X1473920", limit: 5
    t.string "154741X1383X1473921", limit: 5
    t.string "154741X1383X1473922", limit: 5
    t.string "154741X1383X1473923", limit: 5
    t.string "154741X1384X147401", limit: 5
    t.string "154741X1384X147402", limit: 5
    t.string "154741X1384X147403", limit: 5
    t.string "154741X1384X147404", limit: 5
    t.string "154741X1384X147405", limit: 5
    t.string "154741X1384X147406", limit: 5
    t.string "154741X1384X147407", limit: 5
    t.decimal "154741X1384X14741NoOfAdults", precision: 30, scale: 10
    t.decimal "154741X1384X14741NoOfChildrens", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_154741_47699"
  end

  create_table "lime_survey_155954", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "155954X1393X14922StudentYear"
    t.text "155954X1393X14922StudentEmail"
    t.text "155954X1393X14922StudentName"
    t.text "155954X1393X14922CoachEmail"
    t.text "155954X1393X14922CoachName"
    t.text "155954X1394X14923CourseYear"
    t.text "155954X1394X14923CourseName"
    t.decimal "155954X1394X14924Week1MCQ", precision: 30, scale: 10
    t.decimal "155954X1394X14924Week2MCQ", precision: 30, scale: 10
    t.decimal "155954X1394X14924Week3MCQ", precision: 30, scale: 10
    t.decimal "155954X1394X14924Week4MCQ", precision: 30, scale: 10
    t.decimal "155954X1394X14924Week5MCQ", precision: 30, scale: 10
    t.decimal "155954X1394X14924Week6MCQ", precision: 30, scale: 10
    t.decimal "155954X1394X14924Week7MCQ", precision: 30, scale: 10
    t.decimal "155954X1394X14924Week8MCQ", precision: 30, scale: 10
    t.text "155954X1394X14925DroppedQuiz"
    t.text "155954X1394X14925DroppedScore"
    t.decimal "155954X1394X14926CSA01", precision: 30, scale: 10
    t.decimal "155954X1394X14926CSA02", precision: 30, scale: 10
    t.decimal "155954X1394X14926CSA03", precision: 30, scale: 10
    t.decimal "155954X1394X14926CSA04", precision: 30, scale: 10
    t.decimal "155954X1394X14926CSA05", precision: 30, scale: 10
    t.decimal "155954X1394X14926CSA06", precision: 30, scale: 10
    t.decimal "155954X1394X14926CSA07", precision: 30, scale: 10
    t.decimal "155954X1394X14926CSA08", precision: 30, scale: 10
    t.decimal "155954X1394X14926CSA09", precision: 30, scale: 10
    t.decimal "155954X1394X14926CSA10", precision: 30, scale: 10
    t.decimal "155954X1394X14926CSA11", precision: 30, scale: 10
    t.decimal "155954X1394X14926CSA12", precision: 30, scale: 10
    t.decimal "155954X1394X14927FinalBlock1", precision: 30, scale: 10
    t.decimal "155954X1394X14927FinalBlock2", precision: 30, scale: 10
    t.decimal "155954X1394X14928NBME", precision: 30, scale: 10
    t.decimal "155954X1394X14929OSCE", precision: 30, scale: 10
    t.decimal "155954X1394X14929Histo", precision: 30, scale: 10
    t.decimal "155954X1394X14929NeuroAnat", precision: 30, scale: 10
    t.decimal "155954X1394X14929AnatPract", precision: 30, scale: 10
    t.decimal "155954X1394X14930Component1", precision: 30, scale: 10
    t.decimal "155954X1394X14930Component2", precision: 30, scale: 10
    t.decimal "155954X1394X14930Component3", precision: 30, scale: 10
    t.decimal "155954X1394X14930Component4", precision: 30, scale: 10
    t.decimal "155954X1394X14930Component5", precision: 30, scale: 10
    t.text "155954X1394X14931"
    t.integer "155954X1394X14931_filecount"
    t.index ["token"], name: "idx_survey_token_155954_16562"
  end

  create_table "lime_survey_156227", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "156227X564X6956StudentYear"
    t.text "156227X564X6956StudentEmail"
    t.text "156227X564X6956StudentName"
    t.text "156227X564X6956CoachEmail"
    t.text "156227X564X6956CoachName"
    t.text "156227X565X6957CourseYear"
    t.text "156227X565X6957CourseName"
    t.decimal "156227X565X6958Week1MCQ", precision: 30, scale: 10
    t.decimal "156227X565X6958Week2MCQ", precision: 30, scale: 10
    t.decimal "156227X565X6958Week3MCQ", precision: 30, scale: 10
    t.decimal "156227X565X6958Week4MCQ", precision: 30, scale: 10
    t.decimal "156227X565X6958Week5MCQ", precision: 30, scale: 10
    t.text "156227X565X6959DroppedQuiz"
    t.text "156227X565X6959DroppedScore"
    t.decimal "156227X565X6965CSA1", precision: 30, scale: 10
    t.decimal "156227X565X6965CSA2", precision: 30, scale: 10
    t.decimal "156227X565X6965CSA3", precision: 30, scale: 10
    t.decimal "156227X565X6965CSA4", precision: 30, scale: 10
    t.decimal "156227X565X6965CSA5", precision: 30, scale: 10
    t.decimal "156227X565X6965CSA6", precision: 30, scale: 10
    t.decimal "156227X565X6965CSA7", precision: 30, scale: 10
    t.decimal "156227X565X6960FinalBlock", precision: 30, scale: 10
    t.decimal "156227X565X6961", precision: 30, scale: 10
    t.decimal "156227X565X6962OSCE", precision: 30, scale: 10
    t.decimal "156227X565X6962Pathology", precision: 30, scale: 10
    t.decimal "156227X565X6962CellbioImmuno", precision: 30, scale: 10
    t.decimal "156227X565X6962Histology", precision: 30, scale: 10
    t.decimal "156227X565X6962PathHeme", precision: 30, scale: 10
    t.decimal "156227X565X6962Microbio", precision: 30, scale: 10
    t.decimal "156227X565X6963Component1", precision: 30, scale: 10
    t.decimal "156227X565X6963Component2", precision: 30, scale: 10
    t.decimal "156227X565X6963Component3", precision: 30, scale: 10
    t.decimal "156227X565X6963Component4", precision: 30, scale: 10
    t.decimal "156227X565X6963Component5", precision: 30, scale: 10
    t.text "156227X565X6964"
    t.integer "156227X565X6964_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_156227_38713"
  end

  create_table "lime_survey_158233", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "158233X548X6789InstructorKnowledge", limit: 5
    t.string "158233X548X6789InstructorWellPrep", limit: 5
    t.string "158233X548X6789InstructorRate", limit: 5
    t.text "158233X548X6790"
    t.text "158233X548X6791"
    t.text "158233X548X6792"
    t.text "158233X548X6793"
    t.text "158233X548X6794"
    t.text "158233X548X6795"
    t.string "158233X548X6796ClickerQ", limit: 5
    t.string "158233X548X6796Brief", limit: 5
    t.string "158233X548X6796Pair", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_158233_39005"
  end

  create_table "lime_survey_166929", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "166929X617X7505"
    t.text "166929X617X7506"
    t.text "166929X617X7507"
    t.text "166929X617X7508"
    t.text "166929X617X7504"
    t.text "166929X617X7510"
    t.text "166929X617X7509"
    t.text "166929X616X7501SQ1"
    t.text "166929X616X7501SQ2"
    t.text "166929X616X7501SQ3"
    t.text "166929X616X7501SQ4"
    t.text "166929X616X7501SQ5"
    t.text "166929X616X7501SQ6"
    t.text "166929X616X7501SQ7"
    t.text "166929X616X7501SQ8"
    t.text "166929X616X7501SQ9"
    t.text "166929X616X7501SQ10"
    t.text "166929X616X7502SQ1"
    t.text "166929X616X7502SQ2"
    t.text "166929X616X7502SQ3"
    t.text "166929X616X7502SQ4"
    t.text "166929X616X7502SQ5"
    t.text "166929X616X7502SQ6"
    t.text "166929X616X7502SQ7"
    t.text "166929X616X7502SQ8"
    t.text "166929X616X7502SQ9"
    t.text "166929X616X7502SQ10"
    t.string "166929X616X7503SQ1", limit: 5
    t.string "166929X616X7503SQ2", limit: 5
    t.string "166929X616X7503SQ3", limit: 5
    t.string "166929X616X7503SQ4", limit: 5
    t.string "166929X616X7503SQ5", limit: 5
    t.string "166929X616X7503SQ6", limit: 5
    t.string "166929X616X7503SQ7", limit: 5
    t.string "166929X616X7503SQ8", limit: 5
    t.string "166929X616X7503SQ9", limit: 5
    t.string "166929X616X7503SQ10", limit: 5
    t.text "166929X616X7514SQ1"
    t.text "166929X616X7514SQ2"
    t.text "166929X616X7514SQ3"
    t.text "166929X616X7514SQ4"
    t.text "166929X616X7514SQ5"
    t.text "166929X616X7514SQ6"
    t.text "166929X616X7514SQ7"
    t.text "166929X616X7514SQ8"
    t.text "166929X616X7514SQ9"
    t.text "166929X616X7514SQ10"
    t.text "166929X618X7511SQ1"
    t.text "166929X618X7511SQ2"
    t.text "166929X618X7511SQ3"
    t.text "166929X618X7511SQ4"
    t.text "166929X618X7511SQ5"
    t.text "166929X618X7511SQ6"
    t.text "166929X618X7511SQ7"
    t.text "166929X618X7511SQ8"
    t.text "166929X618X7511SQ9"
    t.text "166929X618X7511SQ10"
    t.text "166929X618X7512SQ1"
    t.text "166929X618X7512SQ2"
    t.text "166929X618X7512SQ3"
    t.text "166929X618X7512SQ4"
    t.text "166929X618X7512SQ5"
    t.text "166929X618X7512SQ6"
    t.text "166929X618X7512SQ7"
    t.text "166929X618X7512SQ8"
    t.text "166929X618X7512SQ9"
    t.text "166929X618X7512SQ10"
    t.string "166929X618X7513SQ1", limit: 5
    t.string "166929X618X7513SQ2", limit: 5
    t.string "166929X618X7513SQ3", limit: 5
    t.string "166929X618X7513SQ4", limit: 5
    t.string "166929X618X7513SQ5", limit: 5
    t.string "166929X618X7513SQ6", limit: 5
    t.string "166929X618X7513SQ7", limit: 5
    t.string "166929X618X7513SQ8", limit: 5
    t.string "166929X618X7513SQ9", limit: 5
    t.string "166929X618X7513SQ10", limit: 5
    t.text "166929X618X7515SQ1"
    t.text "166929X618X7515SQ2"
    t.text "166929X618X7515SQ3"
    t.text "166929X618X7515SQ4"
    t.text "166929X618X7515SQ5"
    t.text "166929X618X7515SQ6"
    t.text "166929X618X7515SQ7"
    t.text "166929X618X7515SQ8"
    t.text "166929X618X7515SQ9"
    t.text "166929X618X7515SQ10"
    t.text "166929X619X7516SQ1"
    t.text "166929X619X7516SQ2"
    t.text "166929X619X7516SQ3"
    t.text "166929X619X7516SQ4"
    t.text "166929X619X7516SQ5"
    t.text "166929X619X7516SQ6"
    t.text "166929X619X7516SQ7"
    t.text "166929X619X7516SQ8"
    t.text "166929X619X7516SQ9"
    t.text "166929X619X7516SQ10"
    t.text "166929X619X7517SQ1"
    t.text "166929X619X7517SQ2"
    t.text "166929X619X7517SQ3"
    t.text "166929X619X7517SQ4"
    t.text "166929X619X7517SQ5"
    t.text "166929X619X7517SQ6"
    t.text "166929X619X7517SQ7"
    t.text "166929X619X7517SQ8"
    t.text "166929X619X7517SQ9"
    t.text "166929X619X7517SQ10"
    t.string "166929X619X7518SQ1", limit: 5
    t.string "166929X619X7518SQ2", limit: 5
    t.string "166929X619X7518SQ3", limit: 5
    t.string "166929X619X7518SQ4", limit: 5
    t.string "166929X619X7518SQ5", limit: 5
    t.string "166929X619X7518SQ6", limit: 5
    t.string "166929X619X7518SQ7", limit: 5
    t.string "166929X619X7518SQ8", limit: 5
    t.string "166929X619X7518SQ9", limit: 5
    t.string "166929X619X7518SQ10", limit: 5
    t.text "166929X619X7519SQ1"
    t.text "166929X619X7519SQ2"
    t.text "166929X619X7519SQ3"
    t.text "166929X619X7519SQ4"
    t.text "166929X619X7519SQ5"
    t.text "166929X619X7519SQ6"
    t.text "166929X619X7519SQ7"
    t.text "166929X619X7519SQ8"
    t.text "166929X619X7519SQ9"
    t.text "166929X619X7519SQ10"
    t.text "166929X620X7520SQ1"
    t.text "166929X620X7520SQ2"
    t.text "166929X620X7520SQ3"
    t.text "166929X620X7520SQ4"
    t.text "166929X620X7520SQ5"
    t.text "166929X620X7520SQ6"
    t.text "166929X620X7520SQ7"
    t.text "166929X620X7520SQ8"
    t.text "166929X620X7520SQ9"
    t.text "166929X620X7520SQ10"
    t.text "166929X620X7521SQ1"
    t.text "166929X620X7521SQ2"
    t.text "166929X620X7521SQ3"
    t.text "166929X620X7521SQ4"
    t.text "166929X620X7521SQ5"
    t.text "166929X620X7521SQ6"
    t.text "166929X620X7521SQ7"
    t.text "166929X620X7521SQ8"
    t.text "166929X620X7521SQ9"
    t.text "166929X620X7521SQ10"
    t.string "166929X620X7522SQ1", limit: 5
    t.string "166929X620X7522SQ2", limit: 5
    t.string "166929X620X7522SQ3", limit: 5
    t.string "166929X620X7522SQ4", limit: 5
    t.string "166929X620X7522SQ5", limit: 5
    t.string "166929X620X7522SQ6", limit: 5
    t.string "166929X620X7522SQ7", limit: 5
    t.string "166929X620X7522SQ8", limit: 5
    t.string "166929X620X7522SQ9", limit: 5
    t.string "166929X620X7522SQ10", limit: 5
    t.text "166929X620X7523SQ1"
    t.text "166929X620X7523SQ2"
    t.text "166929X620X7523SQ3"
    t.text "166929X620X7523SQ4"
    t.text "166929X620X7523SQ5"
    t.text "166929X620X7523SQ6"
    t.text "166929X620X7523SQ7"
    t.text "166929X620X7523SQ8"
    t.text "166929X620X7523SQ9"
    t.text "166929X620X7523SQ10"
    t.text "166929X621X7524SQ1"
    t.text "166929X621X7524SQ2"
    t.text "166929X621X7524SQ3"
    t.text "166929X621X7524SQ4"
    t.text "166929X621X7524SQ5"
    t.text "166929X621X7524SQ6"
    t.text "166929X621X7524SQ7"
    t.text "166929X621X7524SQ8"
    t.text "166929X621X7524SQ9"
    t.text "166929X621X7524SQ10"
    t.text "166929X621X7525SQ1"
    t.text "166929X621X7525SQ2"
    t.text "166929X621X7525SQ3"
    t.text "166929X621X7525SQ4"
    t.text "166929X621X7525SQ5"
    t.text "166929X621X7525SQ6"
    t.text "166929X621X7525SQ7"
    t.text "166929X621X7525SQ8"
    t.text "166929X621X7525SQ9"
    t.text "166929X621X7525SQ10"
    t.string "166929X621X7526SQ1", limit: 5
    t.string "166929X621X7526SQ2", limit: 5
    t.string "166929X621X7526SQ3", limit: 5
    t.string "166929X621X7526SQ4", limit: 5
    t.string "166929X621X7526SQ5", limit: 5
    t.string "166929X621X7526SQ6", limit: 5
    t.string "166929X621X7526SQ7", limit: 5
    t.string "166929X621X7526SQ8", limit: 5
    t.string "166929X621X7526SQ9", limit: 5
    t.string "166929X621X7526SQ10", limit: 5
    t.text "166929X621X7527SQ1"
    t.text "166929X621X7527SQ2"
    t.text "166929X621X7527SQ3"
    t.text "166929X621X7527SQ4"
    t.text "166929X621X7527SQ5"
    t.text "166929X621X7527SQ6"
    t.text "166929X621X7527SQ7"
    t.text "166929X621X7527SQ8"
    t.text "166929X621X7527SQ9"
    t.text "166929X621X7527SQ10"
    t.text "166929X622X7528SQ1"
    t.text "166929X622X7528SQ2"
    t.text "166929X622X7528SQ3"
    t.text "166929X622X7528SQ4"
    t.text "166929X622X7528SQ5"
    t.text "166929X622X7528SQ6"
    t.text "166929X622X7528SQ7"
    t.text "166929X622X7528SQ8"
    t.text "166929X622X7528SQ9"
    t.text "166929X622X7528SQ10"
    t.text "166929X622X7529SQ1"
    t.text "166929X622X7529SQ2"
    t.text "166929X622X7529SQ3"
    t.text "166929X622X7529SQ4"
    t.text "166929X622X7529SQ5"
    t.text "166929X622X7529SQ6"
    t.text "166929X622X7529SQ7"
    t.text "166929X622X7529SQ8"
    t.text "166929X622X7529SQ9"
    t.text "166929X622X7529SQ10"
    t.string "166929X622X7530SQ1", limit: 5
    t.string "166929X622X7530SQ2", limit: 5
    t.string "166929X622X7530SQ3", limit: 5
    t.string "166929X622X7530SQ4", limit: 5
    t.string "166929X622X7530SQ5", limit: 5
    t.string "166929X622X7530SQ6", limit: 5
    t.string "166929X622X7530SQ7", limit: 5
    t.string "166929X622X7530SQ8", limit: 5
    t.string "166929X622X7530SQ9", limit: 5
    t.string "166929X622X7530SQ10", limit: 5
    t.text "166929X622X7531SQ1"
    t.text "166929X622X7531SQ2"
    t.text "166929X622X7531SQ3"
    t.text "166929X622X7531SQ4"
    t.text "166929X622X7531SQ5"
    t.text "166929X622X7531SQ6"
    t.text "166929X622X7531SQ7"
    t.text "166929X622X7531SQ8"
    t.text "166929X622X7531SQ9"
    t.text "166929X622X7531SQ10"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_166929_34184"
  end

  create_table "lime_survey_171898", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "171898X1148X13336SQ001", limit: 5
    t.string "171898X1148X13336SQ002", limit: 5
    t.string "171898X1148X13336SQ005", limit: 5
    t.string "171898X1148X13336SQ004", limit: 5
    t.string "171898X1148X13336SQ006", limit: 5
    t.string "171898X1149X13337SQ001", limit: 5
    t.string "171898X1149X13337SQ004", limit: 5
    t.string "171898X1149X13337SQ003", limit: 5
    t.string "171898X1149X13337SQ002", limit: 5
    t.text "171898X1150X13338"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_171898_43483"
  end

  create_table "lime_survey_174335", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "174335X852X9555"
    t.text "174335X852X9558"
    t.string "174335X855X9559", limit: 5
    t.text "174335X855X9560"
    t.text "174335X855X9554StudentYear"
    t.text "174335X855X9554StudentEmail"
    t.text "174335X855X9554StudentName"
    t.text "174335X855X9554CoachEmail"
    t.text "174335X855X9554CoachName"
    t.string "174335X853X9556C1", limit: 5
    t.string "174335X853X9556C2", limit: 5
    t.string "174335X853X9556C3", limit: 5
    t.string "174335X853X9556C4", limit: 5
    t.string "174335X853X9556C5", limit: 5
    t.string "174335X853X9556C6", limit: 5
    t.string "174335X853X9556C7", limit: 5
    t.string "174335X853X9556C8", limit: 5
    t.string "174335X853X9556C9", limit: 5
    t.text "174335X854X9557"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_174335_47809"
  end

  create_table "lime_survey_174547", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "174547X1032X12397SQ001"
    t.text "174547X1032X12397SQ002"
    t.text "174547X1032X12397SQ003"
    t.text "174547X1032X12397SQ004"
    t.text "174547X1032X12397SQ005"
    t.string "174547X1033X12403", limit: 5
    t.string "174547X1033X12404", limit: 5
    t.string "174547X1033X12405", limit: 5
    t.string "174547X1033X12406", limit: 5
    t.string "174547X1033X12407", limit: 5
    t.string "174547X1033X12408", limit: 5
    t.string "174547X1034X12409SQ001", limit: 5
    t.string "174547X1034X12409SQ002", limit: 5
    t.string "174547X1034X12409SQ003", limit: 5
    t.string "174547X1034X12409SQ004", limit: 5
    t.string "174547X1034X12409SQ005", limit: 5
    t.string "174547X1034X12409SQ006", limit: 5
    t.string "174547X1034X12409SQ007", limit: 5
    t.string "174547X1034X12409SQ008", limit: 5
    t.string "174547X1034X12409SQ009", limit: 5
    t.text "174547X1034X12419"
    t.text "174547X1035X12420"
    t.text "174547X1035X12421"
    t.string "174547X1036X12422", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_174547_49993"
  end

  create_table "lime_survey_179962", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "179962X1159X13371SQ001", limit: 5
    t.string "179962X1159X13371SQ004", limit: 5
    t.string "179962X1159X13371SQ003", limit: 5
    t.string "179962X1159X13371SQ002", limit: 5
    t.text "179962X1159X13408"
    t.string "179962X1160X13375SQ001", limit: 5
    t.string "179962X1160X13375SQ002", limit: 5
    t.string "179962X1160X13375SQ003", limit: 5
    t.string "179962X1160X13375SQ004", limit: 5
    t.text "179962X1160X13409"
    t.string "179962X1161X13380SQ001", limit: 5
    t.string "179962X1161X13380SQ002", limit: 5
    t.text "179962X1161X13410"
    t.string "179962X1161X14132SQ001", limit: 5
    t.text "179962X1162X13383"
    t.text "179962X1162X13384"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_179962_18941"
  end

  create_table "lime_survey_181695", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "181695X971X107411", limit: 5
    t.string "181695X971X107412", limit: 5
    t.string "181695X971X107413", limit: 5
    t.string "181695X971X107421", limit: 5
    t.string "181695X971X107422", limit: 5
    t.string "181695X971X107423", limit: 5
    t.string "181695X971X107391", limit: 5
    t.string "181695X971X107392", limit: 5
    t.string "181695X971X107393", limit: 5
    t.string "181695X971X107401", limit: 5
    t.string "181695X971X107402", limit: 5
    t.string "181695X971X107403", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_181695_38650"
  end

  create_table "lime_survey_186962", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "186962X1538X16677StudentYear"
    t.text "186962X1538X16677StudentEmail"
    t.text "186962X1538X16677StudentName"
    t.text "186962X1538X16677CoachEmail"
    t.text "186962X1538X16677CoachName"
    t.text "186962X1535X16653FirstName"
    t.text "186962X1535X16653LastName"
    t.text "186962X1535X16653Address1"
    t.text "186962X1535X16653Address2"
    t.text "186962X1535X16653City"
    t.text "186962X1535X16653State"
    t.text "186962X1535X16653ZipCode"
    t.text "186962X1535X16653HomePhone"
    t.text "186962X1535X16653MobilePhone"
    t.datetime "186962X1535X16654", precision: nil
    t.string "186962X1535X16655", limit: 5
    t.text "186962X1535X16655other"
    t.string "186962X1535X16656", limit: 5
    t.text "186962X1535X16656other"
    t.string "186962X1535X16657", limit: 5
    t.string "186962X1535X166581", limit: 5
    t.string "186962X1535X166582", limit: 5
    t.string "186962X1535X166583", limit: 5
    t.string "186962X1535X166584", limit: 5
    t.string "186962X1535X166585", limit: 5
    t.text "186962X1535X16658other"
    t.string "186962X1535X16659", limit: 5
    t.string "186962X1535X16673", limit: 1
    t.text "186962X1535X16660Child1_Age1"
    t.text "186962X1535X16660Child2_Age1"
    t.text "186962X1535X16660Child3_Age1"
    t.text "186962X1535X16660Child4_Age1"
    t.text "186962X1535X16660Child5_Age1"
    t.text "186962X1535X16661City"
    t.text "186962X1535X16661State"
    t.text "186962X1535X16661Country"
    t.text "186962X1535X16662City"
    t.text "186962X1535X16662State"
    t.text "186962X1535X16662Country"
    t.text "186962X1535X16674Hobby1"
    t.text "186962X1535X16674Hobby2"
    t.text "186962X1535X16674Hobby3"
    t.decimal "186962X1536X16663", precision: 30, scale: 10
    t.text "186962X1536X16664Row1_Institution"
    t.text "186962X1536X16664Row1_DegreeAttained"
    t.text "186962X1536X16664Row1_MajorAreaStudy"
    t.text "186962X1536X16664Row1_MinorAreaStudy"
    t.text "186962X1536X16664Row1_YrGrad"
    t.text "186962X1536X16664Row1_ScienceCoursesHrs"
    t.text "186962X1536X16664Row1_ScienceCoursesGPA"
    t.text "186962X1536X16664Row1_OverallGPA"
    t.text "186962X1536X16664Row2_Institution"
    t.text "186962X1536X16664Row2_DegreeAttained"
    t.text "186962X1536X16664Row2_MajorAreaStudy"
    t.text "186962X1536X16664Row2_MinorAreaStudy"
    t.text "186962X1536X16664Row2_YrGrad"
    t.text "186962X1536X16664Row2_ScienceCoursesHrs"
    t.text "186962X1536X16664Row2_ScienceCoursesGPA"
    t.text "186962X1536X16664Row2_OverallGPA"
    t.text "186962X1536X16664Row3_Institution"
    t.text "186962X1536X16664Row3_DegreeAttained"
    t.text "186962X1536X16664Row3_MajorAreaStudy"
    t.text "186962X1536X16664Row3_MinorAreaStudy"
    t.text "186962X1536X16664Row3_YrGrad"
    t.text "186962X1536X16664Row3_ScienceCoursesHrs"
    t.text "186962X1536X16664Row3_ScienceCoursesGPA"
    t.text "186962X1536X16664Row3_OverallGPA"
    t.text "186962X1536X16664Row4_Institution"
    t.text "186962X1536X16664Row4_DegreeAttained"
    t.text "186962X1536X16664Row4_MajorAreaStudy"
    t.text "186962X1536X16664Row4_MinorAreaStudy"
    t.text "186962X1536X16664Row4_YrGrad"
    t.text "186962X1536X16664Row4_ScienceCoursesHrs"
    t.text "186962X1536X16664Row4_ScienceCoursesGPA"
    t.text "186962X1536X16664Row4_OverallGPA"
    t.text "186962X1536X16665Row1_YrMCAT"
    t.text "186962X1536X16665Row1_PhsySciences"
    t.text "186962X1536X16665Row1_VerbalReasoning"
    t.text "186962X1536X16665Row1_BioSciences"
    t.text "186962X1536X16665Row1_MCATTotScore"
    t.text "186962X1536X16665Row2_YrMCAT"
    t.text "186962X1536X16665Row2_PhsySciences"
    t.text "186962X1536X16665Row2_VerbalReasoning"
    t.text "186962X1536X16665Row2_BioSciences"
    t.text "186962X1536X16665Row2_MCATTotScore"
    t.text "186962X1536X16665Row3_YrMCAT"
    t.text "186962X1536X16665Row3_PhsySciences"
    t.text "186962X1536X16665Row3_VerbalReasoning"
    t.text "186962X1536X16665Row3_BioSciences"
    t.text "186962X1536X16665Row3_MCATTotScore"
    t.text "186962X1536X16666Row1_YrMCAT"
    t.text "186962X1536X16666Row1_ChemPhyBioSys"
    t.text "186962X1536X16666Row1_CriticalAnalysis"
    t.text "186962X1536X16666Row1_BioFoundOfLivingSys"
    t.text "186962X1536X16666Row1_PsychSocBioFoundOfBe"
    t.text "186962X1536X16666Row1_MCATTotScore"
    t.text "186962X1536X16666Row2_YrMCAT"
    t.text "186962X1536X16666Row2_ChemPhyBioSys"
    t.text "186962X1536X16666Row2_CriticalAnalysis"
    t.text "186962X1536X16666Row2_BioFoundOfLivingSys"
    t.text "186962X1536X16666Row2_PsychSocBioFoundOfBe"
    t.text "186962X1536X16666Row2_MCATTotScore"
    t.text "186962X1536X16666Row3_YrMCAT"
    t.text "186962X1536X16666Row3_ChemPhyBioSys"
    t.text "186962X1536X16666Row3_CriticalAnalysis"
    t.text "186962X1536X16666Row3_BioFoundOfLivingSys"
    t.text "186962X1536X16666Row3_PsychSocBioFoundOfBe"
    t.text "186962X1536X16666Row3_MCATTotScore"
    t.text "186962X1536X16675"
    t.string "186962X1536X16667", limit: 5
    t.text "186962X1536X16668Row1_HealthcareSetting"
    t.text "186962X1536X16668Row1_CountryServed"
    t.text "186962X1536X16668Row1_Role"
    t.text "186962X1536X16668Row1_InclusiveYrs"
    t.text "186962X1536X16668Row2_HealthcareSetting"
    t.text "186962X1536X16668Row2_CountryServed"
    t.text "186962X1536X16668Row2_Role"
    t.text "186962X1536X16668Row2_InclusiveYrs"
    t.text "186962X1536X16668Row3_HealthcareSetting"
    t.text "186962X1536X16668Row3_CountryServed"
    t.text "186962X1536X16668Row3_Role"
    t.text "186962X1536X16668Row3_InclusiveYrs"
    t.text "186962X1536X16676Experience1"
    t.text "186962X1536X16676Experience2"
    t.text "186962X1536X16676Experience3"
    t.string "186962X1536X16669", limit: 5
    t.string "186962X1536X166701", limit: 5
    t.string "186962X1536X166702", limit: 5
    t.string "186962X1536X166703", limit: 5
    t.string "186962X1536X166704", limit: 5
    t.string "186962X1536X166705", limit: 5
    t.string "186962X1536X166706", limit: 5
    t.string "186962X1536X166707", limit: 5
    t.string "186962X1536X166708", limit: 5
    t.string "186962X1536X166709", limit: 5
    t.string "186962X1536X1667010", limit: 5
    t.string "186962X1536X1667011", limit: 5
    t.string "186962X1536X1667012", limit: 5
    t.string "186962X1536X1667013", limit: 5
    t.string "186962X1536X1667014", limit: 5
    t.string "186962X1536X1667015", limit: 5
    t.string "186962X1536X1667016", limit: 5
    t.string "186962X1536X1667017", limit: 5
    t.string "186962X1536X1667018", limit: 5
    t.string "186962X1536X1667019", limit: 5
    t.string "186962X1536X1667020", limit: 5
    t.string "186962X1536X1667021", limit: 5
    t.string "186962X1536X1667022", limit: 5
    t.string "186962X1536X1667023", limit: 5
    t.string "186962X1537X166711", limit: 5
    t.string "186962X1537X166712", limit: 5
    t.string "186962X1537X166713", limit: 5
    t.string "186962X1537X166714", limit: 5
    t.string "186962X1537X166715", limit: 5
    t.string "186962X1537X166716", limit: 5
    t.string "186962X1537X166717", limit: 5
    t.decimal "186962X1537X16672NoOfAdults", precision: 30, scale: 10
    t.decimal "186962X1537X16672NoOfChildrens", precision: 30, scale: 10
    t.index ["token"], name: "idx_survey_token_186962_46346"
  end

  create_table "lime_survey_187299", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "187299X1488X16282SQ001"
    t.text "187299X1488X16282SQ002"
    t.text "187299X1488X16282SQ004"
    t.text "187299X1488X16282SQ005"
    t.string "187299X1489X16286", limit: 5
    t.string "187299X1489X16283", limit: 5
    t.string "187299X1489X16285", limit: 5
    t.string "187299X1489X16284", limit: 5
    t.string "187299X1490X16287SQ001", limit: 5
    t.string "187299X1490X16287SQ002", limit: 5
    t.string "187299X1490X16287SQ003", limit: 5
    t.string "187299X1490X16287SQ004", limit: 5
    t.string "187299X1490X16287SQ005", limit: 5
    t.string "187299X1490X16287SQ006", limit: 5
    t.string "187299X1490X16287SQ007", limit: 5
    t.string "187299X1490X16287SQ008", limit: 5
    t.string "187299X1490X16287SQ009", limit: 5
    t.text "187299X1490X16288"
    t.text "187299X1491X16289"
    t.text "187299X1491X16290"
    t.string "187299X1492X16291", limit: 5
    t.index ["token"], name: "idx_survey_token_187299_42601"
  end

  create_table "lime_survey_191467", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "191467X224X2748StudentYear"
    t.text "191467X224X2748StudentEmail"
    t.text "191467X224X2748StudentName"
    t.text "191467X224X2748CoachEmail"
    t.text "191467X224X2748CoachName"
    t.text "191467X225X2755CourseYear"
    t.text "191467X225X2755CourseName"
    t.decimal "191467X225X2749Week1MCQ", precision: 30, scale: 10
    t.decimal "191467X225X2749Week2MCQ", precision: 30, scale: 10
    t.decimal "191467X225X2749Week3MCQ", precision: 30, scale: 10
    t.decimal "191467X225X2749Week4MCQ", precision: 30, scale: 10
    t.decimal "191467X225X2749Week5MCQ", precision: 30, scale: 10
    t.text "191467X225X2750DroppedQuiz"
    t.text "191467X225X2750DroppedScore"
    t.decimal "191467X225X2751CSA1", precision: 30, scale: 10
    t.decimal "191467X225X2751CSA2", precision: 30, scale: 10
    t.decimal "191467X225X2751CSA3", precision: 30, scale: 10
    t.decimal "191467X225X2751CSA4", precision: 30, scale: 10
    t.decimal "191467X225X2751CSA5", precision: 30, scale: 10
    t.decimal "191467X225X2752", precision: 30, scale: 10
    t.decimal "191467X225X2753", precision: 30, scale: 10
    t.decimal "191467X225X2754Comp5a", precision: 30, scale: 10
    t.decimal "191467X225X2754Comp5b", precision: 30, scale: 10
    t.decimal "191467X225X2754Comp5c", precision: 30, scale: 10
    t.decimal "191467X225X2756Component1", precision: 30, scale: 10
    t.decimal "191467X225X2756Component2", precision: 30, scale: 10
    t.decimal "191467X225X2756Component3", precision: 30, scale: 10
    t.decimal "191467X225X2756Component4", precision: 30, scale: 10
    t.decimal "191467X225X2756Component5", precision: 30, scale: 10
    t.text "191467X225X2757"
    t.integer "191467X225X2757_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_191467_45593"
  end

  create_table "lime_survey_195566", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "195566X1544X16789SQ001"
    t.text "195566X1544X16789SQ002"
    t.text "195566X1544X16789SQ004"
    t.text "195566X1544X16789SQ005"
    t.string "195566X1545X16793", limit: 5
    t.string "195566X1545X16790", limit: 5
    t.string "195566X1545X16792", limit: 5
    t.string "195566X1545X16791", limit: 5
    t.string "195566X1546X16794SQ001", limit: 5
    t.string "195566X1546X16794SQ002", limit: 5
    t.string "195566X1546X16794SQ003", limit: 5
    t.string "195566X1546X16794SQ004", limit: 5
    t.string "195566X1546X16794SQ005", limit: 5
    t.string "195566X1546X16794SQ006", limit: 5
    t.string "195566X1546X16794SQ007", limit: 5
    t.string "195566X1546X16794SQ008", limit: 5
    t.string "195566X1546X16794SQ009", limit: 5
    t.text "195566X1546X16795"
    t.text "195566X1547X16796"
    t.text "195566X1547X16797"
    t.string "195566X1548X16798", limit: 5
    t.index ["token"], name: "idx_survey_token_195566_30996"
  end

  create_table "lime_survey_196377", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "196377X1041X124521", limit: 5
    t.string "196377X1041X124522", limit: 5
    t.string "196377X1041X124523", limit: 5
    t.string "196377X1041X124524", limit: 5
    t.string "196377X1041X124525", limit: 5
    t.string "196377X1041X124526", limit: 5
    t.string "196377X1041X124527", limit: 5
    t.string "196377X1041X1245283", limit: 5
    t.string "196377X1041X124529", limit: 5
    t.string "196377X1041X1245210", limit: 5
    t.string "196377X1041X1245211", limit: 5
    t.string "196377X1041X1245212", limit: 5
    t.string "196377X1041X1245213", limit: 5
    t.string "196377X1041X1245214", limit: 5
    t.string "196377X1041X1245215", limit: 5
    t.string "196377X1041X1245216", limit: 5
    t.string "196377X1041X1245217", limit: 5
    t.string "196377X1041X1245218", limit: 5
    t.string "196377X1041X1245219", limit: 5
    t.string "196377X1041X1245220", limit: 5
    t.string "196377X1041X1245221", limit: 5
    t.string "196377X1041X1245222", limit: 5
    t.string "196377X1041X1245223", limit: 5
    t.string "196377X1041X1245224", limit: 5
    t.string "196377X1041X1245225", limit: 5
    t.string "196377X1041X1245226", limit: 5
    t.string "196377X1041X1245227", limit: 5
    t.string "196377X1041X1245228", limit: 5
    t.string "196377X1041X1245229", limit: 5
    t.string "196377X1041X1245230", limit: 5
    t.string "196377X1041X1245231", limit: 5
    t.string "196377X1041X1245232", limit: 5
    t.string "196377X1041X1245233", limit: 5
    t.string "196377X1041X1245234", limit: 5
    t.string "196377X1041X1245235", limit: 5
    t.string "196377X1041X1245236", limit: 5
    t.string "196377X1041X1245237", limit: 5
    t.string "196377X1041X1245238", limit: 5
    t.string "196377X1041X1245239", limit: 5
    t.string "196377X1041X1245240", limit: 5
    t.string "196377X1041X1245241", limit: 5
    t.string "196377X1041X1245242", limit: 5
    t.string "196377X1041X1245243", limit: 5
    t.string "196377X1041X1245244", limit: 5
    t.string "196377X1041X1245245", limit: 5
    t.string "196377X1041X1245246", limit: 5
    t.string "196377X1041X1245247", limit: 5
    t.string "196377X1041X1245248", limit: 5
    t.string "196377X1041X1245249", limit: 5
    t.string "196377X1041X1245250", limit: 5
    t.string "196377X1041X1245251", limit: 5
    t.string "196377X1041X1245252", limit: 5
    t.string "196377X1041X1245253", limit: 5
    t.string "196377X1041X1245254", limit: 5
    t.string "196377X1041X1245255", limit: 5
    t.string "196377X1041X1245256", limit: 5
    t.string "196377X1041X1245257", limit: 5
    t.string "196377X1041X1245258", limit: 5
    t.string "196377X1041X1245259", limit: 5
    t.string "196377X1041X1245260", limit: 5
    t.string "196377X1041X1245261", limit: 5
    t.string "196377X1041X1245262", limit: 5
    t.string "196377X1041X1245263", limit: 5
    t.string "196377X1041X1245264", limit: 5
    t.string "196377X1041X1245265", limit: 5
    t.string "196377X1041X1245266", limit: 5
    t.string "196377X1041X1245267", limit: 5
    t.string "196377X1041X1245268", limit: 5
    t.string "196377X1041X1245269", limit: 5
    t.string "196377X1041X1245270", limit: 5
    t.string "196377X1041X1245271", limit: 5
    t.string "196377X1041X1245272", limit: 5
    t.string "196377X1041X1245273", limit: 5
    t.string "196377X1041X1245274", limit: 5
    t.string "196377X1041X1245275", limit: 5
    t.string "196377X1041X1245276", limit: 5
    t.string "196377X1041X1245277", limit: 5
    t.string "196377X1041X1245278", limit: 5
    t.string "196377X1041X1245279", limit: 5
    t.string "196377X1041X1245280", limit: 5
    t.string "196377X1041X1245281", limit: 5
    t.string "196377X1041X1245282", limit: 5
    t.string "196377X1041X1245284", limit: 5
    t.string "196377X1041X1245285", limit: 5
    t.string "196377X1041X1245286", limit: 5
    t.string "196377X1041X1245287", limit: 5
    t.string "196377X1041X1245288", limit: 5
    t.string "196377X1041X1245289", limit: 5
    t.string "196377X1041X1245290", limit: 5
    t.string "196377X1041X1245291", limit: 5
    t.string "196377X1041X1245292", limit: 5
    t.string "196377X1041X1245293", limit: 5
    t.string "196377X1041X1245294", limit: 5
    t.string "196377X1041X1245295", limit: 5
    t.string "196377X1041X1245296", limit: 5
    t.string "196377X1041X1245297", limit: 5
    t.string "196377X1041X1245298", limit: 5
    t.string "196377X1041X1245299", limit: 5
    t.string "196377X1041X12452100", limit: 5
    t.string "196377X1041X12452101", limit: 5
    t.string "196377X1041X12452102", limit: 5
    t.string "196377X1041X12452103", limit: 5
    t.string "196377X1041X12452104", limit: 5
    t.string "196377X1041X12452105", limit: 5
    t.string "196377X1041X12452106", limit: 5
    t.string "196377X1041X12452107", limit: 5
    t.string "196377X1041X12452108", limit: 5
    t.string "196377X1041X12452109", limit: 5
    t.string "196377X1041X12452110", limit: 5
    t.string "196377X1041X12452111", limit: 5
    t.string "196377X1041X12452112", limit: 5
    t.string "196377X1041X12452113", limit: 5
    t.string "196377X1041X12452114", limit: 5
    t.string "196377X1041X12452115", limit: 5
    t.string "196377X1041X12452116", limit: 5
    t.string "196377X1041X12452117", limit: 5
    t.string "196377X1041X12452118", limit: 5
    t.string "196377X1041X12452119", limit: 5
    t.string "196377X1041X12452120", limit: 5
    t.string "196377X1041X12452121", limit: 5
    t.string "196377X1041X12452122", limit: 5
    t.string "196377X1041X12452123", limit: 5
    t.string "196377X1041X12452124", limit: 5
    t.string "196377X1041X12452125", limit: 5
    t.string "196377X1041X12452126", limit: 5
    t.string "196377X1041X12452127", limit: 5
    t.string "196377X1041X12452128", limit: 5
    t.string "196377X1041X12452129", limit: 5
    t.string "196377X1041X12452130", limit: 5
    t.string "196377X1041X12452131", limit: 5
    t.string "196377X1041X12452132", limit: 5
    t.string "196377X1041X12452133", limit: 5
    t.string "196377X1041X12452134", limit: 5
    t.string "196377X1041X12452135", limit: 5
    t.string "196377X1041X12452136", limit: 5
    t.string "196377X1041X12452137", limit: 5
    t.string "196377X1041X12452138", limit: 5
    t.string "196377X1041X12452139", limit: 5
    t.string "196377X1041X12452140", limit: 5
    t.string "196377X1041X12452141", limit: 5
    t.string "196377X1041X12452142", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_196377_21179"
  end

  create_table "lime_survey_196476", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "196476X130X2044StudentEmail"
    t.text "196476X130X2044StudentName"
    t.text "196476X130X2044StudentID"
    t.text "196476X130X2044CoachEmail"
    t.text "196476X130X2044CoachName"
    t.string "196476X131X2038RateYourHealth4Weeks", limit: 5
    t.string "196476X131X2039ProblemsWalking", limit: 5
    t.string "196476X131X2039DifficultDailyWork", limit: 5
    t.string "196476X131X2039EmotionsProb", limit: 5
    t.string "196476X131X2039PersonalProbUsualWor", limit: 5
    t.string "196476X131X2040BodilyPain", limit: 5
    t.string "196476X131X2041Past4WeekEnergyLevel", limit: 5
    t.string "196476X131X2042BotheredEmotionalPro", limit: 5
    t.string "196476X132X2043BennUpset", limit: 5
    t.string "196476X132X2043UnableControl", limit: 5
    t.string "196476X132X2043FeltNervous", limit: 5
    t.string "196476X132X2043FeltConfident", limit: 5
    t.string "196476X132X2043FeltGoingYourWay", limit: 5
    t.string "196476X132X2043CouldNotCope", limit: 5
    t.string "196476X132X2043AbleToControl", limit: 5
    t.string "196476X132X2043OnTopOfThings", limit: 5
    t.string "196476X132X2043BeenAngered", limit: 5
    t.string "196476X132X2043PilingUpHigh", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_196476_24563"
  end

  create_table "lime_survey_211877", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "211877X275X3343"
    t.text "211877X275X3351"
    t.text "211877X275X3352"
    t.text "211877X275X3353"
    t.text "211877X275X3354"
    t.string "211877X275X3344", limit: 5
    t.string "211877X275X3345", limit: 5
    t.text "211877X275X3346"
    t.decimal "211877X275X3347", precision: 30, scale: 10
    t.string "211877X275X3348", limit: 5
    t.decimal "211877X275X3349", precision: 30, scale: 10
    t.decimal "211877X275X3350", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_211877_10306"
  end

  create_table "lime_survey_212442", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "212442X1458X15732SQ001"
    t.text "212442X1458X15732SQ002"
    t.text "212442X1458X15732SQ004"
    t.text "212442X1458X15732SQ005"
    t.string "212442X1459X15733", limit: 5
    t.string "212442X1459X15734", limit: 5
    t.string "212442X1459X15735", limit: 5
    t.string "212442X1459X15736", limit: 5
    t.string "212442X1460X15739SQ001", limit: 5
    t.string "212442X1460X15739SQ002", limit: 5
    t.string "212442X1460X15739SQ003", limit: 5
    t.string "212442X1460X15739SQ004", limit: 5
    t.string "212442X1460X15739SQ005", limit: 5
    t.string "212442X1460X15739SQ006", limit: 5
    t.string "212442X1460X15739SQ007", limit: 5
    t.string "212442X1460X15739SQ008", limit: 5
    t.string "212442X1460X15739SQ009", limit: 5
    t.text "212442X1460X15740"
    t.text "212442X1461X15741"
    t.text "212442X1461X15742"
    t.string "212442X1462X15743", limit: 5
    t.index ["token"], name: "idx_survey_token_212442_4575"
  end

  create_table "lime_survey_213273", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "213273X922X10389"
    t.text "213273X922X10390"
    t.text "213273X922X10396"
    t.text "213273X922X10397"
    t.text "213273X922X10398"
    t.text "213273X922X10399"
    t.string "213273X923X10391Represents", limit: 5
    t.string "213273X923X10391Responsible", limit: 5
    t.string "213273X923X10391Determine", limit: 5
    t.string "213273X923X10391Active", limit: 5
    t.string "213273X924X10392LearnAbout", limit: 5
    t.string "213273X924X10392AcceptAny", limit: 5
    t.string "213273X924X10392DevelopAShared", limit: 5
    t.string "213273X924X10392SpecificMeasurable", limit: 5
    t.string "213273X924X10392WorkWithYourCoach", limit: 5
    t.string "213273X925X10393RecognizePersFeeling", limit: 5
    t.string "213273X925X10393AwareOfEmotions", limit: 5
    t.string "213273X925X10393InvestigateBehavior", limit: 5
    t.string "213273X925X10393MyThinkingHabits", limit: 5
    t.string "213273X925X10393SafeLearningEnv", limit: 5
    t.string "213273X925X10393Commitment", limit: 5
    t.string "213273X925X10393Affirms", limit: 5
    t.string "213273X925X10393esLearningPrStimulat", limit: 5
    t.string "213273X925X10393Encourages", limit: 5
    t.text "213273X926X10394"
    t.text "213273X926X10395"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_213273_31593"
  end

  create_table "lime_survey_213273_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "213273X922time"
    t.float "213273X922X10389time"
    t.float "213273X922X10390time"
    t.float "213273X922X10396time"
    t.float "213273X922X10397time"
    t.float "213273X922X10398time"
    t.float "213273X922X10399time"
    t.float "213273X923time"
    t.float "213273X923X10391time"
    t.float "213273X924time"
    t.float "213273X924X10392time"
    t.float "213273X925time"
    t.float "213273X925X10393time"
    t.float "213273X926time"
    t.float "213273X926X10394time"
    t.float "213273X926X10395time"
  end

  create_table "lime_survey_216744", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "216744X1530X16588StudentYear"
    t.text "216744X1530X16588StudentEmail"
    t.text "216744X1530X16588StudentName"
    t.text "216744X1530X16588CoachEmail"
    t.text "216744X1530X16588CoachName"
    t.text "216744X1531X16589CourseYear"
    t.text "216744X1531X16589CourseName"
    t.decimal "216744X1531X16590Week1MCQ", precision: 30, scale: 10
    t.decimal "216744X1531X16590Week2MCQ", precision: 30, scale: 10
    t.decimal "216744X1531X16590Week3MCQ", precision: 30, scale: 10
    t.decimal "216744X1531X16590Week4MCQ", precision: 30, scale: 10
    t.decimal "216744X1531X16590Week5MCQ", precision: 30, scale: 10
    t.decimal "216744X1531X16590Week6MCQ", precision: 30, scale: 10
    t.decimal "216744X1531X16590Week11MCQAve", precision: 30, scale: 10
    t.text "216744X1531X16591DroppedQuiz"
    t.text "216744X1531X16591DroppedScore"
    t.decimal "216744X1531X16592CSA1", precision: 30, scale: 10
    t.decimal "216744X1531X16592CSA2", precision: 30, scale: 10
    t.decimal "216744X1531X16592CSA3", precision: 30, scale: 10
    t.decimal "216744X1531X16592CSL1", precision: 30, scale: 10
    t.decimal "216744X1531X16592HSS1", precision: 30, scale: 10
    t.decimal "216744X1531X16592HSS2Ave", precision: 30, scale: 10
    t.decimal "216744X1531X16598BSS1AnatPB", precision: 30, scale: 10
    t.decimal "216744X1531X16598BSS2AnatPL1", precision: 30, scale: 10
    t.decimal "216744X1531X16598BSS3AnatPract1", precision: 30, scale: 10
    t.decimal "216744X1531X16598BSS4Histo1", precision: 30, scale: 10
    t.decimal "216744X1531X16598BSS5Histo2", precision: 30, scale: 10
    t.decimal "216744X1531X16598BSS6Path", precision: 30, scale: 10
    t.decimal "216744X1531X16598BSS7AnatPL2", precision: 30, scale: 10
    t.decimal "216744X1531X16598BSS8AnatPract2", precision: 30, scale: 10
    t.decimal "216744X1531X16598BSS9Histo3", precision: 30, scale: 10
    t.decimal "216744X1531X16598BSS10Ave", precision: 30, scale: 10
    t.decimal "216744X1531X16593Gastro", precision: 30, scale: 10
    t.decimal "216744X1531X16593Endo", precision: 30, scale: 10
    t.decimal "216744X1531X16594NBME", precision: 30, scale: 10
    t.decimal "216744X1531X16595CSAOSCE", precision: 30, scale: 10
    t.decimal "216744X1531X16595HSSInfAve", precision: 30, scale: 10
    t.decimal "216744X1531X16599BSSHisto", precision: 30, scale: 10
    t.decimal "216744X1531X16599BSSPath", precision: 30, scale: 10
    t.decimal "216744X1531X16599BSSMicrobio", precision: 30, scale: 10
    t.decimal "216744X1531X16599BSSMeta", precision: 30, scale: 10
    t.decimal "216744X1531X16599BSSAnat", precision: 30, scale: 10
    t.decimal "216744X1531X16599BSSAve", precision: 30, scale: 10
    t.decimal "216744X1531X16596Component1", precision: 30, scale: 10
    t.decimal "216744X1531X16596Component2A", precision: 30, scale: 10
    t.decimal "216744X1531X16596Component2B", precision: 30, scale: 10
    t.decimal "216744X1531X16596Component3", precision: 30, scale: 10
    t.decimal "216744X1531X16596Component4", precision: 30, scale: 10
    t.decimal "216744X1531X16596Component5A", precision: 30, scale: 10
    t.decimal "216744X1531X16596Component5B", precision: 30, scale: 10
    t.text "216744X1531X16597"
    t.integer "216744X1531X16597_filecount"
    t.index ["token"], name: "idx_survey_token_216744_37975"
  end

  create_table "lime_survey_217615", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "217615X96X1515", limit: 255
    t.string "217615X96X1501SQ001", limit: 5
    t.string "217615X96X1502", limit: 5
    t.string "217615X96X1503", limit: 1
    t.string "217615X96X1504", limit: 5
    t.text "217615X96X1504other"
    t.string "217615X96X1505", limit: 1
    t.string "217615X96X1506", limit: 5
    t.text "217615X96X1506other"
    t.string "217615X96X1507", limit: 1
    t.string "217615X96X1508", limit: 5
    t.text "217615X96X1508other"
    t.string "217615X96X15091", limit: 5
    t.string "217615X96X15092", limit: 5
    t.string "217615X96X15093", limit: 5
    t.string "217615X96X15094", limit: 5
    t.string "217615X96X15095", limit: 5
    t.string "217615X96X15096", limit: 5
    t.string "217615X96X15097", limit: 5
    t.string "217615X96X15098", limit: 5
    t.text "217615X96X1509other"
    t.string "217615X96X1510HowHelpful", limit: 5
    t.string "217615X96X1511VidUnderstanding", limit: 5
    t.string "217615X96X1511ClearContent", limit: 5
    t.string "217615X96X1511ReleventContent", limit: 5
    t.string "217615X96X1511AccurateContent", limit: 5
    t.string "217615X96X1511VidRightLen", limit: 5
    t.string "217615X96X1511DidnotFindVidHelpful", limit: 5
    t.string "217615X96X1512AlreadyUnderstood", limit: 5
    t.string "217615X96X1512NotClearContent", limit: 5
    t.string "217615X96X1512NotReleventContent", limit: 5
    t.string "217615X96X1512NotCorrectContent", limit: 5
    t.string "217615X96X1512VidTooLong", limit: 5
    t.string "217615X96X1512AllVidHelpful", limit: 5
    t.text "217615X96X1513"
    t.text "217615X97X1514StudentYear"
    t.text "217615X97X1514StudentEmail"
    t.text "217615X97X1514StudentName"
    t.text "217615X97X1514CoachEmail"
    t.text "217615X97X1514CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_217615_8121"
  end

  create_table "lime_survey_217615_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "217615X96time"
    t.float "217615X96X1515time"
    t.float "217615X96X1501time"
    t.float "217615X96X1502time"
    t.float "217615X96X1503time"
    t.float "217615X96X1504time"
    t.float "217615X96X1505time"
    t.float "217615X96X1506time"
    t.float "217615X96X1507time"
    t.float "217615X96X1508time"
    t.float "217615X96X1509time"
    t.float "217615X96X1510time"
    t.float "217615X96X1511time"
    t.float "217615X96X1512time"
    t.float "217615X96X1513time"
    t.float "217615X97time"
    t.float "217615X97X1514time"
  end

  create_table "lime_survey_218865", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "218865X641X7876RecognizePersFeeling", limit: 5
    t.string "218865X641X7876AwareOfEmotions", limit: 5
    t.string "218865X641X7876InvestigateBehavior", limit: 5
    t.string "218865X641X7876ContradictoryFeeling", limit: 5
    t.string "218865X641X7876ThinkingHabits", limit: 5
    t.string "218865X641X7876TrustingRelationship", limit: 5
    t.string "218865X641X7876SafeLearning", limit: 5
    t.string "218865X641X7876Commitment", limit: 5
    t.string "218865X641X7876Affirm", limit: 5
    t.string "218865X641X7876AcceptFeedback", limit: 5
    t.string "218865X641X7876Stimulates", limit: 5
    t.string "218865X641X7876Encourage", limit: 5
    t.string "218865X641X7876EncourageProfDev", limit: 5
    t.string "218865X641X7876ConstructiveFeedback", limit: 5
    t.string "218865X657X8022", limit: 1
    t.string "218865X657X8023", limit: 5
    t.text "218865X657X8024"
    t.string "218865X657X8025", limit: 5
    t.string "218865X657X8026", limit: 5
    t.string "218865X657X8027", limit: 5
    t.string "218865X657X8028", limit: 5
    t.text "218865X657X8028other"
    t.string "218865X657X8029", limit: 5
    t.text "218865X657X8029other"
    t.string "218865X657X8030", limit: 5
    t.text "218865X657X8031"
    t.string "218865X657X8032Q1", limit: 5
    t.text "218865X657X8033"
    t.string "218865X657X8034Q1", limit: 5
    t.text "218865X640X7875"
    t.text "218865X640X7878"
    t.text "218865X640X7877"
    t.text "218865X640X7879"
    t.text "218865X640X7880"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_218865_17913"
  end

  create_table "lime_survey_218935", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "218935X813X9329"
    t.string "218935X811X9331", limit: 5
    t.text "218935X811X9331other"
    t.string "218935X811X9332", limit: 5
    t.text "218935X811X9332other"
    t.text "218935X811X9323"
    t.text "218935X811X9322"
    t.text "218935X811X9324"
    t.string "218935X811X9325", limit: 1
    t.text "218935X811X9326"
    t.text "218935X811X9333"
    t.text "218935X811X9327"
    t.string "218935X812X9328SQ001", limit: 5
    t.string "218935X812X9328SQ002", limit: 5
    t.string "218935X812X9328SQ003", limit: 5
    t.string "218935X812X9328SQ004", limit: 5
    t.string "218935X812X9328SQ005", limit: 5
    t.string "218935X812X9328SQ006", limit: 5
    t.string "218935X812X9328SQ007", limit: 5
    t.string "218935X812X9328SQ008", limit: 5
    t.string "218935X812X9328SQ009", limit: 5
    t.string "218935X812X9328SQ010", limit: 5
    t.string "218935X812X9328SQ011", limit: 5
    t.text "218935X814X9330StudentYear"
    t.text "218935X814X9330StudentEmail"
    t.text "218935X814X9330StudentName"
    t.text "218935X814X9330CoachEmail"
    t.text "218935X814X9330CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_218935_28384"
  end

  create_table "lime_survey_218935_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "218935X813time"
    t.float "218935X813X9329time"
    t.float "218935X811time"
    t.float "218935X811X9331time"
    t.float "218935X811X9332time"
    t.float "218935X811X9323time"
    t.float "218935X811X9322time"
    t.float "218935X811X9324time"
    t.float "218935X811X9325time"
    t.float "218935X811X9326time"
    t.float "218935X811X9333time"
    t.float "218935X811X9327time"
    t.float "218935X812time"
    t.float "218935X812X9328time"
    t.float "218935X814time"
    t.float "218935X814X9330time"
  end

  create_table "lime_survey_219315", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "219315X602X7365"
    t.text "219315X602X7366"
    t.text "219315X602X7372"
    t.text "219315X602X7373"
    t.text "219315X602X7374"
    t.text "219315X602X7375"
    t.string "219315X603X7367Clarify", limit: 5
    t.string "219315X603X7367Represents", limit: 5
    t.string "219315X603X7367Responsible", limit: 5
    t.string "219315X603X7367Inspire", limit: 5
    t.string "219315X603X7367Determine", limit: 5
    t.string "219315X603X7367Active", limit: 5
    t.string "219315X603X7367Honest", limit: 5
    t.string "219315X604X7368SeekAndHear", limit: 5
    t.string "219315X604X7368LearnAbout", limit: 5
    t.string "219315X604X7368AcceptAny", limit: 5
    t.string "219315X604X7368DevelopAShared", limit: 5
    t.string "219315X604X7368SpecificMeasurable", limit: 5
    t.string "219315X604X7368WorkWithYourCoach", limit: 5
    t.string "219315X604X7368DetermineTimelines", limit: 5
    t.string "219315X604X7368MonitorYourProgress", limit: 5
    t.string "219315X604X7368IdentifyProblems", limit: 5
    t.string "219315X604X7368SolveProblems", limit: 5
    t.string "219315X604X7368Characterize", limit: 5
    t.string "219315X605X7369RecognizePersFeeling", limit: 5
    t.string "219315X605X7369AwareOfEmotions", limit: 5
    t.string "219315X605X7369InvestigateBehavior", limit: 5
    t.string "219315X605X7369PayAttention", limit: 5
    t.string "219315X605X7369MyThinkingHabits", limit: 5
    t.string "219315X605X7369TrustingRelationship", limit: 5
    t.string "219315X605X7369SafeLearningEnv", limit: 5
    t.string "219315X605X7369Commitment", limit: 5
    t.string "219315X605X7369Affirms", limit: 5
    t.string "219315X605X7369WillingToAcceptFeedb", limit: 5
    t.string "219315X605X7369esLearningPrStimulat", limit: 5
    t.string "219315X605X7369Encourages", limit: 5
    t.string "219315X605X7369StimulatesProfDevelo", limit: 5
    t.string "219315X605X7369StimulatesConstFeedb", limit: 5
    t.text "219315X606X7370"
    t.text "219315X606X7371"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_219315_101"
  end

  create_table "lime_survey_219315_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "219315X602time"
    t.float "219315X602X7365time"
    t.float "219315X602X7366time"
    t.float "219315X602X7372time"
    t.float "219315X602X7373time"
    t.float "219315X602X7374time"
    t.float "219315X602X7375time"
    t.float "219315X603time"
    t.float "219315X603X7367time"
    t.float "219315X604time"
    t.float "219315X604X7368time"
    t.float "219315X605time"
    t.float "219315X605X7369time"
    t.float "219315X606time"
    t.float "219315X606X7370time"
    t.float "219315X606X7371time"
  end

  create_table "lime_survey_221971", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "ipaddr"
    t.text "refurl"
    t.text "221971X874X9828"
    t.text "221971X874X9829"
    t.text "221971X874X9831"
    t.text "221971X874X9830"
    t.string "221971X872X9824", limit: 5
    t.string "221971X872X9826", limit: 5
    t.string "221971X873X9825", limit: 5
    t.string "221971X873X9827", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_221971_2796"
  end

  create_table "lime_survey_221971_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "221971X874time"
    t.float "221971X874X9828time"
    t.float "221971X874X9829time"
    t.float "221971X874X9831time"
    t.float "221971X874X9830time"
    t.float "221971X872time"
    t.float "221971X872X9824time"
    t.float "221971X872X9826time"
    t.float "221971X873time"
    t.float "221971X873X9825time"
    t.float "221971X873X9827time"
  end

  create_table "lime_survey_222865", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "222865X1376X14662", limit: 5
    t.string "222865X1376X14663", limit: 5
    t.text "222865X1376X14665"
    t.text "222865X1377X14668"
    t.text "222865X1377X14669"
    t.text "222865X1377X14670"
    t.text "222865X1377X14673"
    t.text "222865X1377X14675"
    t.text "222865X1377X14676"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_222865_24617"
  end

  create_table "lime_survey_223338", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "223338X516X5997StudentYear"
    t.text "223338X516X5997StudentEmail"
    t.text "223338X516X5997StudentName"
    t.text "223338X516X5997CoachEmail"
    t.text "223338X516X5997CoachName"
    t.text "223338X517X5998CourseYear"
    t.text "223338X517X5998CourseName"
    t.decimal "223338X517X5999Week1MCQ", precision: 30, scale: 10
    t.decimal "223338X517X5999Week2MCQ", precision: 30, scale: 10
    t.decimal "223338X517X5999Week3MCQ", precision: 30, scale: 10
    t.decimal "223338X517X5999Week4MCQ", precision: 30, scale: 10
    t.decimal "223338X517X5999Week5MCQ", precision: 30, scale: 10
    t.decimal "223338X517X5999Week6MCQ", precision: 30, scale: 10
    t.decimal "223338X517X5999Week7MCQ", precision: 30, scale: 10
    t.decimal "223338X517X5999Week8MCQ", precision: 30, scale: 10
    t.text "223338X517X6000DroppedQuiz"
    t.text "223338X517X6000DroppedScore"
    t.decimal "223338X517X6819EHR", precision: 30, scale: 10
    t.decimal "223338X517X6819CSA1", precision: 30, scale: 10
    t.decimal "223338X517X6819CSA2", precision: 30, scale: 10
    t.decimal "223338X517X6819CSA3", precision: 30, scale: 10
    t.decimal "223338X517X6819CSA4", precision: 30, scale: 10
    t.decimal "223338X517X6819CSA5", precision: 30, scale: 10
    t.decimal "223338X517X6819CSA6", precision: 30, scale: 10
    t.decimal "223338X517X6819CSA7", precision: 30, scale: 10
    t.decimal "223338X517X6819CSA8", precision: 30, scale: 10
    t.decimal "223338X517X6819CSA9", precision: 30, scale: 10
    t.decimal "223338X517X6002FinalBlock", precision: 30, scale: 10
    t.decimal "223338X517X6003", precision: 30, scale: 10
    t.decimal "223338X517X6004OSCE", precision: 30, scale: 10
    t.decimal "223338X517X6004Anatomy", precision: 30, scale: 10
    t.decimal "223338X517X6004Histology", precision: 30, scale: 10
    t.decimal "223338X517X6004Genetics", precision: 30, scale: 10
    t.decimal "223338X517X6004CellBio", precision: 30, scale: 10
    t.decimal "223338X517X6004Informatics", precision: 30, scale: 10
    t.decimal "223338X517X6004Micro", precision: 30, scale: 10
    t.decimal "223338X517X6005Component1", precision: 30, scale: 10
    t.decimal "223338X517X6005Component2", precision: 30, scale: 10
    t.decimal "223338X517X6005Component3", precision: 30, scale: 10
    t.decimal "223338X517X6005Component4", precision: 30, scale: 10
    t.decimal "223338X517X6005Component5", precision: 30, scale: 10
    t.text "223338X517X6006"
    t.integer "223338X517X6006_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_223338_30651"
  end

  create_table "lime_survey_224436", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "224436X64X1056", limit: 255
    t.string "224436X64X1067", limit: 255
    t.string "224436X64X1068", limit: 255
    t.string "224436X64X1069", limit: 255
    t.string "224436X64X1070", limit: 255
    t.string "224436X64X1057", limit: 5
    t.string "224436X64X1058", limit: 5
    t.string "224436X64X1059", limit: 255
    t.decimal "224436X64X1060", precision: 30, scale: 10
    t.string "224436X64X1061", limit: 5
    t.decimal "224436X64X1062", precision: 30, scale: 10
    t.decimal "224436X64X1063", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_224436_4515"
  end

  create_table "lime_survey_225663", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.decimal "225663X735X8829", precision: 30, scale: 10
    t.text "225663X735X8838"
    t.string "225663X735X8847", limit: 5
    t.text "225663X735X8847other"
    t.string "225663X735X8851SQ001", limit: 5
    t.string "225663X735X8851SQ002", limit: 5
    t.string "225663X735X8851SQ003", limit: 5
    t.string "225663X735X8851SQ004", limit: 5
    t.string "225663X735X8851SQ005", limit: 5
    t.text "225663X735X8851other"
    t.string "225663X748X8902SQ001", limit: 5
    t.string "225663X748X8902SQ002", limit: 5
    t.string "225663X748X8902SQ003", limit: 5
    t.string "225663X752X8925SQ001", limit: 5
    t.string "225663X752X8925SQ002", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_225663_27294"
  end

  create_table "lime_survey_226417", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "226417X93X1451InstructorKnowledge", limit: 5
    t.string "226417X93X1451InstructorWellPrep", limit: 5
    t.string "226417X93X1451InstructorRate", limit: 5
    t.text "226417X93X1452"
    t.text "226417X93X1453"
    t.text "226417X93X1454"
    t.string "226417X93X1455", limit: 255
    t.string "226417X93X1456", limit: 255
    t.string "226417X93X1457", limit: 255
    t.string "226417X93X1458ClickerQ", limit: 5
    t.string "226417X93X1458Brief", limit: 5
    t.string "226417X93X1458Pair", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_226417_26428"
  end

  create_table "lime_survey_226843", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "226843X1453X15703SQ001"
    t.text "226843X1453X15703SQ002"
    t.text "226843X1453X15703SQ004"
    t.text "226843X1453X15703SQ005"
    t.string "226843X1454X15704", limit: 5
    t.string "226843X1454X15729", limit: 5
    t.string "226843X1454X15706", limit: 5
    t.string "226843X1454X15731", limit: 5
    t.string "226843X1455X15710SQ001", limit: 5
    t.string "226843X1455X15710SQ002", limit: 5
    t.string "226843X1455X15710SQ003", limit: 5
    t.string "226843X1455X15710SQ004", limit: 5
    t.string "226843X1455X15710SQ005", limit: 5
    t.string "226843X1455X15710SQ006", limit: 5
    t.string "226843X1455X15710SQ007", limit: 5
    t.string "226843X1455X15710SQ008", limit: 5
    t.string "226843X1455X15710SQ009", limit: 5
    t.text "226843X1455X15711"
    t.text "226843X1456X15713"
    t.text "226843X1456X15712"
    t.string "226843X1457X15714", limit: 5
    t.index ["token"], name: "idx_survey_token_226843_13704"
  end

  create_table "lime_survey_229785", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "229785X583X7168StudentYear"
    t.text "229785X583X7168StudentID"
    t.text "229785X583X7168StudentEmail"
    t.text "229785X583X7168StudentName"
    t.text "229785X583X7168CoachEmail"
    t.text "229785X583X7168CoachName"
    t.text "229785X584X7169Name"
    t.text "229785X584X7169StartDt"
    t.text "229785X584X7169EndDt"
    t.text "229785X584X7169SubmitDt"
    t.text "229785X584X7169Eval"
    t.text "229785X582X7167IntMedComp1"
    t.text "229785X582X7167IntMedComp2"
    t.text "229785X582X7167IntMedComp3"
    t.text "229785X582X7167IntMedComp4"
    t.text "229785X582X7167IntMedFinal"
    t.text "229785X586X7175ProfConcerns"
    t.text "229785X586X7175CommProfConcerns"
    t.text "229785X586X7175OverSummCommPerf"
    t.text "229785X586X7175AddCommOnPerform"
    t.text "229785X586X7175MSPE"
    t.text "229785X586X7175OptClinicExpComm"
    t.text "229785X586X7175Feedback"
    t.text "229785X585X7170Level0"
    t.text "229785X585X7170Level1"
    t.text "229785X585X7170Level2"
    t.text "229785X585X7170Level3"
    t.text "229785X585X7170Total"
    t.text "229785X585X7171ICS1"
    t.text "229785X585X7171MK2"
    t.text "229785X585X7171PBLI1"
    t.text "229785X585X7171PCP1"
    t.text "229785X585X7171PCP2"
    t.text "229785X585X7171PCP3"
    t.text "229785X585X7171PPPD1"
    t.text "229785X585X7171PPPD9"
    t.text "229785X585X7172ICS1"
    t.text "229785X585X7172MK2"
    t.text "229785X585X7172PBLI1"
    t.text "229785X585X7172PCP1"
    t.text "229785X585X7172PCP2"
    t.text "229785X585X7172PCP3"
    t.text "229785X585X7172PPPD1"
    t.text "229785X585X7172PPPD9"
    t.text "229785X585X7173ICS1"
    t.text "229785X585X7173MK2"
    t.text "229785X585X7173PBLI1"
    t.text "229785X585X7173PCP1"
    t.text "229785X585X7173PCP2"
    t.text "229785X585X7173PCP3"
    t.text "229785X585X7173PPPD1"
    t.text "229785X585X7173PPPD9"
    t.text "229785X585X7174ICS1"
    t.text "229785X585X7174MK2"
    t.text "229785X585X7174PBLI1"
    t.text "229785X585X7174PCP1"
    t.text "229785X585X7174PCP2"
    t.text "229785X585X7174PCP3"
    t.text "229785X585X7174PPPD1"
    t.text "229785X585X7174PPPD9"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_229785_41816"
  end

  create_table "lime_survey_231599", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "231599X1336X14404"
    t.text "231599X1336X14407"
    t.text "231599X1336X14995StudentYear"
    t.text "231599X1336X14995StudentEmail"
    t.text "231599X1336X14995StudentName"
    t.text "231599X1336X14995CoachEmail"
    t.text "231599X1336X14995CoachName"
    t.string "231599X1339X14408", limit: 5
    t.text "231599X1339X14409"
    t.string "231599X1337X14405C1", limit: 5
    t.string "231599X1337X14405C2", limit: 5
    t.string "231599X1337X14405C3", limit: 5
    t.string "231599X1337X14405C4", limit: 5
    t.string "231599X1337X14405C5", limit: 5
    t.string "231599X1337X14405C6", limit: 5
    t.string "231599X1337X14405C7", limit: 5
    t.string "231599X1337X14405C8", limit: 5
    t.string "231599X1337X14405C9", limit: 5
    t.text "231599X1338X14406"
    t.index ["token"], name: "idx_survey_token_231599_19088"
  end

  create_table "lime_survey_231881", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "231881X94X1477", limit: 255
    t.string "231881X94X1465SQ001", limit: 5
    t.string "231881X94X1466SQ001", limit: 5
    t.string "231881X94X1467", limit: 5
    t.text "231881X94X1467other"
    t.string "231881X94X1468", limit: 1
    t.string "231881X94X1469", limit: 5
    t.text "231881X94X1469other"
    t.string "231881X94X1470SQ001", limit: 5
    t.string "231881X94X1470SQ002", limit: 5
    t.string "231881X94X1470SQ003", limit: 5
    t.string "231881X94X1470SQ004", limit: 5
    t.string "231881X94X1470SQ005", limit: 5
    t.string "231881X94X1470SQ006", limit: 5
    t.string "231881X94X1470SQ007", limit: 5
    t.string "231881X94X1470SQ008", limit: 5
    t.string "231881X94X1470SQ009", limit: 5
    t.string "231881X94X1471SQ001", limit: 5
    t.string "231881X94X1472SQ001", limit: 5
    t.string "231881X94X1472SQ002", limit: 5
    t.string "231881X94X1472SQ003", limit: 5
    t.string "231881X94X1472SQ004", limit: 5
    t.string "231881X94X1472SQ005", limit: 5
    t.string "231881X94X1472SQ006", limit: 5
    t.string "231881X94X1473", limit: 5
    t.string "231881X94X1474", limit: 5
    t.text "231881X94X1474other"
    t.text "231881X94X1475"
    t.text "231881X95X1476StudentYear"
    t.text "231881X95X1476StudentEmail"
    t.text "231881X95X1476StudentName"
    t.text "231881X95X1476CoachEmail"
    t.text "231881X95X1476CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_231881_2029"
  end

  create_table "lime_survey_231881_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "231881X94time"
    t.float "231881X94X1477time"
    t.float "231881X94X1465time"
    t.float "231881X94X1466time"
    t.float "231881X94X1467time"
    t.float "231881X94X1468time"
    t.float "231881X94X1469time"
    t.float "231881X94X1470time"
    t.float "231881X94X1471time"
    t.float "231881X94X1472time"
    t.float "231881X94X1473time"
    t.float "231881X94X1474time"
    t.float "231881X94X1475time"
    t.float "231881X95time"
    t.float "231881X95X1476time"
  end

  create_table "lime_survey_233128", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "233128X1177X14149SQ001", limit: 5
    t.string "233128X1177X13465SQ001", limit: 5
    t.string "233128X1177X13465SQ003", limit: 5
    t.string "233128X1177X13465SQ002", limit: 5
    t.string "233128X1178X13466SQ001", limit: 5
    t.string "233128X1178X13466SQ002", limit: 5
    t.string "233128X1178X13466SQ003", limit: 5
    t.string "233128X1178X13466SQ004", limit: 5
    t.string "233128X1178X13466SQ005", limit: 5
    t.string "233128X1178X13466SQ006", limit: 5
    t.string "233128X1178X13466SQ007", limit: 5
    t.string "233128X1179X13467SQ001", limit: 5
    t.text "233128X1180X13468"
    t.text "233128X1180X13469"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_233128_30166"
  end

  create_table "lime_survey_233677", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "233677X1447X15564StudentYear"
    t.text "233677X1447X15564StudentEmail"
    t.text "233677X1447X15564StudentName"
    t.text "233677X1447X15564CoachEmail"
    t.text "233677X1447X15564CoachName"
    t.decimal "233677X1448X15566Week1MCQ", precision: 30, scale: 10
    t.decimal "233677X1448X15566Week2MCQ", precision: 30, scale: 10
    t.decimal "233677X1448X15566Week3MCQ", precision: 30, scale: 10
    t.decimal "233677X1448X15566Week4MCQ", precision: 30, scale: 10
    t.decimal "233677X1448X15566Week5MCQ", precision: 30, scale: 10
    t.decimal "233677X1448X15566Week6MCQ", precision: 30, scale: 10
    t.decimal "233677X1448X15566Week7MCQ", precision: 30, scale: 10
    t.decimal "233677X1448X15566Week8MCQ", precision: 30, scale: 10
    t.decimal "233677X1448X15566Week9MCQ", precision: 30, scale: 10
    t.decimal "233677X1448X15566Week10MCQ1", precision: 30, scale: 10
    t.decimal "233677X1448X15566Week11MCQ2", precision: 30, scale: 10
    t.decimal "233677X1448X15566MCQAve", precision: 30, scale: 10
    t.text "233677X1448X15567DroppedQuiz"
    t.text "233677X1448X15567DroppedScore"
    t.decimal "233677X1448X15568CSA1", precision: 30, scale: 10
    t.decimal "233677X1448X15568CSA2", precision: 30, scale: 10
    t.decimal "233677X1448X15568HSS1Infor", precision: 30, scale: 10
    t.decimal "233677X1448X15568CSA3", precision: 30, scale: 10
    t.decimal "233677X1448X15568CSA4", precision: 30, scale: 10
    t.decimal "233677X1448X15568HSS2EPI", precision: 30, scale: 10
    t.decimal "233677X1448X15568HSS3EHR", precision: 30, scale: 10
    t.decimal "233677X1448X15568HSSAve", precision: 30, scale: 10
    t.decimal "233677X1448X15574BSS1AnatPB", precision: 30, scale: 10
    t.decimal "233677X1448X15574BSS2AnatPL1", precision: 30, scale: 10
    t.decimal "233677X1448X15574BSS3AnatLab1", precision: 30, scale: 10
    t.decimal "233677X1448X15574BBSS4Histo1", precision: 30, scale: 10
    t.decimal "233677X1448X15574BSS5Histo2", precision: 30, scale: 10
    t.decimal "233677X1448X15574BSS6Path", precision: 30, scale: 10
    t.decimal "233677X1448X15574BSS7AnatPL2", precision: 30, scale: 10
    t.decimal "233677X1448X15574BSS8AnatLab2", precision: 30, scale: 10
    t.decimal "233677X1448X15574BSS9Histo3", precision: 30, scale: 10
    t.decimal "233677X1448X15574BSSAvg", precision: 30, scale: 10
    t.decimal "233677X1448X15569FinalCPRCardio", precision: 30, scale: 10
    t.decimal "233677X1448X15569FinalCPRRenal", precision: 30, scale: 10
    t.decimal "233677X1448X15569FinalCPRPulm", precision: 30, scale: 10
    t.decimal "233677X1448X15570NBME", precision: 30, scale: 10
    t.decimal "233677X1448X15571HSSOSCE", precision: 30, scale: 10
    t.decimal "233677X1448X15571HSSAvg", precision: 30, scale: 10
    t.decimal "233677X1448X15575BSSAnat", precision: 30, scale: 10
    t.decimal "233677X1448X15575BSSCellBChem", precision: 30, scale: 10
    t.decimal "233677X1448X15575BSSPath", precision: 30, scale: 10
    t.decimal "233677X1448X15575BSSMicro", precision: 30, scale: 10
    t.decimal "233677X1448X15575BSSAvg", precision: 30, scale: 10
    t.decimal "233677X1448X15572Component1", precision: 30, scale: 10
    t.decimal "233677X1448X15572Component2A", precision: 30, scale: 10
    t.decimal "233677X1448X15572Component2B", precision: 30, scale: 10
    t.decimal "233677X1448X15572Component3", precision: 30, scale: 10
    t.decimal "233677X1448X15572Component4", precision: 30, scale: 10
    t.decimal "233677X1448X15572Component5A", precision: 30, scale: 10
    t.decimal "233677X1448X15572Component5B", precision: 30, scale: 10
    t.text "233677X1448X15573"
    t.integer "233677X1448X15573_filecount"
    t.index ["token"], name: "idx_survey_token_233677_5849"
  end

  create_table "lime_survey_234282", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "234282X112X1833SQ001", limit: 5
    t.string "234282X112X1833SQ002", limit: 5
    t.string "234282X112X1833SQ003", limit: 5
    t.string "234282X112X1833SQ004", limit: 5
    t.text "234282X112X1838"
    t.text "234282X112X1839"
    t.text "234282X112X1840"
    t.string "234282X113X1841SQ001", limit: 5
    t.string "234282X113X1841SQ002", limit: 5
    t.string "234282X113X1841SQ003", limit: 5
    t.string "234282X113X1841SQ004", limit: 5
    t.string "234282X113X1841SQ005", limit: 5
    t.string "234282X113X1841SQ006", limit: 5
    t.text "234282X113X1848"
    t.text "234282X113X1849"
    t.text "234282X113X1850"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_234282_24913"
  end

  create_table "lime_survey_237826", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "237826X54X736StudentEmail"
    t.text "237826X54X736StudentName"
    t.text "237826X54X736CoachEmail"
    t.text "237826X54X736CoachName"
    t.text "237826X53X743CourseYear"
    t.text "237826X53X743CourseName"
    t.decimal "237826X53X730Week1MCQ", precision: 30, scale: 10
    t.decimal "237826X53X730Week2MCQ", precision: 30, scale: 10
    t.decimal "237826X53X730Week3MCQ", precision: 30, scale: 10
    t.decimal "237826X53X730Week4MCQ", precision: 30, scale: 10
    t.decimal "237826X53X730Week5MCQ", precision: 30, scale: 10
    t.decimal "237826X53X730Week6MCQ", precision: 30, scale: 10
    t.decimal "237826X53X730Week7MCQ", precision: 30, scale: 10
    t.text "237826X53X735DroppedQuiz"
    t.text "237826X53X735DroppedScore"
    t.decimal "237826X53X731Week2", precision: 30, scale: 10
    t.decimal "237826X53X731Week4", precision: 30, scale: 10
    t.decimal "237826X53X731Week6", precision: 30, scale: 10
    t.decimal "237826X53X732", precision: 30, scale: 10
    t.decimal "237826X53X733", precision: 30, scale: 10
    t.decimal "237826X53X734OSCE1", precision: 30, scale: 10
    t.decimal "237826X53X734OSCE2", precision: 30, scale: 10
    t.decimal "237826X53X734HistologySkills", precision: 30, scale: 10
    t.decimal "237826X53X734GeneticsPedigree", precision: 30, scale: 10
    t.decimal "237826X53X745Component1", precision: 30, scale: 10
    t.decimal "237826X53X745Component2", precision: 30, scale: 10
    t.decimal "237826X53X745Component3", precision: 30, scale: 10
    t.decimal "237826X53X745Component4", precision: 30, scale: 10
    t.decimal "237826X53X745Component5", precision: 30, scale: 10
    t.text "237826X53X755ComponentFailed"
    t.text "237826X53X755AreasOfDeficiency"
    t.text "237826X53X755RetestResults"
    t.text "237826X53X755RetestResultPNP"
    t.text "237826X53X755NoOfPrevcompFails"
    t.text "237826X53X755NoOfFailuresToDate"
    t.text "237826X53X755LetterSent"
    t.text "237826X53X755MSPBDiscussed"
    t.text "237826X53X756ComponentFailed"
    t.text "237826X53X756AreasOfDeficiency"
    t.text "237826X53X756RetestResults"
    t.text "237826X53X756RetestResultPNP"
    t.text "237826X53X756NoOfPrevcompFails"
    t.text "237826X53X756NoOfFailuresToDate"
    t.text "237826X53X756LetterSent"
    t.text "237826X53X756MSPBDiscussed"
    t.text "237826X55X744CourseYear"
    t.text "237826X55X744CourseName"
    t.decimal "237826X55X737Week1MCQ", precision: 30, scale: 10
    t.decimal "237826X55X737Week2MCQ", precision: 30, scale: 10
    t.decimal "237826X55X737Week3MCQ", precision: 30, scale: 10
    t.decimal "237826X55X737Week4MCQ", precision: 30, scale: 10
    t.decimal "237826X55X737Week5MCQ", precision: 30, scale: 10
    t.text "237826X55X738DroppedQuiz"
    t.text "237826X55X738DroppedScore"
    t.decimal "237826X55X739Week2", precision: 30, scale: 10
    t.decimal "237826X55X739Week3", precision: 30, scale: 10
    t.decimal "237826X55X740", precision: 30, scale: 10
    t.decimal "237826X55X741", precision: 30, scale: 10
    t.decimal "237826X55X742HistologySkills", precision: 30, scale: 10
    t.decimal "237826X55X742Microbiology", precision: 30, scale: 10
    t.decimal "237826X55X742OSCE", precision: 30, scale: 10
    t.decimal "237826X55X742Pathlogy", precision: 30, scale: 10
    t.decimal "237826X55X746Component1", precision: 30, scale: 10
    t.decimal "237826X55X746Component2", precision: 30, scale: 10
    t.decimal "237826X55X746Component3", precision: 30, scale: 10
    t.decimal "237826X55X746Component4", precision: 30, scale: 10
    t.decimal "237826X55X746Component5", precision: 30, scale: 10
    t.text "237826X55X757ComponentFailed"
    t.text "237826X55X757AreasOfDeficiency"
    t.text "237826X55X757RetestResults"
    t.text "237826X55X757RetestResultPNP"
    t.text "237826X55X757NoOfPrevcompFails"
    t.text "237826X55X757NoOfFailuresToDate"
    t.text "237826X55X757LetterSent"
    t.text "237826X55X757MSPBDiscussed"
    t.text "237826X55X758ComponentFailed"
    t.text "237826X55X758AreasOfDeficiency"
    t.text "237826X55X758RetestResults"
    t.text "237826X55X758RetestResultPNP"
    t.text "237826X55X758NoOfPrevcompFails"
    t.text "237826X55X758NoOfFailuresToDate"
    t.text "237826X55X758LetterSent"
    t.text "237826X55X758MSPBDiscussed"
    t.text "237826X56X747CourseYear"
    t.text "237826X56X747CourseName"
    t.decimal "237826X56X748Week1MCQ", precision: 30, scale: 10
    t.decimal "237826X56X748Week2MCQ", precision: 30, scale: 10
    t.decimal "237826X56X748Week3MCQ", precision: 30, scale: 10
    t.decimal "237826X56X748Week4MCQ", precision: 30, scale: 10
    t.decimal "237826X56X748Week5MCQ", precision: 30, scale: 10
    t.text "237826X56X749DroppedQuiz"
    t.text "237826X56X749DroppedScore"
    t.decimal "237826X56X750Anatomy", precision: 30, scale: 10
    t.decimal "237826X56X750DermatologyImages", precision: 30, scale: 10
    t.decimal "237826X56X750Informatics", precision: 30, scale: 10
    t.decimal "237826X56X750Week3CSAArithritis", precision: 30, scale: 10
    t.decimal "237826X56X751", precision: 30, scale: 10
    t.decimal "237826X56X752", precision: 30, scale: 10
    t.decimal "237826X56X753AnatomyFinal", precision: 30, scale: 10
    t.decimal "237826X56X753Histology", precision: 30, scale: 10
    t.decimal "237826X56X753ProblemRep", precision: 30, scale: 10
    t.decimal "237826X56X753VisualImages", precision: 30, scale: 10
    t.decimal "237826X56X754Component1", precision: 30, scale: 10
    t.decimal "237826X56X754Component2", precision: 30, scale: 10
    t.decimal "237826X56X754Component3", precision: 30, scale: 10
    t.decimal "237826X56X754Component4", precision: 30, scale: 10
    t.decimal "237826X56X754Component5", precision: 30, scale: 10
    t.text "237826X56X759ComponentFailed"
    t.text "237826X56X759AreasOfDeficiency"
    t.text "237826X56X759RetestResults"
    t.text "237826X56X759RetestResultPNP"
    t.text "237826X56X759NoOfPrevcompFails"
    t.text "237826X56X759NoOfFailuresToDate"
    t.text "237826X56X759LetterSent"
    t.text "237826X56X759MSPBDiscussed"
    t.text "237826X56X760ComponentFailed"
    t.text "237826X56X760AreasOfDeficiency"
    t.text "237826X56X760RetestResults"
    t.text "237826X56X760RetestResultPNP"
    t.text "237826X56X760NoOfPrevcompFails"
    t.text "237826X56X760NoOfFailuresToDate"
    t.text "237826X56X760LetterSent"
    t.text "237826X56X760MSPBDiscussed"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_237826_18182"
  end

  create_table "lime_survey_244784", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "244784X73X1253InstructorKnowledge", limit: 5
    t.string "244784X73X1253InstructorWellPrep", limit: 5
    t.string "244784X73X1253InstructorRate", limit: 5
    t.text "244784X73X1254"
    t.text "244784X73X1255"
    t.text "244784X73X1259"
    t.string "244784X73X1256", limit: 255
    t.string "244784X73X1257", limit: 255
    t.string "244784X73X1258", limit: 255
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_244784_41537"
  end

  create_table "lime_survey_251129", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "251129X1225X13679SQ001", limit: 5
    t.string "251129X1225X13679SQ004", limit: 5
    t.string "251129X1225X13679SQ003", limit: 5
    t.string "251129X1225X13679SQ002", limit: 5
    t.text "251129X1225X13684"
    t.string "251129X1226X13680SQ001", limit: 5
    t.string "251129X1226X13680SQ002", limit: 5
    t.string "251129X1226X13680SQ003", limit: 5
    t.string "251129X1226X13680SQ004", limit: 5
    t.text "251129X1226X13685"
    t.string "251129X1227X13681SQ001", limit: 5
    t.string "251129X1227X13681SQ002", limit: 5
    t.text "251129X1227X13686"
    t.string "251129X1227X14126SQ001", limit: 5
    t.text "251129X1228X13682"
    t.text "251129X1228X13683"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_251129_9904"
  end

  create_table "lime_survey_255281", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "255281X177X2317StudentYear"
    t.text "255281X177X2317StudentEmail"
    t.text "255281X177X2317StudentName"
    t.text "255281X177X2317CoachEmail"
    t.text "255281X177X2317CoachName"
    t.text "255281X109X1732FirstName"
    t.text "255281X109X1732LastName"
    t.text "255281X109X1732Address1"
    t.text "255281X109X1732Address2"
    t.text "255281X109X1732City"
    t.text "255281X109X1732State"
    t.text "255281X109X1732ZipCode"
    t.text "255281X109X1732HomePhone"
    t.text "255281X109X1732MobilePhone"
    t.datetime "255281X109X1733", precision: nil
    t.string "255281X109X1734", limit: 5
    t.text "255281X109X1734other"
    t.string "255281X109X1735", limit: 5
    t.text "255281X109X1735other"
    t.string "255281X109X1736", limit: 5
    t.string "255281X109X17371", limit: 5
    t.string "255281X109X17372", limit: 5
    t.string "255281X109X17373", limit: 5
    t.string "255281X109X17374", limit: 5
    t.string "255281X109X17375", limit: 5
    t.text "255281X109X1737other"
    t.string "255281X109X1738", limit: 5
    t.string "255281X109X1752", limit: 1
    t.text "255281X109X1739Child1_Age1"
    t.text "255281X109X1739Child2_Age1"
    t.text "255281X109X1739Child3_Age1"
    t.text "255281X109X1739Child4_Age1"
    t.text "255281X109X1739Child5_Age1"
    t.text "255281X109X1740City"
    t.text "255281X109X1740State"
    t.text "255281X109X1740Country"
    t.text "255281X109X1741City"
    t.text "255281X109X1741State"
    t.text "255281X109X1741Country"
    t.text "255281X109X1753Hobby1"
    t.text "255281X109X1753Hobby2"
    t.text "255281X109X1753Hobby3"
    t.decimal "255281X110X1742", precision: 30, scale: 10
    t.text "255281X110X1743Row1_Institution"
    t.text "255281X110X1743Row1_DegreeAttained"
    t.text "255281X110X1743Row1_MajorAreaStudy"
    t.text "255281X110X1743Row1_MinorAreaStudy"
    t.text "255281X110X1743Row1_YrGrad"
    t.text "255281X110X1743Row1_ScienceCoursesHrs"
    t.text "255281X110X1743Row1_ScienceCoursesGPA"
    t.text "255281X110X1743Row1_OverallGPA"
    t.text "255281X110X1743Row2_Institution"
    t.text "255281X110X1743Row2_DegreeAttained"
    t.text "255281X110X1743Row2_MajorAreaStudy"
    t.text "255281X110X1743Row2_MinorAreaStudy"
    t.text "255281X110X1743Row2_YrGrad"
    t.text "255281X110X1743Row2_ScienceCoursesHrs"
    t.text "255281X110X1743Row2_ScienceCoursesGPA"
    t.text "255281X110X1743Row2_OverallGPA"
    t.text "255281X110X1743Row3_Institution"
    t.text "255281X110X1743Row3_DegreeAttained"
    t.text "255281X110X1743Row3_MajorAreaStudy"
    t.text "255281X110X1743Row3_MinorAreaStudy"
    t.text "255281X110X1743Row3_YrGrad"
    t.text "255281X110X1743Row3_ScienceCoursesHrs"
    t.text "255281X110X1743Row3_ScienceCoursesGPA"
    t.text "255281X110X1743Row3_OverallGPA"
    t.text "255281X110X1743Row4_Institution"
    t.text "255281X110X1743Row4_DegreeAttained"
    t.text "255281X110X1743Row4_MajorAreaStudy"
    t.text "255281X110X1743Row4_MinorAreaStudy"
    t.text "255281X110X1743Row4_YrGrad"
    t.text "255281X110X1743Row4_ScienceCoursesHrs"
    t.text "255281X110X1743Row4_ScienceCoursesGPA"
    t.text "255281X110X1743Row4_OverallGPA"
    t.string "255281X110X1754", limit: 255
    t.text "255281X110X1744Row1_YrMCAT"
    t.text "255281X110X1744Row1_PhsySciences"
    t.text "255281X110X1744Row1_VerbalReasoning"
    t.text "255281X110X1744Row1_BioSciences"
    t.text "255281X110X1744Row1_MCATTotScore"
    t.text "255281X110X1744Row2_YrMCAT"
    t.text "255281X110X1744Row2_PhsySciences"
    t.text "255281X110X1744Row2_VerbalReasoning"
    t.text "255281X110X1744Row2_BioSciences"
    t.text "255281X110X1744Row2_MCATTotScore"
    t.text "255281X110X1744Row3_YrMCAT"
    t.text "255281X110X1744Row3_PhsySciences"
    t.text "255281X110X1744Row3_VerbalReasoning"
    t.text "255281X110X1744Row3_BioSciences"
    t.text "255281X110X1744Row3_MCATTotScore"
    t.text "255281X110X1745Row1_YrMCAT"
    t.text "255281X110X1745Row1_ChemPhyBioSys"
    t.text "255281X110X1745Row1_CriticalAnalysis"
    t.text "255281X110X1745Row1_BioFoundOfLivingSys"
    t.text "255281X110X1745Row1_PsychSocBioFoundOfBe"
    t.text "255281X110X1745Row1_MCATTotScore"
    t.text "255281X110X1745Row2_YrMCAT"
    t.text "255281X110X1745Row2_ChemPhyBioSys"
    t.text "255281X110X1745Row2_CriticalAnalysis"
    t.text "255281X110X1745Row2_BioFoundOfLivingSys"
    t.text "255281X110X1745Row2_PsychSocBioFoundOfBe"
    t.text "255281X110X1745Row2_MCATTotScore"
    t.text "255281X110X1745Row3_YrMCAT"
    t.text "255281X110X1745Row3_ChemPhyBioSys"
    t.text "255281X110X1745Row3_CriticalAnalysis"
    t.text "255281X110X1745Row3_BioFoundOfLivingSys"
    t.text "255281X110X1745Row3_PsychSocBioFoundOfBe"
    t.text "255281X110X1745Row3_MCATTotScore"
    t.string "255281X110X1746", limit: 5
    t.text "255281X110X1747Row1_HealthcareSetting"
    t.text "255281X110X1747Row1_CountryServed"
    t.text "255281X110X1747Row1_Role"
    t.text "255281X110X1747Row1_InclusiveYrs"
    t.text "255281X110X1747Row2_HealthcareSetting"
    t.text "255281X110X1747Row2_CountryServed"
    t.text "255281X110X1747Row2_Role"
    t.text "255281X110X1747Row2_InclusiveYrs"
    t.text "255281X110X1747Row3_HealthcareSetting"
    t.text "255281X110X1747Row3_CountryServed"
    t.text "255281X110X1747Row3_Role"
    t.text "255281X110X1747Row3_InclusiveYrs"
    t.text "255281X110X1755Experience1"
    t.text "255281X110X1755Experience2"
    t.text "255281X110X1755Experience3"
    t.string "255281X110X1748", limit: 5
    t.string "255281X110X17491", limit: 5
    t.string "255281X110X17492", limit: 5
    t.string "255281X110X17493", limit: 5
    t.string "255281X110X17494", limit: 5
    t.string "255281X110X17495", limit: 5
    t.string "255281X110X17496", limit: 5
    t.string "255281X110X17497", limit: 5
    t.string "255281X110X17498", limit: 5
    t.string "255281X110X17499", limit: 5
    t.string "255281X110X174910", limit: 5
    t.string "255281X110X174911", limit: 5
    t.string "255281X110X174912", limit: 5
    t.string "255281X110X174913", limit: 5
    t.string "255281X110X174914", limit: 5
    t.string "255281X110X174915", limit: 5
    t.string "255281X110X174916", limit: 5
    t.string "255281X110X174917", limit: 5
    t.string "255281X110X174918", limit: 5
    t.string "255281X110X174919", limit: 5
    t.string "255281X110X174920", limit: 5
    t.string "255281X110X174921", limit: 5
    t.string "255281X110X174922", limit: 5
    t.string "255281X110X174923", limit: 5
    t.string "255281X111X17501", limit: 5
    t.string "255281X111X17502", limit: 5
    t.string "255281X111X17503", limit: 5
    t.string "255281X111X17504", limit: 5
    t.string "255281X111X17505", limit: 5
    t.string "255281X111X17506", limit: 5
    t.string "255281X111X17507", limit: 5
    t.decimal "255281X111X1751NoOfAdults", precision: 30, scale: 10
    t.decimal "255281X111X1751NoOfChildrens", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_255281_31938"
  end

  create_table "lime_survey_262858", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "262858X977X12154", limit: 5
    t.string "262858X977X12155", limit: 5
    t.string "262858X977X12156", limit: 5
    t.text "262858X977X12157SQ001"
    t.text "262858X977X12157SQ002"
    t.text "262858X977X12157SQ003"
    t.text "262858X977X12157SQ004"
    t.text "262858X977X12157SQ005"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_262858_6001"
  end

  create_table "lime_survey_263331", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "263331X1549X16812StudentYear"
    t.text "263331X1549X16812StudentEmail"
    t.text "263331X1549X16812StudentName"
    t.text "263331X1549X16812CoachEmail"
    t.text "263331X1549X16812CoachName"
    t.index ["token"], name: "idx_survey_token_263331_38610"
  end

  create_table "lime_survey_264391", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "264391X917X10360"
    t.text "264391X917X10361"
    t.text "264391X917X10367"
    t.text "264391X917X10368"
    t.text "264391X917X10369"
    t.text "264391X917X10370"
    t.string "264391X918X10362Represents", limit: 5
    t.string "264391X918X10362Responsible", limit: 5
    t.string "264391X918X10362Determine", limit: 5
    t.string "264391X918X10362Active", limit: 5
    t.string "264391X919X10363LearnAbout", limit: 5
    t.string "264391X919X10363AcceptAny", limit: 5
    t.string "264391X919X10363DevelopAShared", limit: 5
    t.string "264391X919X10363SpecificMeasurable", limit: 5
    t.string "264391X919X10363WorkWithYourCoach", limit: 5
    t.string "264391X920X10364RecognizePersFeeling", limit: 5
    t.string "264391X920X10364AwareOfEmotions", limit: 5
    t.string "264391X920X10364InvestigateBehavior", limit: 5
    t.string "264391X920X10364MyThinkingHabits", limit: 5
    t.string "264391X920X10364SafeLearningEnv", limit: 5
    t.string "264391X920X10364Commitment", limit: 5
    t.string "264391X920X10364Affirms", limit: 5
    t.string "264391X920X10364esLearningPrStimulat", limit: 5
    t.string "264391X920X10364Encourages", limit: 5
    t.text "264391X921X10365"
    t.text "264391X921X10366"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_264391_19762"
  end

  create_table "lime_survey_264391_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "264391X917time"
    t.float "264391X917X10360time"
    t.float "264391X917X10361time"
    t.float "264391X917X10367time"
    t.float "264391X917X10368time"
    t.float "264391X917X10369time"
    t.float "264391X917X10370time"
    t.float "264391X918time"
    t.float "264391X918X10362time"
    t.float "264391X919time"
    t.float "264391X919X10363time"
    t.float "264391X920time"
    t.float "264391X920X10364time"
    t.float "264391X921time"
    t.float "264391X921X10365time"
    t.float "264391X921X10366time"
  end

  create_table "lime_survey_266127", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "266127X978X12163"
    t.text "266127X978X12166"
    t.string "266127X981X12167", limit: 5
    t.text "266127X981X12168"
    t.text "266127X981X14488StudentYear"
    t.text "266127X981X14488StudentEmail"
    t.text "266127X981X14488StudentName"
    t.text "266127X981X14488CoachEmail"
    t.text "266127X981X14488CoachName"
    t.string "266127X979X12164C1", limit: 5
    t.string "266127X979X12164C2", limit: 5
    t.string "266127X979X12164C3", limit: 5
    t.string "266127X979X12164C4", limit: 5
    t.string "266127X979X12164C5", limit: 5
    t.string "266127X979X12164C6", limit: 5
    t.string "266127X979X12164C7", limit: 5
    t.string "266127X979X12164C8", limit: 5
    t.string "266127X979X12164C9", limit: 5
    t.text "266127X980X12165"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_266127_19649"
  end

  create_table "lime_survey_273679", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "273679X1070X12968StudentYear"
    t.text "273679X1070X12968StudentEmail"
    t.text "273679X1070X12968StudentName"
    t.text "273679X1070X12968CoachEmail"
    t.text "273679X1070X12968CoachName"
    t.text "273679X1075X12973PreceptorName"
    t.text "273679X1075X12973SubmitDate"
    t.text "273679X1075X12973Grade"
    t.text "273679X1075X12973Term"
    t.text "273679X1076X13001"
    t.text "273679X1076X13002"
    t.text "273679X1076X12974"
    t.string "273679X1074X12972ICS1", limit: 5
    t.string "273679X1074X12972ICS2", limit: 5
    t.string "273679X1074X12972ICS4", limit: 5
    t.string "273679X1074X12972ICS6", limit: 5
    t.string "273679X1074X12972ICS7", limit: 5
    t.string "273679X1072X12970PBLI1", limit: 5
    t.string "273679X1072X12970PBLI8", limit: 5
    t.string "273679X1073X12971PPPD1", limit: 5
    t.string "273679X1073X12971PPPD2", limit: 5
    t.string "273679X1073X12971PPPD6", limit: 5
    t.string "273679X1073X12971PPPD9", limit: 5
    t.string "273679X1071X12969SBPIC2", limit: 5
    t.string "273679X1071X12969SBPIC4", limit: 5
    t.string "273679X1071X12969SBPIC5", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_273679_2838"
  end

  create_table "lime_survey_279267", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "279267X1397X15001StudentYear"
    t.text "279267X1397X15001StudentEmail"
    t.text "279267X1397X15001StudentName"
    t.text "279267X1397X15001CoachEmail"
    t.text "279267X1397X15001CoachName"
    t.text "279267X1398X15002CourseYear"
    t.text "279267X1398X15002CourseName"
    t.decimal "279267X1398X15003Week1MCQ", precision: 30, scale: 10
    t.decimal "279267X1398X15003Week2MCQ", precision: 30, scale: 10
    t.decimal "279267X1398X15003Week3MCQ", precision: 30, scale: 10
    t.decimal "279267X1398X15003Week4MCQ", precision: 30, scale: 10
    t.decimal "279267X1398X15003Week5MCQ", precision: 30, scale: 10
    t.decimal "279267X1398X15003Week6MCQ", precision: 30, scale: 10
    t.decimal "279267X1398X15003Week7MCQ", precision: 30, scale: 10
    t.decimal "279267X1398X15003Week8MCQ", precision: 30, scale: 10
    t.decimal "279267X1398X15003Week9MCQAve", precision: 30, scale: 10
    t.text "279267X1398X15004DroppedQuiz"
    t.text "279267X1398X15004DroppedScore"
    t.decimal "279267X1398X15005CSA01", precision: 30, scale: 10
    t.decimal "279267X1398X15005CSA02", precision: 30, scale: 10
    t.decimal "279267X1398X15005CSA03", precision: 30, scale: 10
    t.decimal "279267X1398X15005CSL1", precision: 30, scale: 10
    t.decimal "279267X1398X15005HSS1", precision: 30, scale: 10
    t.decimal "279267X1398X15005HSS2Ave", precision: 30, scale: 10
    t.decimal "279267X1398X15052BSS1Anat1", precision: 30, scale: 10
    t.decimal "279267X1398X15052BSS2Histo1", precision: 30, scale: 10
    t.decimal "279267X1398X15052BSS3Anat2", precision: 30, scale: 10
    t.decimal "279267X1398X15052BSS4Histo2", precision: 30, scale: 10
    t.decimal "279267X1398X15052BSS5Histo3", precision: 30, scale: 10
    t.decimal "279267X1398X15052BSS6Anat3", precision: 30, scale: 10
    t.decimal "279267X1398X15052BSS7Ave", precision: 30, scale: 10
    t.decimal "279267X1398X15006FinalFund", precision: 30, scale: 10
    t.decimal "279267X1398X15007NBME", precision: 30, scale: 10
    t.decimal "279267X1398X15008CSAOSCE", precision: 30, scale: 10
    t.decimal "279267X1398X15008HSSInfor", precision: 30, scale: 10
    t.decimal "279267X1398X15008HSSInfAve", precision: 30, scale: 10
    t.decimal "279267X1398X15059BSSAnat", precision: 30, scale: 10
    t.decimal "279267X1398X15059BSSHisto", precision: 30, scale: 10
    t.decimal "279267X1398X15059BSSGenetics", precision: 30, scale: 10
    t.decimal "279267X1398X15059BSSCellBio", precision: 30, scale: 10
    t.decimal "279267X1398X15059BSSMicro", precision: 30, scale: 10
    t.decimal "279267X1398X15059BSSAve", precision: 30, scale: 10
    t.decimal "279267X1398X15009Component1", precision: 30, scale: 10
    t.decimal "279267X1398X15009Component2A", precision: 30, scale: 10
    t.decimal "279267X1398X15009Component2B", precision: 30, scale: 10
    t.decimal "279267X1398X15009Component3", precision: 30, scale: 10
    t.decimal "279267X1398X15009Component4", precision: 30, scale: 10
    t.decimal "279267X1398X15009Component5A", precision: 30, scale: 10
    t.decimal "279267X1398X15009Component5B", precision: 30, scale: 10
    t.text "279267X1398X15010"
    t.integer "279267X1398X15010_filecount"
    t.index ["token"], name: "idx_survey_token_279267_49307"
  end

  create_table "lime_survey_279376", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "279376X592X7279"
    t.text "279376X592X7280"
    t.text "279376X592X7286"
    t.text "279376X592X7287"
    t.text "279376X592X7288"
    t.text "279376X592X7289"
    t.string "279376X593X7281Clarify", limit: 5
    t.string "279376X593X7281Represents", limit: 5
    t.string "279376X593X7281Responsible", limit: 5
    t.string "279376X593X7281Inspire", limit: 5
    t.string "279376X593X7281Determine", limit: 5
    t.string "279376X593X7281Active", limit: 5
    t.string "279376X593X7281Honest", limit: 5
    t.string "279376X594X7282SeekAndHear", limit: 5
    t.string "279376X594X7282LearnAbout", limit: 5
    t.string "279376X594X7282AcceptAny", limit: 5
    t.string "279376X594X7282DevelopAShared", limit: 5
    t.string "279376X594X7282SpecificMeasurable", limit: 5
    t.string "279376X594X7282WorkWithYourCoach", limit: 5
    t.string "279376X594X7282DetermineTimelines", limit: 5
    t.string "279376X594X7282MonitorYourProgress", limit: 5
    t.string "279376X594X7282IdentifyProblems", limit: 5
    t.string "279376X594X7282SolveProblems", limit: 5
    t.string "279376X594X7282Characterize", limit: 5
    t.string "279376X595X7283RecognizePersFeeling", limit: 5
    t.string "279376X595X7283AwareOfEmotions", limit: 5
    t.string "279376X595X7283InvestigateBehavior", limit: 5
    t.string "279376X595X7283PayAttention", limit: 5
    t.string "279376X595X7283MyThinkingHabits", limit: 5
    t.string "279376X595X7283TrustingRelationship", limit: 5
    t.string "279376X595X7283SafeLearningEnv", limit: 5
    t.string "279376X595X7283Commitment", limit: 5
    t.string "279376X595X7283Affirms", limit: 5
    t.string "279376X595X7283WillingToAcceptFeedb", limit: 5
    t.string "279376X595X7283esLearningPrStimulat", limit: 5
    t.string "279376X595X7283Encourages", limit: 5
    t.string "279376X595X7283StimulatesProfDevelo", limit: 5
    t.string "279376X595X7283StimulatesConstFeedb", limit: 5
    t.text "279376X596X7284"
    t.text "279376X596X7285"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_279376_22055"
  end

  create_table "lime_survey_279376_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "279376X592time"
    t.float "279376X592X7279time"
    t.float "279376X592X7280time"
    t.float "279376X592X7286time"
    t.float "279376X592X7287time"
    t.float "279376X592X7288time"
    t.float "279376X592X7289time"
    t.float "279376X593time"
    t.float "279376X593X7281time"
    t.float "279376X594time"
    t.float "279376X594X7282time"
    t.float "279376X595time"
    t.float "279376X595X7283time"
    t.float "279376X596time"
    t.float "279376X596X7284time"
    t.float "279376X596X7285time"
  end

  create_table "lime_survey_283462", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "283462X1428X15453StudentYear"
    t.text "283462X1428X15453StudentEmail"
    t.text "283462X1428X15453StudentName"
    t.text "283462X1428X15453CoachEmail"
    t.text "283462X1428X15453CoachName"
    t.text "283462X1429X15456Step1PassFail"
    t.text "283462X1429X15456Step1ExamScore"
    t.text "283462X1429X15456Step1ExamDT"
    t.text "283462X1429X15456RetestPF"
    t.text "283462X1429X15456RetestExamScore"
    t.text "283462X1429X15456RetestExamDt"
    t.text "283462X1430X15454CKPassFail"
    t.text "283462X1430X15454CKExam"
    t.text "283462X1430X15454CKDT"
    t.text "283462X1430X15454CKPFRetest"
    t.text "283462X1430X15454CKExamRetest"
    t.text "283462X1430X15454CKDTRetest"
    t.text "283462X1431X15455CSExam"
    t.text "283462X1431X15455CSDT"
    t.text "283462X1431X15455CSExamRetest"
    t.text "283462X1431X15455CSDTRetest"
    t.index ["token"], name: "idx_survey_token_283462_39551"
  end

  create_table "lime_survey_285498", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "285498X388X4261RecognizePersFeeling", limit: 5
    t.string "285498X388X4261AwareOfEmotions", limit: 5
    t.string "285498X388X4261InvestigateBehavior", limit: 5
    t.string "285498X388X4261ContradictoryFeeling", limit: 5
    t.string "285498X388X4261ThinkingHabits", limit: 5
    t.string "285498X388X4261TrustingRelationship", limit: 5
    t.string "285498X388X4261SafeLearning", limit: 5
    t.string "285498X388X4261Commitment", limit: 5
    t.string "285498X388X4261Affirm", limit: 5
    t.string "285498X388X4261AcceptFeedback", limit: 5
    t.string "285498X388X4261Stimulates", limit: 5
    t.string "285498X388X4261Encourage", limit: 5
    t.string "285498X388X4261EncourageProfDev", limit: 5
    t.string "285498X388X4261ConstructiveFeedback", limit: 5
    t.text "285498X389X4262"
    t.text "285498X389X4263"
    t.text "285498X387X4260"
    t.text "285498X387X4265"
    t.text "285498X387X4264"
    t.text "285498X387X4266"
    t.text "285498X387X4267"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_285498_30368"
  end

  create_table "lime_survey_286313", id: :serial, force: :cascade do |t|
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "286313X5X563StudentEmail"
    t.text "286313X5X563StudentName"
    t.text "286313X5X563StudentID"
    t.text "286313X5X563CoachEmail"
    t.text "286313X5X563CoachName"
    t.string "286313X5X103SQ001", limit: 5
    t.string "286313X5X103SQ002", limit: 5
    t.string "286313X5X103SQ003", limit: 5
    t.string "286313X5X103SQ004", limit: 5
    t.string "286313X5X103SQ005", limit: 5
    t.string "286313X5X103SQ006", limit: 5
    t.string "286313X5X103SQ007", limit: 5
    t.string "286313X5X103SQ008", limit: 5
    t.string "286313X5X103SQ009", limit: 5
    t.string "286313X5X103SQ010", limit: 5
    t.string "286313X5X103SQ011", limit: 5
    t.string "286313X5X103SQ012", limit: 5
    t.string "seed", limit: 31
  end

  create_table "lime_survey_289191", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "289191X293X3525SQ001", limit: 5
    t.datetime "289191X290X3418", precision: nil
    t.string "289191X290X3419", limit: 5
    t.text "289191X290X3419other"
    t.string "289191X290X3420", limit: 5
    t.text "289191X290X3420other"
    t.string "289191X290X3421", limit: 5
    t.decimal "289191X290X3422", precision: 30, scale: 10
    t.string "289191X290X3423", limit: 5
    t.text "289191X290X3424Row1_Institution"
    t.text "289191X290X3424Row1_DegAttained"
    t.text "289191X290X3424Row1_MajorArea"
    t.text "289191X290X3424Row1_MinorArea"
    t.text "289191X290X3424Row1_YrOfGrad"
    t.text "289191X290X3424Row1_ScienceGPA"
    t.text "289191X290X3424Row1_OverallGPA"
    t.text "289191X290X3424Row2_Institution"
    t.text "289191X290X3424Row2_DegAttained"
    t.text "289191X290X3424Row2_MajorArea"
    t.text "289191X290X3424Row2_MinorArea"
    t.text "289191X290X3424Row2_YrOfGrad"
    t.text "289191X290X3424Row2_ScienceGPA"
    t.text "289191X290X3424Row2_OverallGPA"
    t.text "289191X290X3424Row3_Institution"
    t.text "289191X290X3424Row3_DegAttained"
    t.text "289191X290X3424Row3_MajorArea"
    t.text "289191X290X3424Row3_MinorArea"
    t.text "289191X290X3424Row3_YrOfGrad"
    t.text "289191X290X3424Row3_ScienceGPA"
    t.text "289191X290X3424Row3_OverallGPA"
    t.text "289191X290X3424Row4_Institution"
    t.text "289191X290X3424Row4_DegAttained"
    t.text "289191X290X3424Row4_MajorArea"
    t.text "289191X290X3424Row4_MinorArea"
    t.text "289191X290X3424Row4_YrOfGrad"
    t.text "289191X290X3424Row4_ScienceGPA"
    t.text "289191X290X3424Row4_OverallGPA"
    t.text "289191X290X3436Row1_YrMCAT"
    t.text "289191X290X3436Row1_PhySciences"
    t.text "289191X290X3436Row1_VerbalRea"
    t.text "289191X290X3436Row1_BioSciences"
    t.text "289191X290X3436Row1_MCATtolScore"
    t.text "289191X290X3436Row2_YrMCAT"
    t.text "289191X290X3436Row2_PhySciences"
    t.text "289191X290X3436Row2_VerbalRea"
    t.text "289191X290X3436Row2_BioSciences"
    t.text "289191X290X3436Row2_MCATtolScore"
    t.text "289191X290X3436Row3_YrMCAT"
    t.text "289191X290X3436Row3_PhySciences"
    t.text "289191X290X3436Row3_VerbalRea"
    t.text "289191X290X3436Row3_BioSciences"
    t.text "289191X290X3436Row3_MCATtolScore"
    t.string "289191X291X3445SQ1", limit: 5
    t.string "289191X291X3445SQ2", limit: 5
    t.string "289191X291X3445SQ3", limit: 5
    t.string "289191X291X3449SQ1", limit: 5
    t.string "289191X291X3449SQ2", limit: 5
    t.string "289191X291X3449SQ3", limit: 5
    t.string "289191X291X3454SQ1", limit: 5
    t.string "289191X291X3454SQ2", limit: 5
    t.string "289191X291X3454SQ3", limit: 5
    t.string "289191X291X3454SQ4", limit: 5
    t.string "289191X291X3459SQ1", limit: 5
    t.string "289191X291X3459SQ2", limit: 5
    t.string "289191X291X3459SQ3", limit: 5
    t.string "289191X291X3459SQ4", limit: 5
    t.string "289191X291X3461SQ1", limit: 5
    t.string "289191X291X3461SQ2", limit: 5
    t.string "289191X291X3461SQ3", limit: 5
    t.string "289191X291X3461SQ4", limit: 5
    t.string "289191X291X3466SQ1", limit: 5
    t.string "289191X291X3466SQ2", limit: 5
    t.string "289191X291X3466SQ3", limit: 5
    t.string "289191X291X3466SQ4", limit: 5
    t.string "289191X291X3471SQ1", limit: 5
    t.string "289191X291X3471SQ2", limit: 5
    t.string "289191X291X3471SQ3", limit: 5
    t.string "289191X291X3471SQ4", limit: 5
    t.string "289191X291X3476sq1", limit: 5
    t.string "289191X291X3476sq2", limit: 5
    t.string "289191X291X3476sq3", limit: 5
    t.text "289191X291X3476other"
    t.string "289191X291X3480sq1", limit: 5
    t.string "289191X291X3480sq2", limit: 5
    t.string "289191X291X3480sq3", limit: 5
    t.text "289191X291X3480other"
    t.text "289191X292X3489SQ1_OSHU"
    t.text "289191X292X3489SQ1_Ideal"
    t.text "289191X292X3489SQ2_OSHU"
    t.text "289191X292X3489SQ2_Ideal"
    t.text "289191X292X3489SQ3_OSHU"
    t.text "289191X292X3489SQ3_Ideal"
    t.string "289191X294X3494sq1", limit: 5
    t.string "289191X294X3494sq2", limit: 5
    t.string "289191X294X3494sq3", limit: 5
    t.string "289191X294X3494sq4", limit: 5
    t.string "289191X294X3500SQ1", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_289191_8175"
  end

  create_table "lime_survey_297591", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "297591X1055X12823SQ001", limit: 5
    t.string "297591X1055X12823SQ002", limit: 5
    t.string "297591X1055X12823SQ003", limit: 5
    t.string "297591X1055X12823SQ004", limit: 5
    t.string "297591X1055X12823SQ005", limit: 5
    t.string "297591X1055X12823SQ006", limit: 5
    t.string "297591X1055X12823SQ007", limit: 5
    t.string "297591X1055X12823SQ008", limit: 5
    t.string "297591X1055X12823SQ009", limit: 5
    t.string "297591X1055X12823SQ010", limit: 5
    t.string "297591X1055X12823SQ011", limit: 5
    t.string "297591X1055X12823SQ012", limit: 5
    t.string "297591X1055X12823SQ013", limit: 5
    t.string "297591X1055X12823SQ014", limit: 5
    t.string "297591X1055X12823SQ015", limit: 5
    t.string "297591X1055X12823SQ016", limit: 5
    t.string "297591X1055X12823SQ017", limit: 5
    t.string "297591X1055X12823SQ018", limit: 5
    t.string "297591X1055X12823SQ019", limit: 5
    t.string "297591X1055X12823SQ020", limit: 5
    t.string "297591X1055X12823SQ021", limit: 5
    t.string "297591X1055X12823SQ022", limit: 5
    t.string "297591X1055X12823SQ023", limit: 5
    t.string "297591X1055X12823SQ024", limit: 5
    t.string "297591X1055X12823SQ025", limit: 5
    t.string "297591X1055X12823SQ026", limit: 5
    t.string "297591X1055X12823SQ027", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_297591_21558"
  end

  create_table "lime_survey_297723", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "297723X338X3903"
    t.text "297723X338X3906"
    t.string "297723X341X3907", limit: 5
    t.text "297723X341X3908"
    t.text "297723X341X3902StudentYear"
    t.text "297723X341X3902StudentEmail"
    t.text "297723X341X3902StudentName"
    t.text "297723X341X3902CoachEmail"
    t.text "297723X341X3902CoachName"
    t.string "297723X339X3904C1", limit: 5
    t.string "297723X339X3904C2", limit: 5
    t.string "297723X339X3904C3", limit: 5
    t.string "297723X339X3904C4", limit: 5
    t.string "297723X339X3904C5", limit: 5
    t.string "297723X339X3904C6", limit: 5
    t.string "297723X339X3904C7", limit: 5
    t.string "297723X339X3904C8", limit: 5
    t.string "297723X339X3904C9", limit: 5
    t.text "297723X340X3905"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_297723_16774"
  end

  create_table "lime_survey_315995", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "315995X1518X16458SQ001"
    t.text "315995X1518X16458SQ002"
    t.text "315995X1518X16458SQ003"
    t.string "315995X1509X16449PatientCare1", limit: 5
    t.string "315995X1509X16449PatientCare2", limit: 5
    t.string "315995X1509X16449PatientCare3", limit: 5
    t.string "315995X1509X16449PatientCare4", limit: 5
    t.string "315995X1509X16449PatientCare5", limit: 5
    t.string "315995X1509X16449PatientCare6", limit: 5
    t.string "315995X1509X16449PatientCare7", limit: 5
    t.string "315995X1509X16449PatientCare8", limit: 5
    t.string "315995X1509X16449PatientCare9", limit: 5
    t.string "315995X1510X16450KnowledgePractice1", limit: 5
    t.string "315995X1510X16450KnowledgePractice2", limit: 5
    t.string "315995X1511X16451PracticeBasedLM1", limit: 5
    t.string "315995X1511X16451PracticeBasedLM2", limit: 5
    t.string "315995X1511X16451PracticeBasedLM3", limit: 5
    t.string "315995X1511X16451PracticeBasedLM4", limit: 5
    t.string "315995X1512X16452InterpersonalComm1", limit: 5
    t.string "315995X1513X16453Prof1", limit: 5
    t.string "315995X1513X16453Prof2", limit: 5
    t.string "315995X1514X16454SystemsBasedPrac1", limit: 5
    t.string "315995X1514X16454SystemsBasedPrac2", limit: 5
    t.string "315995X1514X16454SystemsBasedPrac3", limit: 5
    t.string "315995X1515X16455OtherLearner1", limit: 5
    t.string "315995X1516X16456OverallRating1", limit: 5
    t.text "315995X1517X16457"
    t.index ["token"], name: "idx_survey_token_315995_20312"
  end

  create_table "lime_survey_319345", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "319345X1104X13085"
    t.text "319345X1104X13086"
    t.text "319345X1104X13087"
    t.string "319345X1096X13077PatientCare1", limit: 5
    t.string "319345X1096X13077PatientCare2", limit: 5
    t.string "319345X1096X13077PatientCare3", limit: 5
    t.string "319345X1096X13077PatientCare4", limit: 5
    t.string "319345X1096X13077PatientCare5", limit: 5
    t.string "319345X1096X13077PatientCare6", limit: 5
    t.string "319345X1096X13077PatientCare7", limit: 5
    t.string "319345X1096X13077PatientCare8", limit: 5
    t.string "319345X1096X13077PatientCare9", limit: 5
    t.string "319345X1097X13078KnowledgePractice1", limit: 5
    t.string "319345X1097X13078KnowledgePractice2", limit: 5
    t.string "319345X1098X13079PracticeBasedLM1", limit: 5
    t.string "319345X1098X13079PracticeBasedLM2", limit: 5
    t.string "319345X1098X13079PracticeBasedLM3", limit: 5
    t.string "319345X1098X13079PracticeBasedLM4", limit: 5
    t.string "319345X1099X13080InterpersonalComm1", limit: 5
    t.string "319345X1100X13081Prof1", limit: 5
    t.string "319345X1101X13082SystemsBasedPrac1", limit: 5
    t.string "319345X1101X13082SystemsBasedPrac2", limit: 5
    t.string "319345X1101X13082SystemsBasedPrac3", limit: 5
    t.string "319345X1102X13083OverallRating1", limit: 5
    t.text "319345X1103X13084"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_319345_35404"
  end

  create_table "lime_survey_325846", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "325846X526X6514", limit: 1
    t.text "325846X526X6186"
    t.string "325846X526X6172SQ001", limit: 5
    t.string "325846X526X6173", limit: 5
    t.string "325846X526X6174", limit: 1
    t.string "325846X526X6175", limit: 5
    t.text "325846X526X6175other"
    t.string "325846X526X6787", limit: 5
    t.text "325846X526X6787other"
    t.string "325846X526X6176", limit: 1
    t.string "325846X526X6177", limit: 5
    t.text "325846X526X6177other"
    t.string "325846X526X6178", limit: 1
    t.string "325846X526X6179", limit: 5
    t.text "325846X526X6179other"
    t.string "325846X526X61801", limit: 5
    t.string "325846X526X61802", limit: 5
    t.string "325846X526X61803", limit: 5
    t.string "325846X526X61804", limit: 5
    t.string "325846X526X61805", limit: 5
    t.string "325846X526X61806", limit: 5
    t.string "325846X526X61807", limit: 5
    t.string "325846X526X61808", limit: 5
    t.string "325846X526X61809", limit: 5
    t.text "325846X526X6180other"
    t.string "325846X526X6181HowHelpful", limit: 5
    t.string "325846X526X6182VidUnderstanding", limit: 5
    t.string "325846X526X6182ClearContent", limit: 5
    t.string "325846X526X6182ReleventContent", limit: 5
    t.string "325846X526X6182AccurateContent", limit: 5
    t.string "325846X526X6182VidRightLen", limit: 5
    t.string "325846X526X6182DidnotFindVidHelpful", limit: 5
    t.string "325846X526X6183AlreadyUnderstood", limit: 5
    t.string "325846X526X6183NotClearContent", limit: 5
    t.string "325846X526X6183NotReleventContent", limit: 5
    t.string "325846X526X6183NotCorrectContent", limit: 5
    t.string "325846X526X6183VidTooLong", limit: 5
    t.string "325846X526X6183AllVidHelpful", limit: 5
    t.text "325846X526X6184"
    t.string "325846X526X6441Module1", limit: 5
    t.string "325846X526X6441Module2", limit: 5
    t.string "325846X526X6441Module3", limit: 5
    t.string "325846X526X6441Module4", limit: 5
    t.string "325846X526X6441Module5", limit: 5
    t.string "325846X526X6441Module6", limit: 5
    t.text "325846X527X6185StudentYear"
    t.text "325846X527X6185StudentEmail"
    t.text "325846X527X6185StudentName"
    t.text "325846X527X6185CoachEmail"
    t.text "325846X527X6185CoachName"
    t.string "325846X540X6485SQ001", limit: 5
    t.string "325846X540X6486SQ001", limit: 5
    t.string "325846X540X6487", limit: 5
    t.text "325846X540X6487other"
    t.string "325846X540X6488", limit: 1
    t.string "325846X540X6489", limit: 5
    t.text "325846X540X6489other"
    t.string "325846X540X6490SQ001", limit: 5
    t.string "325846X540X6490SQ002", limit: 5
    t.string "325846X540X6490SQ003", limit: 5
    t.string "325846X540X6490SQ004", limit: 5
    t.string "325846X540X6490SQ005", limit: 5
    t.string "325846X540X6490SQ006", limit: 5
    t.string "325846X540X6490SQ007", limit: 5
    t.string "325846X540X6490SQ008", limit: 5
    t.string "325846X540X6490SQ009", limit: 5
    t.string "325846X540X6491SQ001", limit: 5
    t.string "325846X540X6492SQ001", limit: 5
    t.string "325846X540X6492SQ002", limit: 5
    t.string "325846X540X6492SQ003", limit: 5
    t.string "325846X540X6492SQ004", limit: 5
    t.string "325846X540X6492SQ005", limit: 5
    t.string "325846X540X6492SQ006", limit: 5
    t.string "325846X540X6493", limit: 5
    t.string "325846X540X6494", limit: 5
    t.text "325846X540X6494other"
    t.text "325846X540X6495"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_325846_49757"
  end

  create_table "lime_survey_325846_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "325846X526time"
    t.float "325846X526X6514time"
    t.float "325846X526X6186time"
    t.float "325846X526X6172time"
    t.float "325846X526X6173time"
    t.float "325846X526X6174time"
    t.float "325846X526X6175time"
    t.float "325846X526X6787time"
    t.float "325846X526X6176time"
    t.float "325846X526X6177time"
    t.float "325846X526X6178time"
    t.float "325846X526X6179time"
    t.float "325846X526X6180time"
    t.float "325846X526X6181time"
    t.float "325846X526X6182time"
    t.float "325846X526X6183time"
    t.float "325846X526X6184time"
    t.float "325846X526X6441time"
    t.float "325846X527time"
    t.float "325846X527X6185time"
    t.float "325846X540time"
    t.float "325846X540X6485time"
    t.float "325846X540X6486time"
    t.float "325846X540X6487time"
    t.float "325846X540X6488time"
    t.float "325846X540X6489time"
    t.float "325846X540X6490time"
    t.float "325846X540X6491time"
    t.float "325846X540X6492time"
    t.float "325846X540X6493time"
    t.float "325846X540X6494time"
    t.float "325846X540X6495time"
  end

  create_table "lime_survey_332979", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "332979X1284X14006SQ001", limit: 5
    t.string "332979X1284X14006SQ002", limit: 5
    t.string "332979X1284X14006SQ003", limit: 5
    t.string "332979X1284X14006SQ004", limit: 5
    t.string "332979X1284X14006SQ005", limit: 5
    t.string "332979X1284X14006SQ006", limit: 5
    t.string "332979X1284X14006SQ007", limit: 5
    t.string "332979X1284X14006SQ008", limit: 5
    t.string "332979X1284X14006SQ009", limit: 5
    t.string "332979X1284X14006SQ010", limit: 5
    t.string "332979X1284X14006SQ011", limit: 5
    t.string "332979X1284X14006SQ012", limit: 5
    t.string "332979X1284X14006SQ013", limit: 5
    t.string "332979X1284X14006SQ014", limit: 5
    t.string "332979X1284X14006SQ015", limit: 5
    t.text "332979X1285X14007"
    t.text "332979X1285X14008"
    t.string "332979X1286X14009SQ001", limit: 5
    t.string "332979X1286X14010SQ001", limit: 5
    t.string "332979X1286X14010SQ002", limit: 5
    t.string "332979X1286X14010SQ003", limit: 5
    t.string "332979X1286X14010SQ004", limit: 5
    t.text "332979X1286X14012"
    t.text "332979X1286X14013"
    t.string "332979X1287X14011SQ001", limit: 5
    t.string "332979X1287X14014SQ001", limit: 5
    t.string "332979X1287X14014SQ002", limit: 5
    t.string "332979X1287X14014SQ003", limit: 5
    t.string "332979X1287X14014SQ004", limit: 5
    t.text "332979X1287X14015"
    t.text "332979X1287X14016"
    t.string "332979X1288X14017SQ001", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_332979_3139"
  end

  create_table "lime_survey_333341", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "333341X887X10017"
    t.text "333341X887X10025"
    t.text "333341X887X10026"
    t.text "333341X887X10027"
    t.text "333341X887X10028"
    t.string "333341X887X10018", limit: 5
    t.string "333341X887X10019", limit: 5
    t.text "333341X887X10020"
    t.decimal "333341X887X10021", precision: 30, scale: 10
    t.string "333341X887X10022", limit: 5
    t.decimal "333341X887X10023", precision: 30, scale: 10
    t.decimal "333341X887X10024", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_333341_22176"
  end

  create_table "lime_survey_333689", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "333689X505X5796InstructorKnowledge", limit: 5
    t.string "333689X505X5796InstructorWellPrep", limit: 5
    t.string "333689X505X5796InstructorRate", limit: 5
    t.text "333689X505X5797"
    t.text "333689X505X5798"
    t.text "333689X505X5799"
    t.text "333689X505X5800"
    t.text "333689X505X5801"
    t.text "333689X505X5802"
    t.string "333689X505X5803ClickerQ", limit: 5
    t.string "333689X505X5803Brief", limit: 5
    t.string "333689X505X5803Pair", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_333689_27797"
  end

  create_table "lime_survey_337222", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "337222X822X9377", limit: 1
    t.decimal "337222X822X9378", precision: 30, scale: 10
    t.string "337222X822X9379", limit: 5
    t.text "337222X822X9379other"
    t.string "337222X822X9380", limit: 5
    t.text "337222X822X9380other"
    t.string "337222X822X9381", limit: 5
    t.string "337222X822X9382", limit: 5
    t.string "337222X822X9383", limit: 5
    t.string "337222X821X9373", limit: 5
    t.text "337222X821X9374"
    t.string "337222X818X9367Commit", limit: 5
    t.string "337222X818X9367Responsible", limit: 5
    t.string "337222X818X9367Inspire", limit: 5
    t.string "337222X818X9367Active", limit: 5
    t.string "337222X818X9367Honest", limit: 5
    t.string "337222X819X9368LearnAbout", limit: 5
    t.string "337222X819X9368ConveyAny", limit: 5
    t.string "337222X819X9368DevelopAShared", limit: 5
    t.string "337222X819X9368SpecificMeasurable", limit: 5
    t.string "337222X819X9368WorkWithYourStudent", limit: 5
    t.string "337222X819X9368OrganizeInterpret", limit: 5
    t.string "337222X819X9368MonitorYourProgress", limit: 5
    t.string "337222X819X9368IdentifyProblems", limit: 5
    t.string "337222X819X9368SolveProblems", limit: 5
    t.string "337222X819X9368Characterize", limit: 5
    t.text "337222X820X9369"
    t.text "337222X820X9370"
    t.text "337222X817X9366"
    t.text "337222X817X9372"
    t.text "337222X817X9371"
    t.text "337222X817X9375"
    t.text "337222X817X9376"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_337222_35434"
  end

  create_table "lime_survey_339266", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "339266X263X3200", limit: 5
    t.string "339266X264X32011", limit: 5
    t.string "339266X264X32012", limit: 5
    t.string "339266X264X32013", limit: 5
    t.string "339266X264X32014", limit: 5
    t.string "339266X264X32015", limit: 5
    t.string "339266X264X32016", limit: 5
    t.string "339266X264X32017", limit: 5
    t.string "339266X264X32018", limit: 5
    t.string "339266X264X32019", limit: 5
    t.string "339266X264X320110", limit: 5
    t.text "339266X264X3628"
    t.string "339266X265X32021", limit: 5
    t.string "339266X265X32022", limit: 5
    t.string "339266X265X32023", limit: 5
    t.string "339266X265X32024", limit: 5
    t.string "339266X265X32025", limit: 5
    t.string "339266X265X32026", limit: 5
    t.string "339266X265X32027", limit: 5
    t.string "339266X265X32028", limit: 5
    t.string "339266X265X32029", limit: 5
    t.string "339266X265X320210", limit: 5
    t.string "339266X265X320211", limit: 5
    t.string "339266X265X320212", limit: 5
    t.string "339266X265X320213", limit: 5
    t.string "339266X265X320214", limit: 5
    t.string "339266X265X320215", limit: 5
    t.string "339266X265X320216", limit: 5
    t.string "339266X265X320217", limit: 5
    t.string "339266X265X320218", limit: 5
    t.string "339266X265X320219", limit: 5
    t.string "339266X265X320220", limit: 5
    t.string "339266X265X320221", limit: 5
    t.string "339266X265X320222", limit: 5
    t.string "339266X265X320223", limit: 5
    t.string "339266X265X320224", limit: 5
    t.text "339266X265X3629"
    t.text "339266X607X7408"
    t.text "339266X607X7409"
    t.text "339266X607X7410"
    t.text "339266X607X7411"
    t.text "339266X607X7412"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_339266_46803"
  end

  create_table "lime_survey_339853", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "339853X949X10546"
    t.text "339853X949X10549"
    t.string "339853X952X10550", limit: 5
    t.text "339853X952X10551"
    t.text "339853X952X14507StudentYear"
    t.text "339853X952X14507StudentEmail"
    t.text "339853X952X14507StudentName"
    t.text "339853X952X14507CoachEmail"
    t.text "339853X952X14507CoachName"
    t.string "339853X950X10547C1", limit: 5
    t.string "339853X950X10547C2", limit: 5
    t.string "339853X950X10547C3", limit: 5
    t.string "339853X950X10547C4", limit: 5
    t.string "339853X950X10547C5", limit: 5
    t.string "339853X950X10547C6", limit: 5
    t.string "339853X950X10547C7", limit: 5
    t.string "339853X950X10547C8", limit: 5
    t.string "339853X950X10547C9", limit: 5
    t.text "339853X951X10548"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_339853_40415"
  end

  create_table "lime_survey_346978", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "346978X723X8728StudentYear"
    t.text "346978X723X8728StudentEmail"
    t.text "346978X723X8728StudentName"
    t.text "346978X723X8728CoachEmail"
    t.text "346978X723X8728CoachName"
    t.text "346978X724X8731Step1PassFail"
    t.text "346978X724X8731Step1ExamScore"
    t.text "346978X724X8731Step1ExamDT"
    t.text "346978X724X8731RetestPF"
    t.text "346978X724X8731RetestExamScore"
    t.text "346978X724X8731RetestExamDt"
    t.text "346978X725X8729CKPassFail"
    t.text "346978X725X8729CKExam"
    t.text "346978X725X8729CKDT"
    t.text "346978X725X8729CKPFRetest"
    t.text "346978X725X8729CKExamRetest"
    t.text "346978X725X8729CKDTRetest"
    t.text "346978X726X8730CSExam"
    t.text "346978X726X8730CSDT"
    t.text "346978X726X8730CSExamRetest"
    t.text "346978X726X8730CSDTRetest"
    t.index ["token"], name: "idx_survey_token_346978_15640"
  end

  create_table "lime_survey_347561", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "347561X477X5407"
    t.text "347561X477X5410"
    t.string "347561X480X5411", limit: 5
    t.text "347561X480X5412"
    t.text "347561X480X5406StudentYear"
    t.text "347561X480X5406StudentEmail"
    t.text "347561X480X5406StudentName"
    t.text "347561X480X5406CoachEmail"
    t.text "347561X480X5406CoachName"
    t.string "347561X478X5408C1", limit: 5
    t.string "347561X478X5408C2", limit: 5
    t.string "347561X478X5408C3", limit: 5
    t.string "347561X478X5408C4", limit: 5
    t.string "347561X478X5408C5", limit: 5
    t.string "347561X478X5408C6", limit: 5
    t.string "347561X478X5408C7", limit: 5
    t.string "347561X478X5408C8", limit: 5
    t.string "347561X478X5408C9", limit: 5
    t.text "347561X479X5409"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_347561_11874"
  end

  create_table "lime_survey_349478", id: :serial, force: :cascade do |t|
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "349478X1118X13162", limit: 5
    t.text "349478X1118X13162other"
    t.string "349478X1118X13163", limit: 5
    t.string "349478X1118X13164", limit: 5
    t.text "349478X1118X13164other"
    t.string "349478X1119X13175", limit: 5
    t.string "349478X1119X13176", limit: 5
    t.string "349478X1119X13177", limit: 5
    t.string "349478X1119X13178", limit: 5
    t.text "349478X1119X13178other"
    t.text "349478X1119X13179"
    t.text "349478X1119X13180"
    t.string "349478X1120X13181", limit: 5
    t.string "349478X1120X13183", limit: 5
    t.text "349478X1120X13183comment"
    t.string "349478X1120X13197", limit: 5
    t.text "349478X1120X13197comment"
    t.string "349478X1120X13184", limit: 5
    t.text "349478X1120X13184other"
    t.text "349478X1120X13185"
    t.text "349478X1120X13186"
    t.string "349478X1121X13187", limit: 5
    t.string "349478X1121X13188", limit: 5
    t.string "349478X1121X13189", limit: 5
    t.text "349478X1121X13189comment"
    t.string "349478X1122X13194SQ001", limit: 5
    t.string "349478X1122X13194SQ002", limit: 5
    t.string "349478X1122X13194SQ003", limit: 5
    t.string "349478X1122X13194SQ004", limit: 5
    t.string "349478X1122X13194SQ005", limit: 5
    t.string "349478X1122X13194SQ006", limit: 5
    t.string "349478X1122X13194SQ007", limit: 5
    t.string "349478X1122X13194SQ008", limit: 5
    t.string "349478X1122X13194SQ009", limit: 5
    t.string "349478X1122X13194SQ010", limit: 5
    t.string "349478X1122X13194SQ011", limit: 5
    t.string "349478X1122X13194SQ012", limit: 5
    t.string "349478X1122X13211", limit: 5
    t.string "349478X1122X13212", limit: 5
    t.string "349478X1122X13213SQ001", limit: 5
    t.string "349478X1122X13213SQ002", limit: 5
    t.string "349478X1122X13213SQ003", limit: 5
    t.string "349478X1122X13213SQ004", limit: 5
    t.text "349478X1122X13218"
    t.text "349478X1122X13219"
    t.string "seed", limit: 31
  end

  create_table "lime_survey_349478_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "349478X1118time"
    t.float "349478X1118X13162time"
    t.float "349478X1118X13163time"
    t.float "349478X1118X13164time"
    t.float "349478X1119time"
    t.float "349478X1119X13175time"
    t.float "349478X1119X13176time"
    t.float "349478X1119X13177time"
    t.float "349478X1119X13178time"
    t.float "349478X1119X13179time"
    t.float "349478X1119X13180time"
    t.float "349478X1120time"
    t.float "349478X1120X13181time"
    t.float "349478X1120X13183time"
    t.float "349478X1120X13197time"
    t.float "349478X1120X13184time"
    t.float "349478X1120X13185time"
    t.float "349478X1120X13186time"
    t.float "349478X1121time"
    t.float "349478X1121X13187time"
    t.float "349478X1121X13188time"
    t.float "349478X1121X13189time"
    t.float "349478X1122time"
    t.float "349478X1122X13194time"
    t.float "349478X1122X13211time"
    t.float "349478X1122X13212time"
    t.float "349478X1122X13213time"
    t.float "349478X1122X13218time"
    t.float "349478X1122X13219time"
  end

  create_table "lime_survey_352185", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "352185X1369X14600"
    t.text "352185X1369X14601"
    t.text "352185X1369X14602"
    t.string "352185X1360X14591PatientCare1", limit: 5
    t.string "352185X1360X14591PatientCare2", limit: 5
    t.string "352185X1360X14591PatientCare3", limit: 5
    t.string "352185X1360X14591PatientCare4", limit: 5
    t.string "352185X1360X14591PatientCare5", limit: 5
    t.string "352185X1360X14591PatientCare6", limit: 5
    t.string "352185X1360X14591PatientCare7", limit: 5
    t.string "352185X1360X14591PatientCare8", limit: 5
    t.string "352185X1360X14591PatientCare9", limit: 5
    t.string "352185X1361X14592KnowledgePractice1", limit: 5
    t.string "352185X1361X14592KnowledgePractice2", limit: 5
    t.string "352185X1362X14593PracticeBasedLM1", limit: 5
    t.string "352185X1362X14593PracticeBasedLM2", limit: 5
    t.string "352185X1362X14593PracticeBasedLM3", limit: 5
    t.string "352185X1362X14593PracticeBasedLM4", limit: 5
    t.string "352185X1363X14594InterpersonalComm1", limit: 5
    t.string "352185X1364X14595Prof1", limit: 5
    t.string "352185X1364X14595Prof2", limit: 5
    t.string "352185X1365X14596SystemsBasedPrac1", limit: 5
    t.string "352185X1365X14596SystemsBasedPrac2", limit: 5
    t.string "352185X1365X14596SystemsBasedPrac3", limit: 5
    t.string "352185X1366X14597OtherLearner1", limit: 5
    t.string "352185X1367X14598OverallRating1", limit: 5
    t.text "352185X1368X14599"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_352185_19025"
  end

  create_table "lime_survey_352355", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "352355X65X1071StudentYear"
    t.text "352355X65X1071StudentEmail"
    t.text "352355X65X1071StudentName"
    t.text "352355X65X1071CoachEmail"
    t.text "352355X65X1071CoachName"
    t.text "352355X66X1072CourseYear"
    t.text "352355X66X1072CourseName"
    t.decimal "352355X66X1073Week1MCQ", precision: 30, scale: 10
    t.decimal "352355X66X1073Week2MCQ", precision: 30, scale: 10
    t.decimal "352355X66X1073Week3MCQ", precision: 30, scale: 10
    t.decimal "352355X66X1073Week4MCQ", precision: 30, scale: 10
    t.decimal "352355X66X1073Week5MCQ", precision: 30, scale: 10
    t.text "352355X66X1074DroppedQuiz"
    t.text "352355X66X1074DroppedScore"
    t.decimal "352355X66X1075Anatomy", precision: 30, scale: 10
    t.decimal "352355X66X1075DermatologyImages", precision: 30, scale: 10
    t.decimal "352355X66X1075Informatics", precision: 30, scale: 10
    t.decimal "352355X66X1075Week3CSAArithritis", precision: 30, scale: 10
    t.decimal "352355X66X1076", precision: 30, scale: 10
    t.decimal "352355X66X1077", precision: 30, scale: 10
    t.decimal "352355X66X1078AnatomyFinal", precision: 30, scale: 10
    t.decimal "352355X66X1078Histology", precision: 30, scale: 10
    t.decimal "352355X66X1078ProblemRep", precision: 30, scale: 10
    t.decimal "352355X66X1078VisualImages", precision: 30, scale: 10
    t.decimal "352355X66X1079Component1", precision: 30, scale: 10
    t.decimal "352355X66X1079Component2", precision: 30, scale: 10
    t.decimal "352355X66X1079Component3", precision: 30, scale: 10
    t.decimal "352355X66X1079Component4", precision: 30, scale: 10
    t.decimal "352355X66X1079Component5", precision: 30, scale: 10
    t.text "352355X66X1449"
    t.integer "352355X66X1449_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_352355_28503"
  end

  create_table "lime_survey_354858", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "354858X654X7970RecognizePersFeeling", limit: 5
    t.string "354858X654X7970AwareOfEmotions", limit: 5
    t.string "354858X654X7970InvestigateBehavior", limit: 5
    t.string "354858X654X7970ContradictoryFeeling", limit: 5
    t.string "354858X654X7970ThinkingHabits", limit: 5
    t.string "354858X654X7970TrustingRelationship", limit: 5
    t.string "354858X654X7970SafeLearning", limit: 5
    t.string "354858X654X7970Commitment", limit: 5
    t.string "354858X654X7970Affirm", limit: 5
    t.string "354858X654X7970AcceptFeedback", limit: 5
    t.string "354858X654X7970Stimulates", limit: 5
    t.string "354858X654X7970Encourage", limit: 5
    t.string "354858X654X7970EncourageProfDev", limit: 5
    t.string "354858X654X7970ConstructiveFeedback", limit: 5
    t.string "354858X656X8020", limit: 1
    t.string "354858X656X8006", limit: 5
    t.text "354858X656X8007"
    t.string "354858X656X8008", limit: 5
    t.string "354858X656X8009", limit: 5
    t.string "354858X656X8010", limit: 5
    t.string "354858X656X8011", limit: 5
    t.text "354858X656X8011other"
    t.string "354858X656X8012", limit: 5
    t.text "354858X656X8012other"
    t.string "354858X656X8013", limit: 5
    t.text "354858X656X8014"
    t.string "354858X656X8015Q1", limit: 5
    t.text "354858X656X8016"
    t.string "354858X656X8017Q1", limit: 5
    t.text "354858X653X7969"
    t.text "354858X653X7972"
    t.text "354858X653X7971"
    t.text "354858X653X7973"
    t.text "354858X653X7974"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_354858_1651"
  end

  create_table "lime_survey_355638", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "355638X1449X15634StudentYear"
    t.text "355638X1449X15634StudentID"
    t.text "355638X1449X15634MedhubID"
    t.text "355638X1449X15634StudentEmail"
    t.text "355638X1449X15634StudentName"
    t.text "355638X1449X15634CoachEmail"
    t.text "355638X1449X15634CoachName"
    t.text "355638X1451X15636CourseName"
    t.text "355638X1451X15636CourseID"
    t.text "355638X1451X15636StartDt"
    t.text "355638X1451X15636EndDt"
    t.text "355638X1451X15636SubmitDt"
    t.text "355638X1451X15636Eval"
    t.text "355638X1451X15636FinalGrade"
    t.text "355638X1451X15636Env"
    t.text "355638X1452X15637ProfConcerns"
    t.text "355638X1452X15637CommProfConcerns"
    t.text "355638X1452X15637OverSummCommPerf"
    t.text "355638X1452X15637AddCommOnPerform"
    t.text "355638X1452X15637MSPE"
    t.text "355638X1452X15637OptClinicExpComm"
    t.text "355638X1452X15637Feedback"
    t.text "355638X1450X15635ICS1"
    t.text "355638X1450X15635ICS2"
    t.text "355638X1450X15635ICS3"
    t.text "355638X1450X15635ICS4"
    t.text "355638X1450X15635ICS5"
    t.text "355638X1450X15635ICS6"
    t.text "355638X1450X15635ICS7"
    t.text "355638X1450X15635ICS8"
    t.text "355638X1450X15635MK1"
    t.text "355638X1450X15635MK2"
    t.text "355638X1450X15635MK3"
    t.text "355638X1450X15635MK4"
    t.text "355638X1450X15635MK5"
    t.text "355638X1450X15635PBLI1"
    t.text "355638X1450X15635PBLI2"
    t.text "355638X1450X15635PBLI3"
    t.text "355638X1450X15635PBLI4"
    t.text "355638X1450X15635PBLI5"
    t.text "355638X1450X15635PBLI6"
    t.text "355638X1450X15635PBLI7"
    t.text "355638X1450X15635PBLI8"
    t.text "355638X1450X15635PCP1"
    t.text "355638X1450X15635PCP2"
    t.text "355638X1450X15635PCP3"
    t.text "355638X1450X15635PCP4"
    t.text "355638X1450X15635PCP5"
    t.text "355638X1450X15635PCP6"
    t.text "355638X1450X15635PPPD01"
    t.text "355638X1450X15635PPPD02"
    t.text "355638X1450X15635PPPD03"
    t.text "355638X1450X15635PPPD04"
    t.text "355638X1450X15635PPPD05"
    t.text "355638X1450X15635PPPD06"
    t.text "355638X1450X15635PPPD07"
    t.text "355638X1450X15635PPPD08"
    t.text "355638X1450X15635PPPD09"
    t.text "355638X1450X15635PPPD10"
    t.text "355638X1450X15635PPPD11"
    t.text "355638X1450X15635SBPIC1"
    t.text "355638X1450X15635SBPIC2"
    t.text "355638X1450X15635SBPIC3"
    t.text "355638X1450X15635SBPIC4"
    t.text "355638X1450X15635SBPIC5"
    t.index ["token"], name: "idx_survey_token_355638_19419"
  end

  create_table "lime_survey_355818", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "355818X816X9359", limit: 1
    t.decimal "355818X816X9360", precision: 30, scale: 10
    t.string "355818X816X9361", limit: 5
    t.text "355818X816X9361other"
    t.string "355818X816X9362", limit: 5
    t.text "355818X816X9362other"
    t.string "355818X816X9363", limit: 5
    t.string "355818X816X9364", limit: 5
    t.string "355818X816X9365", limit: 5
    t.string "355818X802X9243", limit: 5
    t.text "355818X802X9244"
    t.string "355818X799X9237Commit", limit: 5
    t.string "355818X799X9237Responsible", limit: 5
    t.string "355818X799X9237Inspire", limit: 5
    t.string "355818X799X9237Active", limit: 5
    t.string "355818X799X9237Honest", limit: 5
    t.string "355818X800X9238LearnAbout", limit: 5
    t.string "355818X800X9238ConveyAny", limit: 5
    t.string "355818X800X9238DevelopAShared", limit: 5
    t.string "355818X800X9238SpecificMeasurable", limit: 5
    t.string "355818X800X9238WorkWithYourStudent", limit: 5
    t.string "355818X800X9238OrganizeInterpret", limit: 5
    t.string "355818X800X9238MonitorYourProgress", limit: 5
    t.string "355818X800X9238IdentifyProblems", limit: 5
    t.string "355818X800X9238SolveProblems", limit: 5
    t.string "355818X800X9238Characterize", limit: 5
    t.text "355818X801X9239"
    t.text "355818X801X9240"
    t.text "355818X798X9236"
    t.text "355818X798X9242"
    t.text "355818X798X9241"
    t.text "355818X798X9245"
    t.text "355818X798X9246"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_355818_13339"
  end

  create_table "lime_survey_356148", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "356148X1181X13481SQ001", limit: 5
    t.string "356148X1181X13481SQ002", limit: 5
    t.string "356148X1181X13481SQ003", limit: 5
    t.string "356148X1181X13481SQ004", limit: 5
    t.text "356148X1181X13486"
    t.string "356148X1182X13482SQ001", limit: 5
    t.string "356148X1182X13482SQ002", limit: 5
    t.string "356148X1183X13483SQ001", limit: 5
    t.string "356148X1183X13483SQ002", limit: 5
    t.string "356148X1183X13483SQ003", limit: 5
    t.string "356148X1183X13483SQ004", limit: 5
    t.string "356148X1183X13483SQ005", limit: 5
    t.string "356148X1183X13483SQ006", limit: 5
    t.string "356148X1183X13483SQ007", limit: 5
    t.string "356148X1183X13483SQ008", limit: 5
    t.string "356148X1183X13483SQ009", limit: 5
    t.string "356148X1183X13483SQ010", limit: 5
    t.text "356148X1183X13487"
    t.string "356148X1184X13484SQ001", limit: 5
    t.text "356148X1185X13485"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_356148_29915"
  end

  create_table "lime_survey_356167", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "356167X509X5904SQ001", limit: 5
    t.string "356167X506X5838SQ006", limit: 5
    t.string "356167X506X58391", limit: 5
    t.string "356167X506X58392", limit: 5
    t.string "356167X506X58393", limit: 5
    t.string "356167X506X58394", limit: 5
    t.string "356167X506X5840SQ001", limit: 5
    t.string "356167X506X5841SQ001", limit: 5
    t.string "356167X506X5842SQ001", limit: 5
    t.string "356167X506X5843SQ001", limit: 5
    t.string "356167X506X5843SQ002", limit: 5
    t.string "356167X506X5843SQ003", limit: 5
    t.string "356167X506X5843SQ004", limit: 5
    t.string "356167X506X5843SQ005", limit: 5
    t.string "356167X506X5843SQ006", limit: 5
    t.string "356167X506X5843SQ007", limit: 5
    t.string "356167X506X5843SQ008", limit: 5
    t.string "356167X506X5843SQ009", limit: 5
    t.string "356167X507X5844SQ001", limit: 5
    t.string "356167X507X5844SQ002", limit: 5
    t.string "356167X507X5844SQ003", limit: 5
    t.string "356167X507X5844SQ004", limit: 5
    t.string "356167X507X58451", limit: 5
    t.string "356167X507X58452", limit: 5
    t.string "356167X507X58453", limit: 5
    t.string "356167X507X58454", limit: 5
    t.string "356167X507X58455", limit: 5
    t.string "356167X507X58456", limit: 5
    t.string "356167X507X58457", limit: 5
    t.string "356167X507X58458", limit: 5
    t.string "356167X507X58459", limit: 5
    t.string "356167X507X584510", limit: 5
    t.string "356167X507X584511", limit: 5
    t.string "356167X507X584512", limit: 5
    t.string "356167X507X584513", limit: 5
    t.string "356167X507X584514", limit: 5
    t.string "356167X507X584515", limit: 5
    t.string "356167X507X59061", limit: 5
    t.string "356167X507X59062", limit: 5
    t.string "356167X507X5909SQ002", limit: 5
    t.text "356167X507X5846SQ001"
    t.text "356167X507X5910SQ002"
    t.string "356167X508X5847", limit: 5
    t.string "356167X508X5848SQ001", limit: 5
    t.string "356167X508X5848SQ002", limit: 5
    t.text "356167X508X5848other"
    t.string "356167X508X58491", limit: 5
    t.string "356167X508X58492", limit: 5
    t.string "356167X508X58493", limit: 5
    t.string "356167X508X58494", limit: 5
    t.string "356167X508X58495", limit: 5
    t.string "356167X508X58496", limit: 5
    t.string "356167X508X58497", limit: 5
    t.string "356167X508X58498", limit: 5
    t.text "356167X508X5849other"
    t.string "356167X508X5850", limit: 5
    t.string "356167X508X5851", limit: 1
    t.decimal "356167X508X5852", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_356167_31105"
  end

  create_table "lime_survey_361445", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "361445X566X7007"
    t.text "361445X566X7010"
    t.string "361445X569X7011", limit: 5
    t.text "361445X569X7012"
    t.text "361445X569X7006StudentYear"
    t.text "361445X569X7006StudentEmail"
    t.text "361445X569X7006StudentName"
    t.text "361445X569X7006CoachEmail"
    t.text "361445X569X7006CoachName"
    t.string "361445X567X7008C1", limit: 5
    t.string "361445X567X7008C2", limit: 5
    t.string "361445X567X7008C3", limit: 5
    t.string "361445X567X7008C4", limit: 5
    t.string "361445X567X7008C5", limit: 5
    t.string "361445X567X7008C6", limit: 5
    t.string "361445X567X7008C7", limit: 5
    t.string "361445X567X7008C8", limit: 5
    t.string "361445X567X7008C9", limit: 5
    t.text "361445X568X7009"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_361445_24030"
  end

  create_table "lime_survey_363835", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "363835X1422X15374StudentYear"
    t.text "363835X1422X15374StudentEmail"
    t.text "363835X1422X15374StudentName"
    t.text "363835X1422X15374CoachEmail"
    t.text "363835X1422X15374CoachName"
    t.text "363835X1423X15375SQ001"
    t.text "363835X1423X15375SQ002"
    t.text "363835X1423X15376"
    t.integer "363835X1423X15376_filecount"
    t.index ["token"], name: "idx_survey_token_363835_19595"
  end

  create_table "lime_survey_364732", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "364732X550X6831InstructorKnowledge", limit: 5
    t.string "364732X550X6831InstructorWellPrep", limit: 5
    t.string "364732X550X6831InstructorRate", limit: 5
    t.text "364732X550X6832"
    t.text "364732X550X6833"
    t.text "364732X550X6834"
    t.text "364732X550X6835"
    t.text "364732X550X6836"
    t.text "364732X550X6837"
    t.string "364732X550X6838ClickerQ", limit: 5
    t.string "364732X550X6838Brief", limit: 5
    t.string "364732X550X6838Pair", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_364732_4594"
  end

  create_table "lime_survey_364796", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "364796X549X6803InstructorKnowledge", limit: 5
    t.string "364796X549X6803InstructorWellPrep", limit: 5
    t.string "364796X549X6803InstructorRate", limit: 5
    t.text "364796X549X6804"
    t.text "364796X549X6805"
    t.text "364796X549X6806"
    t.text "364796X549X6807"
    t.text "364796X549X6808"
    t.text "364796X549X6809"
    t.string "364796X549X6810ClickerQ", limit: 5
    t.string "364796X549X6810Brief", limit: 5
    t.string "364796X549X6810Pair", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_364796_48660"
  end

  create_table "lime_survey_364877", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "364877X559X6867StudentYear"
    t.text "364877X559X6867StudentEmail"
    t.text "364877X559X6867StudentName"
    t.text "364877X559X6867CoachEmail"
    t.text "364877X559X6867CoachName"
    t.string "364877X552X6860SQ1", limit: 5
    t.string "364877X552X6860SQ2", limit: 5
    t.string "364877X552X6860SQ3", limit: 5
    t.string "364877X552X6860SQ4", limit: 5
    t.string "364877X552X6860SQ5", limit: 5
    t.string "364877X552X6860SQ6", limit: 5
    t.string "364877X552X6860SQ7", limit: 5
    t.string "364877X552X6860SQ8", limit: 5
    t.string "364877X552X6860SQ9", limit: 5
    t.string "364877X552X6860SQ10", limit: 5
    t.string "364877X553X6861sq1", limit: 5
    t.string "364877X553X6861sq2", limit: 5
    t.string "364877X554X6862sq1", limit: 5
    t.string "364877X554X6862sq2", limit: 5
    t.string "364877X554X6862sq3", limit: 5
    t.string "364877X555X6863sq1", limit: 5
    t.string "364877X555X6863sq2", limit: 5
    t.string "364877X555X6863sq3", limit: 5
    t.string "364877X556X6864sq1", limit: 5
    t.string "364877X556X6864sq2", limit: 5
    t.string "364877X557X68651", limit: 5
    t.string "364877X557X68652", limit: 5
    t.string "364877X557X68653", limit: 5
    t.text "364877X558X6866"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_364877_34029"
  end

  create_table "lime_survey_365272", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "365272X885X9964StudentYear"
    t.text "365272X885X9964StudentEmail"
    t.text "365272X885X9964StudentName"
    t.text "365272X885X9964CoachEmail"
    t.text "365272X885X9964CoachName"
    t.text "365272X886X9965CourseYear"
    t.text "365272X886X9965CourseName"
    t.decimal "365272X886X9966Week1MCQ", precision: 30, scale: 10
    t.decimal "365272X886X9966Week2MCQ", precision: 30, scale: 10
    t.decimal "365272X886X9966Week3MCQ", precision: 30, scale: 10
    t.decimal "365272X886X9966Week4MCQ", precision: 30, scale: 10
    t.decimal "365272X886X9966Week5MCQ", precision: 30, scale: 10
    t.decimal "365272X886X9966Week6MCQ", precision: 30, scale: 10
    t.decimal "365272X886X9966Week7MCQ", precision: 30, scale: 10
    t.text "365272X886X9967DroppedQuiz"
    t.text "365272X886X9967DroppedScore"
    t.decimal "365272X886X9968CSA01", precision: 30, scale: 10
    t.decimal "365272X886X9968CSA02", precision: 30, scale: 10
    t.decimal "365272X886X9968CSA03", precision: 30, scale: 10
    t.decimal "365272X886X9968CSA04", precision: 30, scale: 10
    t.decimal "365272X886X9968CSA05", precision: 30, scale: 10
    t.decimal "365272X886X9968CSA06", precision: 30, scale: 10
    t.decimal "365272X886X9968CSA07", precision: 30, scale: 10
    t.decimal "365272X886X9968CSA08", precision: 30, scale: 10
    t.decimal "365272X886X9968CSA09", precision: 30, scale: 10
    t.decimal "365272X886X9968CSA10", precision: 30, scale: 10
    t.decimal "365272X886X9968CSA11", precision: 30, scale: 10
    t.decimal "365272X886X9969Final1", precision: 30, scale: 10
    t.decimal "365272X886X9969Final2", precision: 30, scale: 10
    t.decimal "365272X886X9970NBME", precision: 30, scale: 10
    t.decimal "365272X886X9971OSCE", precision: 30, scale: 10
    t.decimal "365272X886X9971Neuro", precision: 30, scale: 10
    t.decimal "365272X886X9971Anat", precision: 30, scale: 10
    t.decimal "365272X886X9971Histo", precision: 30, scale: 10
    t.decimal "365272X886X9972Component1", precision: 30, scale: 10
    t.decimal "365272X886X9972Component2", precision: 30, scale: 10
    t.decimal "365272X886X9972Component3", precision: 30, scale: 10
    t.decimal "365272X886X9972Component4", precision: 30, scale: 10
    t.decimal "365272X886X9972Component5", precision: 30, scale: 10
    t.text "365272X886X9973"
    t.integer "365272X886X9973_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_365272_21704"
  end

  create_table "lime_survey_365933", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "365933X1279X13966SQ001", limit: 5
    t.string "365933X1279X13966SQ002", limit: 5
    t.string "365933X1279X13966SQ003", limit: 5
    t.string "365933X1279X13966SQ004", limit: 5
    t.string "365933X1279X13966SQ005", limit: 5
    t.string "365933X1279X13966SQ006", limit: 5
    t.string "365933X1279X13966SQ007", limit: 5
    t.string "365933X1279X13966SQ008", limit: 5
    t.string "365933X1279X13966SQ009", limit: 5
    t.string "365933X1279X13966SQ010", limit: 5
    t.string "365933X1279X13966SQ011", limit: 5
    t.string "365933X1279X13966SQ012", limit: 5
    t.string "365933X1279X13966SQ013", limit: 5
    t.string "365933X1279X13966SQ014", limit: 5
    t.string "365933X1279X13966SQ015", limit: 5
    t.text "365933X1280X13982"
    t.text "365933X1280X13983"
    t.string "365933X1281X13984SQ001", limit: 5
    t.string "365933X1281X13988SQ001", limit: 5
    t.string "365933X1281X13988SQ002", limit: 5
    t.string "365933X1281X13988SQ003", limit: 5
    t.string "365933X1281X13988SQ004", limit: 5
    t.text "365933X1281X13995"
    t.text "365933X1281X13996"
    t.string "365933X1282X13993SQ001", limit: 5
    t.string "365933X1282X13997SQ001", limit: 5
    t.string "365933X1282X13997SQ002", limit: 5
    t.string "365933X1282X13997SQ003", limit: 5
    t.string "365933X1282X13997SQ004", limit: 5
    t.text "365933X1282X14002"
    t.text "365933X1282X14003"
    t.string "365933X1283X14004SQ001", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_365933_8215"
  end

  create_table "lime_survey_371212", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "371212X522X6152"
    t.text "371212X522X6155"
    t.string "371212X525X6156", limit: 5
    t.text "371212X525X6157"
    t.text "371212X525X6151StudentYear"
    t.text "371212X525X6151StudentEmail"
    t.text "371212X525X6151StudentName"
    t.text "371212X525X6151CoachEmail"
    t.text "371212X525X6151CoachName"
    t.string "371212X523X6153C1", limit: 5
    t.string "371212X523X6153C2", limit: 5
    t.string "371212X523X6153C3", limit: 5
    t.string "371212X523X6153C4", limit: 5
    t.string "371212X523X6153C5", limit: 5
    t.string "371212X523X6153C6", limit: 5
    t.string "371212X523X6153C7", limit: 5
    t.string "371212X523X6153C8", limit: 5
    t.string "371212X523X6153C9", limit: 5
    t.text "371212X524X6154"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_371212_27237"
  end

  create_table "lime_survey_374554", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "374554X1255X13813SQ001", limit: 5
    t.string "374554X1255X13813SQ002", limit: 5
    t.string "374554X1255X13813SQ003", limit: 5
    t.string "374554X1255X13813SQ004", limit: 5
    t.string "374554X1255X13813SQ005", limit: 5
    t.string "374554X1255X13813SQ006", limit: 5
    t.string "374554X1255X13813SQ007", limit: 5
    t.string "374554X1255X13813SQ008", limit: 5
    t.string "374554X1255X13813SQ009", limit: 5
    t.string "374554X1255X13813SQ010", limit: 5
    t.string "374554X1255X13813SQ011", limit: 5
    t.string "374554X1255X13813SQ012", limit: 5
    t.string "374554X1255X13813SQ013", limit: 5
    t.string "374554X1255X13813SQ014", limit: 5
    t.string "374554X1256X13814SQ001", limit: 5
    t.string "374554X1256X13814SQ002", limit: 5
    t.string "374554X1256X13814SQ003", limit: 5
    t.string "374554X1256X13814SQ004", limit: 5
    t.text "374554X1257X13815"
    t.string "374554X1300X14136SQ001", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_374554_20429"
  end

  create_table "lime_survey_375442", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "375442X1493X16305SQ001"
    t.text "375442X1493X16305SQ002"
    t.text "375442X1493X16305SQ004"
    t.text "375442X1493X16305SQ005"
    t.string "375442X1494X16306", limit: 5
    t.string "375442X1494X16313", limit: 5
    t.string "375442X1494X16307", limit: 5
    t.string "375442X1494X16314", limit: 5
    t.string "375442X1495X16308SQ001", limit: 5
    t.string "375442X1495X16308SQ002", limit: 5
    t.string "375442X1495X16308SQ003", limit: 5
    t.string "375442X1495X16308SQ004", limit: 5
    t.string "375442X1495X16308SQ005", limit: 5
    t.string "375442X1495X16308SQ006", limit: 5
    t.string "375442X1495X16308SQ007", limit: 5
    t.string "375442X1495X16308SQ008", limit: 5
    t.string "375442X1495X16308SQ009", limit: 5
    t.text "375442X1495X16309"
    t.text "375442X1496X16311"
    t.text "375442X1496X16310"
    t.string "375442X1497X16312", limit: 5
    t.index ["token"], name: "idx_survey_token_375442_30762"
  end

  create_table "lime_survey_376199", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "376199X1163X13386SQ001", limit: 5
    t.string "376199X1163X13386SQ002", limit: 5
    t.string "376199X1163X13386SQ003", limit: 5
    t.string "376199X1163X13386SQ004", limit: 5
    t.text "376199X1163X13411"
    t.string "376199X1164X13391SQ001", limit: 5
    t.string "376199X1164X13391SQ002", limit: 5
    t.string "376199X1165X13394SQ001", limit: 5
    t.string "376199X1165X13394SQ002", limit: 5
    t.string "376199X1165X13394SQ003", limit: 5
    t.string "376199X1165X13394SQ004", limit: 5
    t.string "376199X1165X13394SQ005", limit: 5
    t.string "376199X1165X13394SQ006", limit: 5
    t.string "376199X1165X13394SQ007", limit: 5
    t.string "376199X1165X13394SQ008", limit: 5
    t.string "376199X1165X13394SQ009", limit: 5
    t.string "376199X1165X13394SQ010", limit: 5
    t.text "376199X1165X13413"
    t.string "376199X1166X13405SQ001", limit: 5
    t.text "376199X1167X13407"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_376199_33778"
  end

  create_table "lime_survey_377251", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "377251X562X6910StudentYear"
    t.text "377251X562X6910StudentEmail"
    t.text "377251X562X6910StudentName"
    t.text "377251X562X6910CoachEmail"
    t.text "377251X562X6910CoachName"
    t.text "377251X563X6911CourseYear"
    t.text "377251X563X6911CourseName"
    t.decimal "377251X563X6912Week1MCQ", precision: 30, scale: 10
    t.decimal "377251X563X6912Week2MCQ", precision: 30, scale: 10
    t.decimal "377251X563X6912Week3MCQ", precision: 30, scale: 10
    t.decimal "377251X563X6912Week4MCQ", precision: 30, scale: 10
    t.decimal "377251X563X6912Week5MCQ", precision: 30, scale: 10
    t.decimal "377251X563X6912Week6MCQ", precision: 30, scale: 10
    t.decimal "377251X563X6912Week7MCQ", precision: 30, scale: 10
    t.text "377251X563X6913DroppedQuiz"
    t.text "377251X563X6913DroppedScore"
    t.decimal "377251X563X6914CSA1", precision: 30, scale: 10
    t.decimal "377251X563X6914CSA2", precision: 30, scale: 10
    t.decimal "377251X563X6914CSA3", precision: 30, scale: 10
    t.decimal "377251X563X6914CSA4", precision: 30, scale: 10
    t.decimal "377251X563X6914CSA5", precision: 30, scale: 10
    t.decimal "377251X563X6914CSA6", precision: 30, scale: 10
    t.decimal "377251X563X6914CSA7", precision: 30, scale: 10
    t.decimal "377251X563X6915FinalBlock1", precision: 30, scale: 10
    t.decimal "377251X563X6916", precision: 30, scale: 10
    t.decimal "377251X563X6919OSCE", precision: 30, scale: 10
    t.decimal "377251X563X6919Anatomy", precision: 30, scale: 10
    t.decimal "377251X563X6919Histology", precision: 30, scale: 10
    t.decimal "377251X563X6919Micro", precision: 30, scale: 10
    t.decimal "377251X563X6919ClinicalSkill", precision: 30, scale: 10
    t.decimal "377251X563X6917Component1", precision: 30, scale: 10
    t.decimal "377251X563X6917Component2", precision: 30, scale: 10
    t.decimal "377251X563X6917Component3", precision: 30, scale: 10
    t.decimal "377251X563X6917Component4", precision: 30, scale: 10
    t.decimal "377251X563X6917Component5", precision: 30, scale: 10
    t.text "377251X563X6918"
    t.integer "377251X563X6918_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_377251_8448"
  end

  create_table "lime_survey_377817", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "377817X70X1200StudentYear"
    t.text "377817X70X1200StudentEmail"
    t.text "377817X70X1200StudentName"
    t.text "377817X70X1200CoachEmail"
    t.text "377817X70X1200CoachName"
    t.text "377817X71X1201CourseYear"
    t.text "377817X71X1201CourseName"
    t.decimal "377817X71X1202Week1MCQ", precision: 30, scale: 10
    t.decimal "377817X71X1202Week2MCQ", precision: 30, scale: 10
    t.decimal "377817X71X1202Week4MCQ", precision: 30, scale: 10
    t.decimal "377817X71X1202Week5MCQ", precision: 30, scale: 10
    t.decimal "377817X71X1202Week6MCQ", precision: 30, scale: 10
    t.decimal "377817X71X1202Week8MCQ", precision: 30, scale: 10
    t.decimal "377817X71X1202Week9MCQ", precision: 30, scale: 10
    t.decimal "377817X71X1202Week10MCQ", precision: 30, scale: 10
    t.text "377817X71X1203DroppedQuiz"
    t.text "377817X71X1203DroppedScore"
    t.decimal "377817X71X1204FOMA", precision: 30, scale: 10
    t.decimal "377817X71X1204CSA7", precision: 30, scale: 10
    t.decimal "377817X71X1204CSA8", precision: 30, scale: 10
    t.decimal "377817X71X1204CSA9", precision: 30, scale: 10
    t.decimal "377817X71X1204CSA10", precision: 30, scale: 10
    t.decimal "377817X71X1204CSA11", precision: 30, scale: 10
    t.decimal "377817X71X1204CSA12", precision: 30, scale: 10
    t.decimal "377817X71X1205FinalBlockCardiac", precision: 30, scale: 10
    t.decimal "377817X71X1205FinalBlockRenal", precision: 30, scale: 10
    t.decimal "377817X71X1205FinalBlockPulmonary", precision: 30, scale: 10
    t.decimal "377817X71X1206", precision: 30, scale: 10
    t.decimal "377817X71X1207OSCE", precision: 30, scale: 10
    t.decimal "377817X71X1207Histology", precision: 30, scale: 10
    t.decimal "377817X71X1207Pathology", precision: 30, scale: 10
    t.decimal "377817X71X1207Microbiology", precision: 30, scale: 10
    t.decimal "377817X71X1208Component1", precision: 30, scale: 10
    t.decimal "377817X71X1208Component2", precision: 30, scale: 10
    t.decimal "377817X71X1208Component3", precision: 30, scale: 10
    t.decimal "377817X71X1208Component4", precision: 30, scale: 10
    t.decimal "377817X71X1208Component5", precision: 30, scale: 10
    t.text "377817X71X1450"
    t.integer "377817X71X1450_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_377817_27181"
  end

  create_table "lime_survey_379942", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "379942X355X4021StudentYear"
    t.text "379942X355X4021StudentEmail"
    t.text "379942X355X4021StudentName"
    t.text "379942X355X4021CoachEmail"
    t.text "379942X355X4021CoachName"
    t.text "379942X357X4031Comp1"
    t.text "379942X357X4031Comp2"
    t.text "379942X357X4031Comp3"
    t.text "379942X357X4031Comp4"
    t.text "379942X357X4031Comp5"
    t.text "379942X357X4031Final"
    t.text "379942X358X4032SQ001_SQ001"
    t.text "379942X358X4032SQ001_SQ002"
    t.text "379942X358X4032SQ001_SQ003"
    t.text "379942X358X4032SQ002_SQ001"
    t.text "379942X358X4032SQ002_SQ002"
    t.text "379942X358X4032SQ002_SQ003"
    t.text "379942X358X4032SQ003_SQ001"
    t.text "379942X358X4032SQ003_SQ002"
    t.text "379942X358X4032SQ003_SQ003"
    t.text "379942X358X4032SQ004_SQ001"
    t.text "379942X358X4032SQ004_SQ002"
    t.text "379942X358X4032SQ004_SQ003"
    t.text "379942X356X4022CourseYear"
    t.text "379942X356X4022CourseName"
    t.decimal "379942X356X4023Week1MCQ", precision: 30, scale: 10
    t.decimal "379942X356X4023Week2MCQ", precision: 30, scale: 10
    t.decimal "379942X356X4023Week3MCQ", precision: 30, scale: 10
    t.decimal "379942X356X4023Week4MCQ", precision: 30, scale: 10
    t.decimal "379942X356X4023Week5MCQ", precision: 30, scale: 10
    t.decimal "379942X356X4023Week6MCQ", precision: 30, scale: 10
    t.decimal "379942X356X4023Week7MCQ", precision: 30, scale: 10
    t.text "379942X356X4024DroppedQuiz"
    t.text "379942X356X4024DroppedScore"
    t.decimal "379942X356X4025CSA1", precision: 30, scale: 10
    t.decimal "379942X356X4025CSA2", precision: 30, scale: 10
    t.decimal "379942X356X4025CSA3", precision: 30, scale: 10
    t.decimal "379942X356X4025CSA4", precision: 30, scale: 10
    t.decimal "379942X356X4025CSA5", precision: 30, scale: 10
    t.decimal "379942X356X4025CSA6", precision: 30, scale: 10
    t.decimal "379942X356X4025CSA7", precision: 30, scale: 10
    t.decimal "379942X356X4025CSA8", precision: 30, scale: 10
    t.decimal "379942X356X4025CSA9", precision: 30, scale: 10
    t.decimal "379942X356X4026FinalBlock", precision: 30, scale: 10
    t.decimal "379942X356X4027", precision: 30, scale: 10
    t.decimal "379942X356X4028OSCE", precision: 30, scale: 10
    t.decimal "379942X356X4028Genetics", precision: 30, scale: 10
    t.decimal "379942X356X4028CellBiology", precision: 30, scale: 10
    t.decimal "379942X356X4028Informatics", precision: 30, scale: 10
    t.decimal "379942X356X4029Component1", precision: 30, scale: 10
    t.decimal "379942X356X4029Component2", precision: 30, scale: 10
    t.decimal "379942X356X4029Component3", precision: 30, scale: 10
    t.decimal "379942X356X4029Component4", precision: 30, scale: 10
    t.decimal "379942X356X4029Component5", precision: 30, scale: 10
    t.text "379942X356X4030"
    t.integer "379942X356X4030_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_379942_19621"
  end

  create_table "lime_survey_387311", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "387311X1414X15172StudentYear"
    t.text "387311X1414X15172StudentEmail"
    t.text "387311X1414X15172StudentName"
    t.text "387311X1414X15172CoachEmail"
    t.text "387311X1414X15172CoachName"
    t.text "387311X1415X15173CourseYear"
    t.text "387311X1415X15173CourseName"
    t.decimal "387311X1415X15174Week1MCQ", precision: 30, scale: 10
    t.decimal "387311X1415X15174Week2MCQ", precision: 30, scale: 10
    t.decimal "387311X1415X15174Week3MCQ", precision: 30, scale: 10
    t.decimal "387311X1415X15174Week4MCQ", precision: 30, scale: 10
    t.decimal "387311X1415X15174Week5MCQ", precision: 30, scale: 10
    t.decimal "387311X1415X15174Week6MCQ", precision: 30, scale: 10
    t.text "387311X1415X15175DroppedQuiz"
    t.text "387311X1415X15175DroppedScore"
    t.decimal "387311X1415X15176CSA01", precision: 30, scale: 10
    t.decimal "387311X1415X15176CSA02", precision: 30, scale: 10
    t.decimal "387311X1415X15176CSA03", precision: 30, scale: 10
    t.decimal "387311X1415X15176CSA04", precision: 30, scale: 10
    t.decimal "387311X1415X15176CSA05", precision: 30, scale: 10
    t.decimal "387311X1415X15176CSA06", precision: 30, scale: 10
    t.decimal "387311X1415X15176CSA07", precision: 30, scale: 10
    t.decimal "387311X1415X15176CSA08", precision: 30, scale: 10
    t.decimal "387311X1415X15176CSA09", precision: 30, scale: 10
    t.decimal "387311X1415X15176CSA10", precision: 30, scale: 10
    t.decimal "387311X1415X15176CSA11", precision: 30, scale: 10
    t.decimal "387311X1415X15176CSA12", precision: 30, scale: 10
    t.decimal "387311X1415X15177FinalBlock1", precision: 30, scale: 10
    t.decimal "387311X1415X15178NBME", precision: 30, scale: 10
    t.decimal "387311X1415X15179Anat", precision: 30, scale: 10
    t.decimal "387311X1415X15179RepBio", precision: 30, scale: 10
    t.decimal "387311X1415X15179HistoPath", precision: 30, scale: 10
    t.decimal "387311X1415X15179Micro", precision: 30, scale: 10
    t.decimal "387311X1415X15179Infor", precision: 30, scale: 10
    t.decimal "387311X1415X15179OSCE", precision: 30, scale: 10
    t.decimal "387311X1415X15180Component1", precision: 30, scale: 10
    t.decimal "387311X1415X15180Component2", precision: 30, scale: 10
    t.decimal "387311X1415X15180Component3", precision: 30, scale: 10
    t.decimal "387311X1415X15180Component4", precision: 30, scale: 10
    t.decimal "387311X1415X15180Component5", precision: 30, scale: 10
    t.text "387311X1415X15181"
    t.integer "387311X1415X15181_filecount"
    t.index ["token"], name: "idx_survey_token_387311_1342"
  end

  create_table "lime_survey_387554", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "387554X1314X14222"
    t.string "387554X1312X14224", limit: 5
    t.text "387554X1312X14224other"
    t.string "387554X1312X14225", limit: 5
    t.text "387554X1312X14225other"
    t.text "387554X1312X14216"
    t.text "387554X1312X14215"
    t.text "387554X1312X14217"
    t.string "387554X1312X14218", limit: 1
    t.text "387554X1312X14219"
    t.text "387554X1312X14226"
    t.text "387554X1312X14220"
    t.string "387554X1313X14221SQ001", limit: 5
    t.string "387554X1313X14221SQ002", limit: 5
    t.string "387554X1313X14221SQ003", limit: 5
    t.string "387554X1313X14221SQ004", limit: 5
    t.string "387554X1313X14221SQ005", limit: 5
    t.string "387554X1313X14221SQ006", limit: 5
    t.string "387554X1313X14221SQ007", limit: 5
    t.string "387554X1313X14221SQ008", limit: 5
    t.string "387554X1313X14221SQ009", limit: 5
    t.string "387554X1313X14221SQ010", limit: 5
    t.string "387554X1313X14221SQ011", limit: 5
    t.text "387554X1315X14223StudentYear"
    t.text "387554X1315X14223StudentEmail"
    t.text "387554X1315X14223StudentName"
    t.text "387554X1315X14223CoachEmail"
    t.text "387554X1315X14223CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_387554_27673"
  end

  create_table "lime_survey_387554_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "387554X1314time"
    t.float "387554X1314X14222time"
    t.float "387554X1312time"
    t.float "387554X1312X14224time"
    t.float "387554X1312X14225time"
    t.float "387554X1312X14216time"
    t.float "387554X1312X14215time"
    t.float "387554X1312X14217time"
    t.float "387554X1312X14218time"
    t.float "387554X1312X14219time"
    t.float "387554X1312X14226time"
    t.float "387554X1312X14220time"
    t.float "387554X1313time"
    t.float "387554X1313X14221time"
    t.float "387554X1315time"
    t.float "387554X1315X14223time"
  end

  create_table "lime_survey_388285", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "388285X727X8744StudentYear"
    t.text "388285X727X8744StudentID"
    t.text "388285X727X8744MedhubID"
    t.text "388285X727X8744StudentEmail"
    t.text "388285X727X8744StudentName"
    t.text "388285X727X8744CoachEmail"
    t.text "388285X727X8744CoachName"
    t.text "388285X729X8746CourseName"
    t.text "388285X729X8746CourseID"
    t.text "388285X729X8746StartDt"
    t.text "388285X729X8746EndDt"
    t.text "388285X729X8746SubmitDt"
    t.text "388285X729X8746Eval"
    t.text "388285X729X8746FinalGrade"
    t.text "388285X729X8746Env"
    t.text "388285X730X8747ProfConcerns"
    t.text "388285X730X8747CommProfConcerns"
    t.text "388285X730X8747OverSummCommPerf"
    t.text "388285X730X8747AddCommOnPerform"
    t.text "388285X730X8747MSPE"
    t.text "388285X730X8747OptClinicExpComm"
    t.text "388285X730X8747Feedback"
    t.text "388285X728X8745ICS1"
    t.text "388285X728X8745ICS2"
    t.text "388285X728X8745ICS3"
    t.text "388285X728X8745ICS4"
    t.text "388285X728X8745ICS5"
    t.text "388285X728X8745ICS6"
    t.text "388285X728X8745ICS7"
    t.text "388285X728X8745ICS8"
    t.text "388285X728X8745MK1"
    t.text "388285X728X8745MK2"
    t.text "388285X728X8745MK3"
    t.text "388285X728X8745MK4"
    t.text "388285X728X8745MK5"
    t.text "388285X728X8745PBLI1"
    t.text "388285X728X8745PBLI2"
    t.text "388285X728X8745PBLI3"
    t.text "388285X728X8745PBLI4"
    t.text "388285X728X8745PBLI5"
    t.text "388285X728X8745PBLI6"
    t.text "388285X728X8745PBLI7"
    t.text "388285X728X8745PBLI8"
    t.text "388285X728X8745PCP1"
    t.text "388285X728X8745PCP2"
    t.text "388285X728X8745PCP3"
    t.text "388285X728X8745PCP4"
    t.text "388285X728X8745PCP5"
    t.text "388285X728X8745PCP6"
    t.text "388285X728X8745PPPD01"
    t.text "388285X728X8745PPPD02"
    t.text "388285X728X8745PPPD03"
    t.text "388285X728X8745PPPD04"
    t.text "388285X728X8745PPPD05"
    t.text "388285X728X8745PPPD06"
    t.text "388285X728X8745PPPD07"
    t.text "388285X728X8745PPPD08"
    t.text "388285X728X8745PPPD09"
    t.text "388285X728X8745PPPD10"
    t.text "388285X728X8745PPPD11"
    t.text "388285X728X8745SBPIC1"
    t.text "388285X728X8745SBPIC2"
    t.text "388285X728X8745SBPIC3"
    t.text "388285X728X8745SBPIC4"
    t.text "388285X728X8745SBPIC5"
    t.string "seed", limit: 31
    t.index ["388285X727X8744StudentEmail", "id"], name: "idx_lime_survey_388285_student_email"
    t.index ["token"], name: "idx_survey_token_388285_8887"
  end

  create_table "lime_survey_394338", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "394338X295X3530StudentYear"
    t.text "394338X295X3530StudentEmail"
    t.text "394338X295X3530StudentName"
    t.text "394338X295X3530CoachEmail"
    t.text "394338X295X3530CoachName"
    t.text "394338X296X3531CourseYear"
    t.text "394338X296X3531CourseName"
    t.decimal "394338X296X3532Week1MCQ", precision: 30, scale: 10
    t.decimal "394338X296X3532Week2MCQ", precision: 30, scale: 10
    t.decimal "394338X296X3532Week3MCQ", precision: 30, scale: 10
    t.decimal "394338X296X3532Week4MCQ", precision: 30, scale: 10
    t.decimal "394338X296X3532Week5MCQ", precision: 30, scale: 10
    t.decimal "394338X296X3532Week6MCQ", precision: 30, scale: 10
    t.decimal "394338X296X3532Week7MCQ", precision: 30, scale: 10
    t.decimal "394338X296X3532Week8MCQ", precision: 30, scale: 10
    t.decimal "394338X296X3532Week9MCQ", precision: 30, scale: 10
    t.decimal "394338X296X3532Week10MCQ", precision: 30, scale: 10
    t.decimal "394338X296X3532Week11MCQ", precision: 30, scale: 10
    t.text "394338X296X3533DroppedQuiz"
    t.text "394338X296X3533DroppedScore"
    t.decimal "394338X296X3534CSA1", precision: 30, scale: 10
    t.decimal "394338X296X3534CSA2", precision: 30, scale: 10
    t.decimal "394338X296X3534CSA3", precision: 30, scale: 10
    t.decimal "394338X296X3534CSA4", precision: 30, scale: 10
    t.decimal "394338X296X3534CSA5", precision: 30, scale: 10
    t.decimal "394338X296X3534CSA6", precision: 30, scale: 10
    t.decimal "394338X296X3534CSA7", precision: 30, scale: 10
    t.decimal "394338X296X3535FinalBlockCardiac", precision: 30, scale: 10
    t.decimal "394338X296X3535FinalBlockRenal", precision: 30, scale: 10
    t.decimal "394338X296X3535FinalBlockPulmonary", precision: 30, scale: 10
    t.decimal "394338X296X3536", precision: 30, scale: 10
    t.decimal "394338X296X3582Histo1", precision: 30, scale: 10
    t.decimal "394338X296X3582Histo2", precision: 30, scale: 10
    t.decimal "394338X296X3582Histo3", precision: 30, scale: 10
    t.decimal "394338X296X3582Path1", precision: 30, scale: 10
    t.decimal "394338X296X3582Path2", precision: 30, scale: 10
    t.decimal "394338X296X3537Histo", precision: 30, scale: 10
    t.decimal "394338X296X3537Path", precision: 30, scale: 10
    t.decimal "394338X296X3537OSCE", precision: 30, scale: 10
    t.decimal "394338X296X3537Anatomy", precision: 30, scale: 10
    t.decimal "394338X296X3537Micro", precision: 30, scale: 10
    t.decimal "394338X296X3537BChem", precision: 30, scale: 10
    t.decimal "394338X296X3538Component1", precision: 30, scale: 10
    t.decimal "394338X296X3538Component2", precision: 30, scale: 10
    t.decimal "394338X296X3538Component3", precision: 30, scale: 10
    t.decimal "394338X296X3538Component4", precision: 30, scale: 10
    t.decimal "394338X296X3538Component5", precision: 30, scale: 10
    t.text "394338X296X3539"
    t.integer "394338X296X3539_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_394338_34262"
  end

  create_table "lime_survey_394961", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "394961X349X3954StudentYear"
    t.text "394961X349X3954StudentEmail"
    t.text "394961X349X3954StudentName"
    t.text "394961X349X3954CoachEmail"
    t.text "394961X349X3954CoachName"
    t.decimal "394961X350X3960", precision: 30, scale: 10
    t.string "394961X282X3380SQ1", limit: 5
    t.string "394961X282X3380SQ2", limit: 5
    t.string "394961X282X3380SQ3", limit: 5
    t.string "394961X282X3380SQ4", limit: 5
    t.string "394961X282X3380SQ5", limit: 5
    t.string "394961X282X3380SQ6", limit: 5
    t.string "394961X282X3380SQ7", limit: 5
    t.string "394961X282X3380SQ8", limit: 5
    t.string "394961X282X3380SQ9", limit: 5
    t.string "394961X282X3380SQ10", limit: 5
    t.string "394961X283X3392sq1", limit: 5
    t.string "394961X283X3392sq2", limit: 5
    t.string "394961X284X3396sq1", limit: 5
    t.string "394961X284X3396sq2", limit: 5
    t.string "394961X284X3396sq3", limit: 5
    t.string "394961X285X3401sq1", limit: 5
    t.string "394961X285X3401sq2", limit: 5
    t.string "394961X285X3401sq3", limit: 5
    t.string "394961X286X3406sq1", limit: 5
    t.string "394961X286X3406sq2", limit: 5
    t.string "394961X287X34101", limit: 5
    t.string "394961X287X34102", limit: 5
    t.string "394961X287X34103", limit: 5
    t.text "394961X288X3415"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_394961_14791"
  end

  create_table "lime_survey_395824", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "395824X397X4319StudentYear"
    t.text "395824X397X4319StudentEmail"
    t.text "395824X397X4319StudentName"
    t.text "395824X397X4319CoachEmail"
    t.text "395824X397X4319CoachName"
    t.text "395824X396X4317InterComp1"
    t.text "395824X396X4317InterComp2"
    t.text "395824X396X4317InterComp3"
    t.text "395824X396X4317InterComp4"
    t.text "395824X396X4317InterFinal"
    t.decimal "395824X396X4318", precision: 30, scale: 10
    t.text "395824X398X4320Level1"
    t.text "395824X398X4320Level2"
    t.text "395824X398X4320Level3"
    t.text "395824X398X4320Total"
    t.text "395824X398X4321ICS3"
    t.text "395824X398X4322SBPIC4"
    t.text "395824X398X4323MK1"
    t.text "395824X398X4323MK2"
    t.text "395824X398X4323MK3"
    t.text "395824X398X4323MK5"
    t.text "395824X398X4323PBLI1"
    t.text "395824X398X4323PBLI2"
    t.text "395824X398X4323PBLI4"
    t.text "395824X398X4323PPPD7"
    t.text "395824X398X4323PPPD8"
    t.text "395824X398X4323SBPIC2"
    t.text "395824X398X4323SBPIC4"
    t.text "395824X398X4323ICS3"
    t.text "395824X399X4324"
    t.integer "395824X399X4324_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_395824_44826"
  end

  create_table "lime_survey_397638", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "397638X1420X15314StudentYear"
    t.text "397638X1420X15314StudentEmail"
    t.text "397638X1420X15314StudentName"
    t.text "397638X1420X15314CoachEmail"
    t.text "397638X1420X15314CoachName"
    t.text "397638X1421X15315CourseYear"
    t.text "397638X1421X15315CourseName"
    t.decimal "397638X1421X15316Week1MCQ", precision: 30, scale: 10
    t.decimal "397638X1421X15316Week2MCQ", precision: 30, scale: 10
    t.decimal "397638X1421X15316Week3MCQ", precision: 30, scale: 10
    t.decimal "397638X1421X15316Week4MCQ", precision: 30, scale: 10
    t.decimal "397638X1421X15316Week5MCQ", precision: 30, scale: 10
    t.decimal "397638X1421X15316MCQAve", precision: 30, scale: 10
    t.text "397638X1421X15317DroppedQuiz"
    t.text "397638X1421X15317DroppedScore"
    t.decimal "397638X1421X15318CSA01", precision: 30, scale: 10
    t.decimal "397638X1421X15318CSA02", precision: 30, scale: 10
    t.decimal "397638X1421X15318HSS1EPI", precision: 30, scale: 10
    t.decimal "397638X1421X15318HSS2Infor", precision: 30, scale: 10
    t.decimal "397638X1421X15318HSSAve", precision: 30, scale: 10
    t.decimal "397638X1421X15324BSS1AnatPB", precision: 30, scale: 10
    t.decimal "397638X1421X15324BSS2AnatPL1", precision: 30, scale: 10
    t.decimal "397638X1421X15324BSS3AnatPL2", precision: 30, scale: 10
    t.decimal "397638X1421X15324BBSS4AnatLab1", precision: 30, scale: 10
    t.decimal "397638X1421X15324BSS5AnatLab2", precision: 30, scale: 10
    t.decimal "397638X1421X15324BSS6AnatPL3", precision: 30, scale: 10
    t.decimal "397638X1421X15324BSS7Histo", precision: 30, scale: 10
    t.decimal "397638X1421X15324BSS8AnatLab3", precision: 30, scale: 10
    t.decimal "397638X1421X15324BSSAvg", precision: 30, scale: 10
    t.decimal "397638X1421X15319FinalSBM", precision: 30, scale: 10
    t.decimal "397638X1421X15320NBME", precision: 30, scale: 10
    t.decimal "397638X1421X15321HSSOSCE", precision: 30, scale: 10
    t.decimal "397638X1421X15321HSSVD", precision: 30, scale: 10
    t.decimal "397638X1421X15321HSSAvg", precision: 30, scale: 10
    t.decimal "397638X1421X15325BSSHisto", precision: 30, scale: 10
    t.decimal "397638X1421X15325BSSCellBio", precision: 30, scale: 10
    t.decimal "397638X1421X15325BSSMicro", precision: 30, scale: 10
    t.decimal "397638X1421X15325BSSAnat", precision: 30, scale: 10
    t.decimal "397638X1421X15325BSSAvg", precision: 30, scale: 10
    t.decimal "397638X1421X15322Component1", precision: 30, scale: 10
    t.decimal "397638X1421X15322Component2A", precision: 30, scale: 10
    t.decimal "397638X1421X15322Component2B", precision: 30, scale: 10
    t.decimal "397638X1421X15322Component3", precision: 30, scale: 10
    t.decimal "397638X1421X15322Component4", precision: 30, scale: 10
    t.decimal "397638X1421X15322Component5A", precision: 30, scale: 10
    t.decimal "397638X1421X15322Component5B", precision: 30, scale: 10
    t.text "397638X1421X15323"
    t.integer "397638X1421X15323_filecount"
    t.index ["token"], name: "idx_survey_token_397638_44146"
  end

  create_table "lime_survey_397785", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "397785X829X9433"
    t.text "397785X829X9436"
    t.string "397785X832X9437", limit: 5
    t.text "397785X832X9438"
    t.text "397785X832X9432StudentYear"
    t.text "397785X832X9432StudentEmail"
    t.text "397785X832X9432StudentName"
    t.text "397785X832X9432CoachEmail"
    t.text "397785X832X9432CoachName"
    t.string "397785X830X9434C1", limit: 5
    t.string "397785X830X9434C2", limit: 5
    t.string "397785X830X9434C3", limit: 5
    t.string "397785X830X9434C4", limit: 5
    t.string "397785X830X9434C5", limit: 5
    t.string "397785X830X9434C6", limit: 5
    t.string "397785X830X9434C7", limit: 5
    t.string "397785X830X9434C8", limit: 5
    t.string "397785X830X9434C9", limit: 5
    t.text "397785X831X9435"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_397785_30030"
  end

  create_table "lime_survey_398373", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "398373X890X10092StudentYear"
    t.text "398373X890X10092StudentEmail"
    t.text "398373X890X10092StudentName"
    t.text "398373X890X10092CoachEmail"
    t.text "398373X890X10092CoachName"
    t.text "398373X890X10092Course"
    t.decimal "398373X890X10093FUND", precision: 30, scale: 10
    t.decimal "398373X890X10093BLHD", precision: 30, scale: 10
    t.decimal "398373X890X10093SBM", precision: 30, scale: 10
    t.decimal "398373X890X10093CPR", precision: 30, scale: 10
    t.decimal "398373X890X10093HODI", precision: 30, scale: 10
    t.decimal "398373X890X10093NSF", precision: 30, scale: 10
    t.decimal "398373X890X10093DEVH", precision: 30, scale: 10
    t.decimal "398373X890X10094FUND", precision: 30, scale: 10
    t.decimal "398373X890X10094BLHD", precision: 30, scale: 10
    t.decimal "398373X890X10094SBM", precision: 30, scale: 10
    t.decimal "398373X890X10094CPR", precision: 30, scale: 10
    t.decimal "398373X890X10094HODI", precision: 30, scale: 10
    t.decimal "398373X890X10094NSF", precision: 30, scale: 10
    t.decimal "398373X890X10094DEVH", precision: 30, scale: 10
    t.decimal "398373X890X10095FUND", precision: 30, scale: 10
    t.decimal "398373X890X10095BLHD", precision: 30, scale: 10
    t.decimal "398373X890X10095SBM", precision: 30, scale: 10
    t.decimal "398373X890X10095CPR", precision: 30, scale: 10
    t.decimal "398373X890X10095HODI", precision: 30, scale: 10
    t.decimal "398373X890X10095NSF", precision: 30, scale: 10
    t.decimal "398373X890X10095DEVH", precision: 30, scale: 10
    t.decimal "398373X890X10096FUND", precision: 30, scale: 10
    t.decimal "398373X890X10096BLHD", precision: 30, scale: 10
    t.decimal "398373X890X10096SBM", precision: 30, scale: 10
    t.decimal "398373X890X10096CPR", precision: 30, scale: 10
    t.decimal "398373X890X10096HODI", precision: 30, scale: 10
    t.decimal "398373X890X10096NSF", precision: 30, scale: 10
    t.decimal "398373X890X10096DEVH", precision: 30, scale: 10
    t.decimal "398373X890X10097FUND", precision: 30, scale: 10
    t.decimal "398373X890X10097BLHD", precision: 30, scale: 10
    t.decimal "398373X890X10097SBM", precision: 30, scale: 10
    t.decimal "398373X890X10097CPR", precision: 30, scale: 10
    t.decimal "398373X890X10097HODI", precision: 30, scale: 10
    t.decimal "398373X890X10097NSF", precision: 30, scale: 10
    t.decimal "398373X890X10097DEVH", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_398373_39962"
  end

  create_table "lime_survey_398458", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "398458X1123X13223StudentYear"
    t.text "398458X1123X13223StudentEmail"
    t.text "398458X1123X13223StudentName"
    t.text "398458X1123X13223CoachEmail"
    t.text "398458X1123X13223CoachName"
    t.text "398458X1124X13226Step1PassFail"
    t.text "398458X1124X13226Step1ExamScore"
    t.text "398458X1124X13226Step1ExamDT"
    t.text "398458X1124X13226RetestPF"
    t.text "398458X1124X13226RetestExamScore"
    t.text "398458X1124X13226RetestExamDt"
    t.text "398458X1125X13224CKPassFail"
    t.text "398458X1125X13224CKExam"
    t.text "398458X1125X13224CKDT"
    t.text "398458X1125X13224CKPFRetest"
    t.text "398458X1125X13224CKExamRetest"
    t.text "398458X1125X13224CKDTRetest"
    t.text "398458X1126X13225CSExam"
    t.text "398458X1126X13225CSDT"
    t.text "398458X1126X13225CSExamRetest"
    t.text "398458X1126X13225CSDTRetest"
    t.index ["token"], name: "idx_survey_token_398458_45462"
  end

  create_table "lime_survey_421869", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "421869X1401X15065StudentYear"
    t.text "421869X1401X15065StudentEmail"
    t.text "421869X1401X15065StudentName"
    t.text "421869X1401X15065CoachEmail"
    t.text "421869X1401X15065CoachName"
    t.text "421869X1401X15065Course"
    t.decimal "421869X1401X15066FUND", precision: 30, scale: 10
    t.decimal "421869X1401X15066BLHD", precision: 30, scale: 10
    t.decimal "421869X1401X15066SBM", precision: 30, scale: 10
    t.decimal "421869X1401X15066CPR", precision: 30, scale: 10
    t.decimal "421869X1401X15066HODI", precision: 30, scale: 10
    t.decimal "421869X1401X15066NSF", precision: 30, scale: 10
    t.decimal "421869X1401X15066DEVH", precision: 30, scale: 10
    t.decimal "421869X1401X15067FUNDHSS", precision: 30, scale: 10
    t.decimal "421869X1401X15067FUNDBSS", precision: 30, scale: 10
    t.decimal "421869X1401X15067BLHDHSS", precision: 30, scale: 10
    t.decimal "421869X1401X15067BLHDBSS", precision: 30, scale: 10
    t.decimal "421869X1401X15067SBMHSS", precision: 30, scale: 10
    t.decimal "421869X1401X15067SBMBSS", precision: 30, scale: 10
    t.decimal "421869X1401X15067CPRHSS", precision: 30, scale: 10
    t.decimal "421869X1401X15067CPRBSS", precision: 30, scale: 10
    t.decimal "421869X1401X15067HODIHSS", precision: 30, scale: 10
    t.decimal "421869X1401X15067HODIBSS", precision: 30, scale: 10
    t.decimal "421869X1401X15067NSFHSS", precision: 30, scale: 10
    t.decimal "421869X1401X15067NSFBSS", precision: 30, scale: 10
    t.decimal "421869X1401X15067DEVHHSS", precision: 30, scale: 10
    t.decimal "421869X1401X15067DEVHBSS", precision: 30, scale: 10
    t.decimal "421869X1401X15068FUND", precision: 30, scale: 10
    t.decimal "421869X1401X15068BLHD", precision: 30, scale: 10
    t.decimal "421869X1401X15068SBM", precision: 30, scale: 10
    t.decimal "421869X1401X15068CPR", precision: 30, scale: 10
    t.decimal "421869X1401X15068HODI", precision: 30, scale: 10
    t.decimal "421869X1401X15068NSF", precision: 30, scale: 10
    t.decimal "421869X1401X15068DEVH", precision: 30, scale: 10
    t.decimal "421869X1401X15069FUND", precision: 30, scale: 10
    t.decimal "421869X1401X15069BLHD", precision: 30, scale: 10
    t.decimal "421869X1401X15069SBM", precision: 30, scale: 10
    t.decimal "421869X1401X15069CPR", precision: 30, scale: 10
    t.decimal "421869X1401X15069HODI", precision: 30, scale: 10
    t.decimal "421869X1401X15069NSF", precision: 30, scale: 10
    t.decimal "421869X1401X15069DEVH", precision: 30, scale: 10
    t.decimal "421869X1401X15070FUNDHSS", precision: 30, scale: 10
    t.decimal "421869X1401X15070FUNDBSS", precision: 30, scale: 10
    t.decimal "421869X1401X15070BLHDHSS", precision: 30, scale: 10
    t.decimal "421869X1401X15070BLHDBSS", precision: 30, scale: 10
    t.decimal "421869X1401X15070SBMHSS", precision: 30, scale: 10
    t.decimal "421869X1401X15070SBMBSS", precision: 30, scale: 10
    t.decimal "421869X1401X15070CPRHSS", precision: 30, scale: 10
    t.decimal "421869X1401X15070CPRBSS", precision: 30, scale: 10
    t.decimal "421869X1401X15070HODIHSS", precision: 30, scale: 10
    t.decimal "421869X1401X15070HODIBSS", precision: 30, scale: 10
    t.decimal "421869X1401X15070NSFHSS", precision: 30, scale: 10
    t.decimal "421869X1401X15070NSFBSS", precision: 30, scale: 10
    t.decimal "421869X1401X15070DEVHHSS", precision: 30, scale: 10
    t.decimal "421869X1401X15070DEVHBSS", precision: 30, scale: 10
    t.index ["token"], name: "idx_survey_token_421869_37721"
  end

  create_table "lime_survey_425411", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "425411X891X10140"
    t.text "425411X891X10143"
    t.string "425411X894X10144", limit: 5
    t.text "425411X894X10145"
    t.text "425411X894X10139StudentYear"
    t.text "425411X894X10139StudentEmail"
    t.text "425411X894X10139StudentName"
    t.text "425411X894X10139CoachEmail"
    t.text "425411X894X10139CoachName"
    t.string "425411X892X10141C1", limit: 5
    t.string "425411X892X10141C2", limit: 5
    t.string "425411X892X10141C3", limit: 5
    t.string "425411X892X10141C4", limit: 5
    t.string "425411X892X10141C5", limit: 5
    t.string "425411X892X10141C6", limit: 5
    t.string "425411X892X10141C7", limit: 5
    t.string "425411X892X10141C8", limit: 5
    t.string "425411X892X10141C9", limit: 5
    t.text "425411X893X10142"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_425411_1939"
  end

  create_table "lime_survey_427934", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "427934X82X1344", limit: 255
    t.string "427934X82X1343SQ001", limit: 5
    t.string "427934X82X1343SQ002", limit: 5
    t.string "427934X82X1343SQ003", limit: 5
    t.string "427934X82X1343SQ004", limit: 5
    t.string "427934X82X1343SQ005", limit: 5
    t.string "427934X82X1343SQ006", limit: 5
    t.string "427934X82X1343SQ007", limit: 5
    t.string "427934X82X1343SQ008", limit: 5
    t.string "427934X82X1343SQ009", limit: 5
    t.string "427934X82X1343SQ010", limit: 5
    t.string "427934X82X1343SQ011", limit: 5
    t.string "427934X82X1343SQ012", limit: 5
    t.text "427934X135X2113StudentYear"
    t.text "427934X135X2113StudentEmail"
    t.text "427934X135X2113StudentName"
    t.text "427934X135X2113CoachEmail"
    t.text "427934X135X2113CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_427934_39520"
  end

  create_table "lime_survey_427934_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "427934X82time"
    t.float "427934X82X1344time"
    t.float "427934X82X1343time"
    t.float "427934X135time"
    t.float "427934X135X2113time"
  end

  create_table "lime_survey_429836", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "429836X1174X13444SQ001", limit: 5
    t.string "429836X1174X13444SQ002", limit: 5
    t.string "429836X1174X13444SQ003", limit: 5
    t.string "429836X1174X13444SQ004", limit: 5
    t.string "429836X1174X13444SQ005", limit: 5
    t.string "429836X1174X13444SQ006", limit: 5
    t.string "429836X1174X13444SQ007", limit: 5
    t.string "429836X1174X13444SQ008", limit: 5
    t.string "429836X1174X13444SQ009", limit: 5
    t.string "429836X1174X13444SQ010", limit: 5
    t.string "429836X1174X13444SQ011", limit: 5
    t.string "429836X1174X13444SQ012", limit: 5
    t.string "429836X1174X13444SQ013", limit: 5
    t.string "429836X1174X13444SQ014", limit: 5
    t.string "429836X1175X13459SQ001", limit: 5
    t.string "429836X1175X13459SQ002", limit: 5
    t.string "429836X1175X13459SQ003", limit: 5
    t.string "429836X1175X13459SQ004", limit: 5
    t.text "429836X1176X13464"
    t.string "429836X1301X14138SQ001", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_429836_28841"
  end

  create_table "lime_survey_435562", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "435562X1190X14145SQ001", limit: 5
    t.string "435562X1190X13523SQ001", limit: 5
    t.string "435562X1190X13523SQ003", limit: 5
    t.string "435562X1190X13523SQ002", limit: 5
    t.string "435562X1191X13524SQ001", limit: 5
    t.string "435562X1191X13524SQ002", limit: 5
    t.string "435562X1191X13524SQ003", limit: 5
    t.string "435562X1191X13524SQ004", limit: 5
    t.string "435562X1191X13524SQ005", limit: 5
    t.string "435562X1191X13524SQ006", limit: 5
    t.string "435562X1191X13524SQ007", limit: 5
    t.string "435562X1192X13525SQ001", limit: 5
    t.text "435562X1193X13526"
    t.text "435562X1193X13527"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_435562_9403"
  end

  create_table "lime_survey_435624", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "435624X663X8074"
    t.text "435624X663X8077"
    t.string "435624X666X8078", limit: 5
    t.text "435624X666X8079"
    t.string "435624X664X8075C1", limit: 5
    t.string "435624X664X8075C2", limit: 5
    t.string "435624X664X8075C3", limit: 5
    t.string "435624X664X8075C4", limit: 5
    t.string "435624X664X8075C5", limit: 5
    t.string "435624X664X8075C6", limit: 5
    t.string "435624X664X8075C7", limit: 5
    t.string "435624X664X8075C8", limit: 5
    t.string "435624X664X8075C9", limit: 5
    t.text "435624X665X8076"
    t.text "435624X667X8094StudentYear"
    t.text "435624X667X8094StudentEmail"
    t.text "435624X667X8094StudentName"
    t.text "435624X667X8094CoachEmail"
    t.text "435624X667X8094CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_435624_38597"
  end

  create_table "lime_survey_437763", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "437763X266X3240"
    t.text "437763X266X3241"
    t.text "437763X266X3247"
    t.text "437763X266X3248"
    t.text "437763X266X3249"
    t.text "437763X266X3250"
    t.string "437763X267X3242Clarify", limit: 5
    t.string "437763X267X3242Represents", limit: 5
    t.string "437763X267X3242Responsible", limit: 5
    t.string "437763X267X3242Inspire", limit: 5
    t.string "437763X267X3242Determine", limit: 5
    t.string "437763X267X3242Active", limit: 5
    t.string "437763X267X3242Honest", limit: 5
    t.string "437763X268X3243SeekAndHear", limit: 5
    t.string "437763X268X3243LearnAbout", limit: 5
    t.string "437763X268X3243AcceptAny", limit: 5
    t.string "437763X268X3243DevelopAShared", limit: 5
    t.string "437763X268X3243SpecificMeasurable", limit: 5
    t.string "437763X268X3243WorkWithYourCoach", limit: 5
    t.string "437763X268X3243DetermineTimelines", limit: 5
    t.string "437763X268X3243MonitorYourProgress", limit: 5
    t.string "437763X268X3243IdentifyProblems", limit: 5
    t.string "437763X268X3243SolveProblems", limit: 5
    t.string "437763X268X3243Characterize", limit: 5
    t.string "437763X269X3244RecognizePersFeeling", limit: 5
    t.string "437763X269X3244AwareOfEmotions", limit: 5
    t.string "437763X269X3244InvestigateBehavior", limit: 5
    t.string "437763X269X3244PayAttention", limit: 5
    t.string "437763X269X3244MyThinkingHabits", limit: 5
    t.string "437763X269X3244TrustingRelationship", limit: 5
    t.string "437763X269X3244SafeLearningEnv", limit: 5
    t.string "437763X269X3244Commitment", limit: 5
    t.string "437763X269X3244Affirms", limit: 5
    t.string "437763X269X3244WillingToAcceptFeedb", limit: 5
    t.string "437763X269X3244esLearningPrStimulat", limit: 5
    t.string "437763X269X3244Encourages", limit: 5
    t.string "437763X269X3244StimulatesProfDevelo", limit: 5
    t.string "437763X269X3244StimulatesConstFeedb", limit: 5
    t.text "437763X270X3245"
    t.text "437763X270X3246"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_437763_19384"
  end

  create_table "lime_survey_437763_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "437763X266time"
    t.float "437763X266X3240time"
    t.float "437763X266X3241time"
    t.float "437763X266X3247time"
    t.float "437763X266X3248time"
    t.float "437763X266X3249time"
    t.float "437763X266X3250time"
    t.float "437763X267time"
    t.float "437763X267X3242time"
    t.float "437763X268time"
    t.float "437763X268X3243time"
    t.float "437763X269time"
    t.float "437763X269X3244time"
    t.float "437763X270time"
    t.float "437763X270X3245time"
    t.float "437763X270X3246time"
  end

  create_table "lime_survey_439977", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "439977X196X2419StudentYear"
    t.text "439977X196X2419StudentEmail"
    t.text "439977X196X2419StudentName"
    t.text "439977X196X2419CoachEmail"
    t.text "439977X196X2419CoachName"
    t.text "439977X197X2420"
    t.integer "439977X197X2420_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_439977_30437"
  end

  create_table "lime_survey_444625", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "444625X78X1291InstructorKnowledge", limit: 5
    t.string "444625X78X1291InstructorWellPrep", limit: 5
    t.string "444625X78X1291InstructorRate", limit: 5
    t.text "444625X78X1292"
    t.text "444625X78X1293"
    t.string "444625X78X1294", limit: 255
    t.string "444625X78X1295", limit: 255
    t.string "444625X78X1296", limit: 255
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_444625_23702"
  end

  create_table "lime_survey_445212", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "445212X938X10470", limit: 5
    t.text "445212X938X10471"
    t.string "445212X935X10464Commit", limit: 5
    t.string "445212X935X10464Responsible", limit: 5
    t.string "445212X935X10464Inspire", limit: 5
    t.string "445212X935X10464Active", limit: 5
    t.string "445212X935X10464Honest", limit: 5
    t.string "445212X936X10465LearnAbout", limit: 5
    t.string "445212X936X10465ConveyAny", limit: 5
    t.string "445212X936X10465DevelopAShared", limit: 5
    t.string "445212X936X10465SpecificMeasurable", limit: 5
    t.string "445212X936X10465WorkWithYourStudent", limit: 5
    t.string "445212X936X10465OrganizeInterpret", limit: 5
    t.string "445212X936X10465MonitorYourProgress", limit: 5
    t.string "445212X936X10465IdentifyProblems", limit: 5
    t.string "445212X936X10465SolveProblems", limit: 5
    t.string "445212X936X10465Characterize", limit: 5
    t.text "445212X937X10466"
    t.text "445212X937X10467"
    t.text "445212X934X10463"
    t.text "445212X934X10469"
    t.text "445212X934X10468"
    t.text "445212X934X10472"
    t.text "445212X934X10473"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_445212_31357"
  end

  create_table "lime_survey_451531", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "451531X1532X16650"
    t.text "451531X1533X16651"
    t.text "451531X1534X16652"
    t.index ["token"], name: "idx_survey_token_451531_49474"
  end

  create_table "lime_survey_454475", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "454475X207X2452"
    t.text "454475X207X2455"
    t.string "454475X210X2456", limit: 5
    t.text "454475X210X2457"
    t.text "454475X210X2451StudentYear"
    t.text "454475X210X2451StudentEmail"
    t.text "454475X210X2451StudentName"
    t.text "454475X210X2451CoachEmail"
    t.text "454475X210X2451CoachName"
    t.string "454475X208X2453C1", limit: 5
    t.string "454475X208X2453C2", limit: 5
    t.string "454475X208X2453C3", limit: 5
    t.string "454475X208X2453C4", limit: 5
    t.string "454475X208X2453C5", limit: 5
    t.string "454475X208X2453C6", limit: 5
    t.string "454475X208X2453C7", limit: 5
    t.string "454475X208X2453C8", limit: 5
    t.string "454475X208X2453C9", limit: 5
    t.text "454475X209X2454"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_454475_32604"
  end

  create_table "lime_survey_457387", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "457387X424X4559StudentYear"
    t.text "457387X424X4559StudentEmail"
    t.text "457387X424X4559StudentName"
    t.text "457387X424X4559CoachEmail"
    t.text "457387X424X4559CoachName"
    t.text "457387X425X4560CourseYear"
    t.text "457387X425X4560CourseName"
    t.decimal "457387X425X4561Week1MCQ", precision: 30, scale: 10
    t.decimal "457387X425X4561Week2MCQ", precision: 30, scale: 10
    t.decimal "457387X425X4561Week3MCQ", precision: 30, scale: 10
    t.decimal "457387X425X4561Week4MCQ", precision: 30, scale: 10
    t.decimal "457387X425X4561Week5MCQ", precision: 30, scale: 10
    t.decimal "457387X425X4561Week6MCQ", precision: 30, scale: 10
    t.decimal "457387X425X4561Week7MCQ", precision: 30, scale: 10
    t.text "457387X425X4562DroppedQuiz"
    t.text "457387X425X4562DroppedScore"
    t.decimal "457387X425X4563CSA1", precision: 30, scale: 10
    t.decimal "457387X425X4563CSA2", precision: 30, scale: 10
    t.decimal "457387X425X4563CSA3", precision: 30, scale: 10
    t.decimal "457387X425X4563CSA4", precision: 30, scale: 10
    t.decimal "457387X425X4563CSA5", precision: 30, scale: 10
    t.decimal "457387X425X4563CSA6", precision: 30, scale: 10
    t.decimal "457387X425X4563CSA7", precision: 30, scale: 10
    t.decimal "457387X425X4564FinalBlockGas", precision: 30, scale: 10
    t.decimal "457387X425X4564FinalBlockEndo", precision: 30, scale: 10
    t.decimal "457387X425X4565", precision: 30, scale: 10
    t.decimal "457387X425X4569OSCE", precision: 30, scale: 10
    t.decimal "457387X425X4569ScienceSkills", precision: 30, scale: 10
    t.decimal "457387X425X4569Anatomy", precision: 30, scale: 10
    t.decimal "457387X425X4569Infor", precision: 30, scale: 10
    t.decimal "457387X425X4566Histo", precision: 30, scale: 10
    t.decimal "457387X425X4566Path", precision: 30, scale: 10
    t.decimal "457387X425X4566Micro", precision: 30, scale: 10
    t.decimal "457387X425X4566Meta", precision: 30, scale: 10
    t.decimal "457387X425X4567Component1", precision: 30, scale: 10
    t.decimal "457387X425X4567Component2", precision: 30, scale: 10
    t.decimal "457387X425X4567Component3", precision: 30, scale: 10
    t.decimal "457387X425X4567Component4", precision: 30, scale: 10
    t.decimal "457387X425X4567Component5", precision: 30, scale: 10
    t.text "457387X425X4568"
    t.integer "457387X425X4568_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_457387_29335"
  end

  create_table "lime_survey_462858", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "462858X1060X12853SQ001"
    t.text "462858X1060X12853SQ002"
    t.text "462858X1060X12853SQ003"
    t.string "462858X1060X12875", limit: 5
    t.text "462858X1060X12875other"
    t.string "462858X1060X12883SQ001", limit: 5
    t.string "462858X1060X12883SQ002", limit: 5
    t.string "462858X1060X12883SQ003", limit: 5
    t.string "462858X1060X12883SQ004", limit: 5
    t.text "462858X1060X12883other"
    t.decimal "462858X1062X12902SQ001", precision: 30, scale: 10
    t.decimal "462858X1062X12902SQ002", precision: 30, scale: 10
    t.decimal "462858X1062X12902SQ003", precision: 30, scale: 10
    t.string "462858X1062X12922SQ001", limit: 5
    t.string "462858X1062X12922SQ002", limit: 5
    t.string "462858X1062X12922SQ003", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_462858_12819"
  end

  create_table "lime_survey_466694", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "466694X1333X14400"
    t.text "466694X1334X14401"
    t.text "466694X1474X15864"
    t.index ["token"], name: "idx_survey_token_466694_1068"
  end

  create_table "lime_survey_467179", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "467179X1306X14166"
    t.string "467179X1304X14168", limit: 5
    t.text "467179X1304X14168other"
    t.string "467179X1304X14169", limit: 5
    t.text "467179X1304X14169other"
    t.text "467179X1304X14160"
    t.text "467179X1304X14159"
    t.text "467179X1304X14161"
    t.string "467179X1304X14162", limit: 1
    t.text "467179X1304X14163"
    t.text "467179X1304X14170"
    t.text "467179X1304X14164"
    t.string "467179X1305X14165SQ001", limit: 5
    t.string "467179X1305X14165SQ002", limit: 5
    t.string "467179X1305X14165SQ003", limit: 5
    t.string "467179X1305X14165SQ004", limit: 5
    t.string "467179X1305X14165SQ005", limit: 5
    t.string "467179X1305X14165SQ006", limit: 5
    t.string "467179X1305X14165SQ007", limit: 5
    t.string "467179X1305X14165SQ008", limit: 5
    t.string "467179X1305X14165SQ009", limit: 5
    t.string "467179X1305X14165SQ010", limit: 5
    t.string "467179X1305X14165SQ011", limit: 5
    t.text "467179X1307X14167StudentYear"
    t.text "467179X1307X14167StudentEmail"
    t.text "467179X1307X14167StudentName"
    t.text "467179X1307X14167CoachEmail"
    t.text "467179X1307X14167CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_467179_34446"
  end

  create_table "lime_survey_467179_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "467179X1306time"
    t.float "467179X1306X14166time"
    t.float "467179X1304time"
    t.float "467179X1304X14168time"
    t.float "467179X1304X14169time"
    t.float "467179X1304X14160time"
    t.float "467179X1304X14159time"
    t.float "467179X1304X14161time"
    t.float "467179X1304X14162time"
    t.float "467179X1304X14163time"
    t.float "467179X1304X14170time"
    t.float "467179X1304X14164time"
    t.float "467179X1305time"
    t.float "467179X1305X14165time"
    t.float "467179X1307time"
    t.float "467179X1307X14167time"
  end

  create_table "lime_survey_467574", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "467574X359X4081StudentYear"
    t.text "467574X359X4081StudentEmail"
    t.text "467574X359X4081StudentName"
    t.text "467574X359X4081CoachEmail"
    t.text "467574X359X4081CoachName"
    t.text "467574X360X4084ExamTitle"
    t.text "467574X360X4084ExamDt"
    t.text "467574X360X4084ExamScore"
    t.text "467574X360X5810course"
    t.text "467574X360X5810dates"
    t.text "467574X360X5810grade"
    t.text "467574X363X4097ExamTitle"
    t.text "467574X363X4097ExamDate"
    t.text "467574X363X4097ExamScore"
    t.text "467574X363X5814OBCourse"
    t.text "467574X363X5814OBDates"
    t.text "467574X363X5814OBGrade"
    t.text "467574X364X4101ExamTitle"
    t.text "467574X364X4101ExamDate"
    t.text "467574X364X4101ExamScore"
    t.text "467574X364X5818PDCourse"
    t.text "467574X364X5818PDDates"
    t.text "467574X364X5818PDGrade"
    t.text "467574X365X4105ExamTitle"
    t.text "467574X365X4105ExamDate"
    t.text "467574X365X4105ExamScore"
    t.text "467574X365X5822PSYCourse"
    t.text "467574X365X5822PSYDates"
    t.text "467574X365X5822PSYGrade"
    t.text "467574X366X4109ExamTitle"
    t.text "467574X366X4109ExamDate"
    t.text "467574X366X4109ExamScore"
    t.text "467574X366X5826FMCourse"
    t.text "467574X366X5826FMDates"
    t.text "467574X366X5826FMGrade"
    t.text "467574X367X4113ExamTitle"
    t.text "467574X367X4113ExamDate"
    t.text "467574X367X4113ExamScore"
    t.text "467574X367X5830IMCourse"
    t.text "467574X367X5830IMDates"
    t.text "467574X367X5830IMGrade"
    t.text "467574X368X4117ExamTitle"
    t.text "467574X368X4117ExamDate"
    t.text "467574X368X4117ExamScore"
    t.text "467574X368X5834SURCourse"
    t.text "467574X368X5834SURDates"
    t.text "467574X368X5834SURGrade"
    t.text "467574X401X4386"
    t.integer "467574X401X4386_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_467574_39533"
  end

  create_table "lime_survey_469168", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "469168X790X9169"
    t.text "469168X790X9170"
    t.text "469168X790X9176"
    t.text "469168X790X9177"
    t.text "469168X790X9178"
    t.text "469168X790X9179"
    t.string "469168X791X9171Represents", limit: 5
    t.string "469168X791X9171Responsible", limit: 5
    t.string "469168X791X9171Determine", limit: 5
    t.string "469168X791X9171Active", limit: 5
    t.string "469168X792X9172LearnAbout", limit: 5
    t.string "469168X792X9172AcceptAny", limit: 5
    t.string "469168X792X9172DevelopAShared", limit: 5
    t.string "469168X792X9172SpecificMeasurable", limit: 5
    t.string "469168X792X9172WorkWithYourCoach", limit: 5
    t.string "469168X793X9173RecognizePersFeeling", limit: 5
    t.string "469168X793X9173AwareOfEmotions", limit: 5
    t.string "469168X793X9173InvestigateBehavior", limit: 5
    t.string "469168X793X9173MyThinkingHabits", limit: 5
    t.string "469168X793X9173SafeLearningEnv", limit: 5
    t.string "469168X793X9173Commitment", limit: 5
    t.string "469168X793X9173Affirms", limit: 5
    t.string "469168X793X9173esLearningPrStimulat", limit: 5
    t.string "469168X793X9173Encourages", limit: 5
    t.text "469168X794X9174"
    t.text "469168X794X9175"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_469168_13080"
  end

  create_table "lime_survey_469168_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "469168X790time"
    t.float "469168X790X9169time"
    t.float "469168X790X9170time"
    t.float "469168X790X9176time"
    t.float "469168X790X9177time"
    t.float "469168X790X9178time"
    t.float "469168X790X9179time"
    t.float "469168X791time"
    t.float "469168X791X9171time"
    t.float "469168X792time"
    t.float "469168X792X9172time"
    t.float "469168X793time"
    t.float "469168X793X9173time"
    t.float "469168X794time"
    t.float "469168X794X9174time"
    t.float "469168X794X9175time"
  end

  create_table "lime_survey_474646", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "474646X624X7773RecognizePersFeeling", limit: 5
    t.string "474646X624X7773AwareOfEmotions", limit: 5
    t.string "474646X624X7773InvestigateBehavior", limit: 5
    t.string "474646X624X7773ContradictoryFeeling", limit: 5
    t.string "474646X624X7773ThinkingHabits", limit: 5
    t.string "474646X624X7773TrustingRelationship", limit: 5
    t.string "474646X624X7773SafeLearning", limit: 5
    t.string "474646X624X7773Commitment", limit: 5
    t.string "474646X624X7773Affirm", limit: 5
    t.string "474646X624X7773AcceptFeedback", limit: 5
    t.string "474646X624X7773Stimulates", limit: 5
    t.string "474646X624X7773Encourage", limit: 5
    t.string "474646X624X7773EncourageProfDev", limit: 5
    t.string "474646X624X7773ConstructiveFeedback", limit: 5
    t.string "474646X658X8037", limit: 1
    t.string "474646X658X8038", limit: 5
    t.text "474646X658X8039"
    t.string "474646X658X8040", limit: 5
    t.string "474646X658X8041", limit: 5
    t.string "474646X658X8042", limit: 5
    t.string "474646X658X8043", limit: 5
    t.text "474646X658X8043other"
    t.string "474646X658X8044", limit: 5
    t.text "474646X658X8044other"
    t.string "474646X658X8045", limit: 5
    t.text "474646X658X8046"
    t.string "474646X658X8047Q1", limit: 5
    t.text "474646X658X8048"
    t.string "474646X658X8049Q1", limit: 5
    t.text "474646X623X7772"
    t.text "474646X623X7777"
    t.text "474646X623X7776"
    t.text "474646X623X7778"
    t.text "474646X623X7779"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_474646_13239"
  end

  create_table "lime_survey_476665", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "476665X972X10745SQ002", limit: 5
    t.string "476665X972X10745SQ003", limit: 5
    t.string "476665X972X10745SQ004", limit: 5
    t.string "476665X972X10745SQ005", limit: 5
    t.string "476665X972X10745SQ006", limit: 5
    t.string "476665X972X10745SQ007", limit: 5
    t.string "476665X972X10745SQ008", limit: 5
    t.string "476665X972X10745SQ009", limit: 5
    t.string "476665X972X10745SQ010", limit: 5
    t.string "476665X972X10745SQ011", limit: 5
    t.string "476665X972X10745SQ012", limit: 5
    t.string "476665X972X10745SQ013", limit: 5
    t.string "476665X972X10745SQ014", limit: 5
    t.string "476665X972X10745SQ015", limit: 5
    t.string "476665X972X10745SQ016", limit: 5
    t.string "476665X972X10745SQ017", limit: 5
    t.string "476665X972X10745SQ018", limit: 5
    t.string "476665X972X10745SQ019", limit: 5
    t.string "476665X972X10745SQ020", limit: 5
    t.string "476665X972X10745SQ021", limit: 5
    t.string "476665X972X10745SQ022", limit: 5
    t.string "476665X972X10745SQ023", limit: 5
    t.string "476665X972X10745SQ024", limit: 5
    t.string "476665X972X10745SQ039", limit: 5
    t.string "476665X972X10745SQ026", limit: 5
    t.string "476665X972X10745SQ027", limit: 5
    t.string "476665X972X10745SQ028", limit: 5
    t.string "476665X972X10745SQ029", limit: 5
    t.string "476665X972X10745SQ030", limit: 5
    t.string "476665X972X10745SQ031", limit: 5
    t.string "476665X972X10745SQ032", limit: 5
    t.string "476665X972X10745SQ033", limit: 5
    t.string "476665X972X10745SQ034", limit: 5
    t.string "476665X972X10745SQ035", limit: 5
    t.string "476665X972X10745SQ036", limit: 5
    t.string "476665X972X10745SQ037", limit: 5
    t.string "476665X972X10745SQ038", limit: 5
    t.string "476665X972X10745SQ040", limit: 5
    t.string "476665X972X10745SQ041", limit: 5
    t.string "476665X972X10745SQ042", limit: 5
    t.string "476665X972X10745SQ043", limit: 5
    t.string "476665X972X10745SQ044", limit: 5
    t.string "476665X972X10745SQ045", limit: 5
    t.string "476665X972X10745SQ046", limit: 5
    t.string "476665X972X10745SQ047", limit: 5
    t.string "476665X972X10745SQ048", limit: 5
    t.string "476665X972X10745SQ049", limit: 5
    t.string "476665X972X10745SQ050", limit: 5
    t.string "476665X972X10745SQ051", limit: 5
    t.string "476665X972X10745SQ052", limit: 5
    t.string "476665X972X10745SQ053", limit: 5
    t.string "476665X972X10745SQ054", limit: 5
    t.string "476665X972X10745SQ055", limit: 5
    t.string "476665X972X10745SQ056", limit: 5
    t.string "476665X972X10745SQ057", limit: 5
    t.string "476665X972X10745SQ058", limit: 5
    t.string "476665X972X10745SQ059", limit: 5
    t.string "476665X972X10745SQ060", limit: 5
    t.string "476665X972X10745SQ061", limit: 5
    t.string "476665X972X10745SQ062", limit: 5
    t.string "476665X972X10745SQ063", limit: 5
    t.string "476665X972X10745SQ064", limit: 5
    t.string "476665X972X10745SQ065", limit: 5
    t.string "476665X972X10745SQ066", limit: 5
    t.string "476665X972X10745SQ067", limit: 5
    t.string "476665X972X10745SQ068", limit: 5
    t.string "476665X972X10745SQ069", limit: 5
    t.string "476665X972X10745SQ070", limit: 5
    t.string "476665X972X10745SQ071", limit: 5
    t.string "476665X972X10745SQ072", limit: 5
    t.string "476665X972X10745SQ073", limit: 5
    t.string "476665X972X10745SQ074", limit: 5
    t.string "476665X972X10745SQ075", limit: 5
    t.string "476665X972X10745SQ076", limit: 5
    t.string "476665X972X10745SQ077", limit: 5
    t.string "476665X972X10745SQ078", limit: 5
    t.string "476665X972X10745SQ079", limit: 5
    t.string "476665X972X10745SQ080", limit: 5
    t.string "476665X972X10745SQ081", limit: 5
    t.string "476665X972X10745SQ082", limit: 5
    t.string "476665X972X10745SQ083", limit: 5
    t.string "476665X972X10745SQ084", limit: 5
    t.string "476665X972X10745SQ085", limit: 5
    t.string "476665X972X10745SQ086", limit: 5
    t.string "476665X972X10745SQ087", limit: 5
    t.string "476665X972X10745SQ088", limit: 5
    t.string "476665X972X10745SQ089", limit: 5
    t.string "476665X972X10745SQ090", limit: 5
    t.string "476665X972X10745SQ091", limit: 5
    t.string "476665X972X10745SQ092", limit: 5
    t.string "476665X972X10745SQ093", limit: 5
    t.string "476665X972X10745SQ094", limit: 5
    t.string "476665X972X10745SQ095", limit: 5
    t.string "476665X972X10745SQ096", limit: 5
    t.string "476665X972X10745SQ097", limit: 5
    t.string "476665X972X10745SQ098", limit: 5
    t.string "476665X972X10745SQ099", limit: 5
    t.string "476665X972X10745SQ100", limit: 5
    t.string "476665X972X10745SQ101", limit: 5
    t.string "476665X972X10745SQ102", limit: 5
    t.string "476665X972X10745SQ103", limit: 5
    t.string "476665X972X10745SQ104", limit: 5
    t.string "476665X972X10745SQ105", limit: 5
    t.string "476665X972X10745SQ106", limit: 5
    t.string "476665X972X10745SQ107", limit: 5
    t.string "476665X972X10745SQ108", limit: 5
    t.string "476665X972X10745SQ109", limit: 5
    t.string "476665X972X10745SQ110", limit: 5
    t.string "476665X972X10745SQ111", limit: 5
    t.string "476665X972X10745SQ112", limit: 5
    t.string "476665X972X10745SQ113", limit: 5
    t.string "476665X972X10745SQ114", limit: 5
    t.string "476665X972X10745SQ115", limit: 5
    t.string "476665X972X10745SQ116", limit: 5
    t.string "476665X972X10745SQ117", limit: 5
    t.string "476665X972X10745SQ118", limit: 5
    t.string "476665X972X10745SQ119", limit: 5
    t.string "476665X972X10745SQ120", limit: 5
    t.string "476665X972X10745SQ121", limit: 5
    t.string "476665X972X10745SQ122", limit: 5
    t.string "476665X972X10745SQ123", limit: 5
    t.string "476665X972X10745SQ124", limit: 5
    t.string "476665X972X10745SQ125", limit: 5
    t.string "476665X972X10745SQ126", limit: 5
    t.string "476665X972X10745SQ127", limit: 5
    t.string "476665X972X10745SQ128", limit: 5
    t.string "476665X972X10745SQ129", limit: 5
    t.string "476665X972X10745SQ130", limit: 5
    t.string "476665X972X10745SQ131", limit: 5
    t.string "476665X972X10745SQ132", limit: 5
    t.string "476665X972X10745SQ133", limit: 5
    t.string "476665X972X10745SQ134", limit: 5
    t.string "476665X972X10746SQ002", limit: 5
    t.string "476665X972X10746SQ003", limit: 5
    t.string "476665X972X10746SQ004", limit: 5
    t.string "476665X972X10746SQ005", limit: 5
    t.string "476665X972X10746SQ006", limit: 5
    t.string "476665X972X10746SQ007", limit: 5
    t.string "476665X972X10746SQ008", limit: 5
    t.string "476665X972X10746SQ009", limit: 5
    t.string "476665X972X10746SQ010", limit: 5
    t.string "476665X972X10746SQ011", limit: 5
    t.string "476665X972X10746SQ012", limit: 5
    t.string "476665X972X10746SQ013", limit: 5
    t.string "476665X972X10746SQ014", limit: 5
    t.string "476665X972X10746SQ015", limit: 5
    t.string "476665X972X10746SQ016", limit: 5
    t.string "476665X972X10746SQ017", limit: 5
    t.string "476665X972X10746SQ018", limit: 5
    t.string "476665X972X10746SQ019", limit: 5
    t.string "476665X972X10746SQ020", limit: 5
    t.string "476665X972X10746SQ021", limit: 5
    t.string "476665X972X10746SQ022", limit: 5
    t.string "476665X972X10746SQ023", limit: 5
    t.string "476665X972X10746SQ024", limit: 5
    t.string "476665X972X10746SQ025", limit: 5
    t.string "476665X972X10746SQ026", limit: 5
    t.string "476665X972X10746SQ027", limit: 5
    t.string "476665X972X10746SQ028", limit: 5
    t.string "476665X972X10746SQ029", limit: 5
    t.string "476665X972X10746SQ030", limit: 5
    t.string "476665X972X10746SQ031", limit: 5
    t.string "476665X972X10746SQ032", limit: 5
    t.string "476665X972X10746SQ033", limit: 5
    t.string "476665X972X10746SQ034", limit: 5
    t.string "476665X972X10746SQ035", limit: 5
    t.string "476665X972X10746SQ036", limit: 5
    t.string "476665X972X10746SQ037", limit: 5
    t.string "476665X972X10746SQ123", limit: 5
    t.string "476665X972X10746SQ039", limit: 5
    t.string "476665X972X10746SQ040", limit: 5
    t.string "476665X972X10746SQ041", limit: 5
    t.string "476665X972X10746SQ042", limit: 5
    t.string "476665X972X10746SQ043", limit: 5
    t.string "476665X972X10746SQ044", limit: 5
    t.string "476665X972X10746SQ045", limit: 5
    t.string "476665X972X10746SQ046", limit: 5
    t.string "476665X972X10746SQ047", limit: 5
    t.string "476665X972X10746SQ048", limit: 5
    t.string "476665X972X10746SQ049", limit: 5
    t.string "476665X972X10746SQ050", limit: 5
    t.string "476665X972X10746SQ051", limit: 5
    t.string "476665X972X10746SQ052", limit: 5
    t.string "476665X972X10746SQ053", limit: 5
    t.string "476665X972X10746SQ054", limit: 5
    t.string "476665X972X10746SQ055", limit: 5
    t.string "476665X972X10746SQ056", limit: 5
    t.string "476665X972X10746SQ057", limit: 5
    t.string "476665X972X10746SQ058", limit: 5
    t.string "476665X972X10746SQ059", limit: 5
    t.string "476665X972X10746SQ060", limit: 5
    t.string "476665X972X10746SQ061", limit: 5
    t.string "476665X972X10746SQ062", limit: 5
    t.string "476665X972X10746SQ063", limit: 5
    t.string "476665X972X10746SQ086", limit: 5
    t.string "476665X972X10746SQ065", limit: 5
    t.string "476665X972X10746SQ066", limit: 5
    t.string "476665X972X10746SQ067", limit: 5
    t.string "476665X972X10746SQ068", limit: 5
    t.string "476665X972X10746SQ069", limit: 5
    t.string "476665X972X10746SQ070", limit: 5
    t.string "476665X972X10746SQ071", limit: 5
    t.string "476665X972X10746SQ072", limit: 5
    t.string "476665X972X10746SQ073", limit: 5
    t.string "476665X972X10746SQ074", limit: 5
    t.string "476665X972X10746SQ075", limit: 5
    t.string "476665X972X10746SQ076", limit: 5
    t.string "476665X972X10746SQ077", limit: 5
    t.string "476665X972X10746SQ078", limit: 5
    t.string "476665X972X10746SQ079", limit: 5
    t.string "476665X972X10746SQ080", limit: 5
    t.string "476665X972X10746SQ081", limit: 5
    t.string "476665X972X10746SQ082", limit: 5
    t.string "476665X972X10746SQ083", limit: 5
    t.string "476665X972X10746SQ084", limit: 5
    t.string "476665X972X10746SQ085", limit: 5
    t.string "476665X972X10746SQ087", limit: 5
    t.string "476665X972X10746SQ088", limit: 5
    t.string "476665X972X10746SQ089", limit: 5
    t.string "476665X972X10746SQ090", limit: 5
    t.string "476665X972X10746SQ091", limit: 5
    t.string "476665X972X10746SQ092", limit: 5
    t.string "476665X972X10746SQ093", limit: 5
    t.string "476665X972X10746SQ094", limit: 5
    t.string "476665X972X10746SQ095", limit: 5
    t.string "476665X972X10746SQ096", limit: 5
    t.string "476665X972X10746SQ097", limit: 5
    t.string "476665X972X10746SQ098", limit: 5
    t.string "476665X972X10746SQ099", limit: 5
    t.string "476665X972X10746SQ100", limit: 5
    t.string "476665X972X10746SQ101", limit: 5
    t.string "476665X972X10746SQ102", limit: 5
    t.string "476665X972X10746SQ103", limit: 5
    t.string "476665X972X10746SQ104", limit: 5
    t.string "476665X972X10746SQ105", limit: 5
    t.string "476665X972X10746SQ106", limit: 5
    t.string "476665X972X10746SQ107", limit: 5
    t.string "476665X972X10746SQ108", limit: 5
    t.string "476665X972X10746SQ109", limit: 5
    t.string "476665X972X10746SQ110", limit: 5
    t.string "476665X972X10746SQ111", limit: 5
    t.string "476665X972X10746SQ112", limit: 5
    t.string "476665X972X10746SQ113", limit: 5
    t.string "476665X972X10746SQ114", limit: 5
    t.string "476665X972X10746SQ115", limit: 5
    t.string "476665X972X10746SQ116", limit: 5
    t.string "476665X972X10746SQ117", limit: 5
    t.string "476665X972X10746SQ118", limit: 5
    t.string "476665X972X10746SQ119", limit: 5
    t.string "476665X972X10746SQ120", limit: 5
    t.string "476665X972X10746SQ121", limit: 5
    t.string "476665X972X10746SQ122", limit: 5
    t.string "476665X972X10746SQ124", limit: 5
    t.string "476665X972X10746SQ125", limit: 5
    t.string "476665X972X10746SQ126", limit: 5
    t.string "476665X972X10746SQ127", limit: 5
    t.string "476665X972X10746SQ128", limit: 5
    t.string "476665X972X10746SQ129", limit: 5
    t.string "476665X972X10746SQ130", limit: 5
    t.string "476665X972X10746SQ131", limit: 5
    t.string "476665X972X10746SQ132", limit: 5
    t.string "476665X972X10746SQ133", limit: 5
    t.string "476665X972X10746SQ134", limit: 5
    t.string "476665X972X10748SQ002", limit: 5
    t.string "476665X972X10748SQ003", limit: 5
    t.string "476665X972X10748SQ004", limit: 5
    t.string "476665X972X10748SQ005", limit: 5
    t.string "476665X972X10748SQ006", limit: 5
    t.string "476665X972X10748SQ007", limit: 5
    t.string "476665X972X10748SQ008", limit: 5
    t.string "476665X972X10748SQ009", limit: 5
    t.string "476665X972X10748SQ010", limit: 5
    t.string "476665X972X10748SQ011", limit: 5
    t.string "476665X972X10748SQ012", limit: 5
    t.string "476665X972X10748SQ013", limit: 5
    t.string "476665X972X10748SQ014", limit: 5
    t.string "476665X972X10748SQ015", limit: 5
    t.string "476665X972X10748SQ016", limit: 5
    t.string "476665X972X10748SQ017", limit: 5
    t.string "476665X972X10748SQ018", limit: 5
    t.string "476665X972X10748SQ019", limit: 5
    t.string "476665X972X10748SQ020", limit: 5
    t.string "476665X972X10748SQ021", limit: 5
    t.string "476665X972X10748SQ022", limit: 5
    t.string "476665X972X10748SQ023", limit: 5
    t.string "476665X972X10748SQ024", limit: 5
    t.string "476665X972X10748SQ025", limit: 5
    t.string "476665X972X10748SQ026", limit: 5
    t.string "476665X972X10748SQ027", limit: 5
    t.string "476665X972X10748SQ028", limit: 5
    t.string "476665X972X10748SQ029", limit: 5
    t.string "476665X972X10748SQ030", limit: 5
    t.string "476665X972X10748SQ031", limit: 5
    t.string "476665X972X10748SQ032", limit: 5
    t.string "476665X972X10748SQ033", limit: 5
    t.string "476665X972X10748SQ034", limit: 5
    t.string "476665X972X10748SQ035", limit: 5
    t.string "476665X972X10748SQ036", limit: 5
    t.string "476665X972X10748SQ037", limit: 5
    t.string "476665X972X10748SQ038", limit: 5
    t.string "476665X972X10748SQ039", limit: 5
    t.string "476665X972X10748SQ040", limit: 5
    t.string "476665X972X10748SQ041", limit: 5
    t.string "476665X972X10748SQ042", limit: 5
    t.string "476665X972X10748SQ043", limit: 5
    t.string "476665X972X10748SQ044", limit: 5
    t.string "476665X972X10748SQ045", limit: 5
    t.string "476665X972X10748SQ046", limit: 5
    t.string "476665X972X10748SQ047", limit: 5
    t.string "476665X972X10748SQ048", limit: 5
    t.string "476665X972X10748SQ049", limit: 5
    t.string "476665X972X10748SQ050", limit: 5
    t.string "476665X972X10748SQ051", limit: 5
    t.string "476665X972X10748SQ052", limit: 5
    t.string "476665X972X10748SQ053", limit: 5
    t.string "476665X972X10748SQ054", limit: 5
    t.string "476665X972X10748SQ055", limit: 5
    t.string "476665X972X10748SQ056", limit: 5
    t.string "476665X972X10748SQ057", limit: 5
    t.string "476665X972X10748SQ058", limit: 5
    t.string "476665X972X10748SQ059", limit: 5
    t.string "476665X972X10748SQ060", limit: 5
    t.string "476665X972X10748SQ061", limit: 5
    t.string "476665X972X10748SQ062", limit: 5
    t.string "476665X972X10748SQ063", limit: 5
    t.string "476665X972X10748SQ064", limit: 5
    t.string "476665X972X10748SQ065", limit: 5
    t.string "476665X972X10748SQ066", limit: 5
    t.string "476665X972X10748SQ067", limit: 5
    t.string "476665X972X10748SQ068", limit: 5
    t.string "476665X972X10748SQ069", limit: 5
    t.string "476665X972X10748SQ070", limit: 5
    t.string "476665X972X10748SQ071", limit: 5
    t.string "476665X972X10748SQ072", limit: 5
    t.string "476665X972X10748SQ073", limit: 5
    t.string "476665X972X10748SQ074", limit: 5
    t.string "476665X972X10748SQ075", limit: 5
    t.string "476665X972X10748SQ076", limit: 5
    t.string "476665X972X10748SQ077", limit: 5
    t.string "476665X972X10748SQ078", limit: 5
    t.string "476665X972X10748SQ079", limit: 5
    t.string "476665X972X10748SQ080", limit: 5
    t.string "476665X972X10748SQ081", limit: 5
    t.string "476665X972X10748SQ082", limit: 5
    t.string "476665X972X10748SQ083", limit: 5
    t.string "476665X972X10748SQ084", limit: 5
    t.string "476665X972X10748SQ085", limit: 5
    t.string "476665X972X10748SQ086", limit: 5
    t.string "476665X972X10748SQ087", limit: 5
    t.string "476665X972X10748SQ088", limit: 5
    t.string "476665X972X10748SQ089", limit: 5
    t.string "476665X972X10748SQ090", limit: 5
    t.string "476665X972X10748SQ091", limit: 5
    t.string "476665X972X10748SQ092", limit: 5
    t.string "476665X972X10748SQ093", limit: 5
    t.string "476665X972X10748SQ094", limit: 5
    t.string "476665X972X10748SQ095", limit: 5
    t.string "476665X972X10748SQ096", limit: 5
    t.string "476665X972X10748SQ097", limit: 5
    t.string "476665X972X10748SQ098", limit: 5
    t.string "476665X972X10748SQ099", limit: 5
    t.string "476665X972X10748SQ100", limit: 5
    t.string "476665X972X10748SQ101", limit: 5
    t.string "476665X972X10748SQ102", limit: 5
    t.string "476665X972X10748SQ103", limit: 5
    t.string "476665X972X10748SQ104", limit: 5
    t.string "476665X972X10748SQ105", limit: 5
    t.string "476665X972X10748SQ106", limit: 5
    t.string "476665X972X10748SQ107", limit: 5
    t.string "476665X972X10748SQ108", limit: 5
    t.string "476665X972X10748SQ109", limit: 5
    t.string "476665X972X10748SQ110", limit: 5
    t.string "476665X972X10748SQ111", limit: 5
    t.string "476665X972X10748SQ112", limit: 5
    t.string "476665X972X10748SQ113", limit: 5
    t.string "476665X972X10748SQ114", limit: 5
    t.string "476665X972X10748SQ115", limit: 5
    t.string "476665X972X10748SQ116", limit: 5
    t.string "476665X972X10748SQ117", limit: 5
    t.string "476665X972X10748SQ118", limit: 5
    t.string "476665X972X10748SQ119", limit: 5
    t.string "476665X972X10748SQ120", limit: 5
    t.string "476665X972X10748SQ121", limit: 5
    t.string "476665X972X10748SQ122", limit: 5
    t.string "476665X972X10748SQ123", limit: 5
    t.string "476665X972X10748SQ124", limit: 5
    t.string "476665X972X10748SQ125", limit: 5
    t.string "476665X972X10748SQ126", limit: 5
    t.string "476665X972X10748SQ127", limit: 5
    t.string "476665X972X10748SQ128", limit: 5
    t.string "476665X972X10748SQ129", limit: 5
    t.string "476665X972X10748SQ130", limit: 5
    t.string "476665X972X10748SQ131", limit: 5
    t.string "476665X972X10748SQ132", limit: 5
    t.string "476665X972X10748SQ133", limit: 5
    t.string "476665X972X10748SQ134", limit: 5
    t.string "476665X972X10749SQ002", limit: 5
    t.string "476665X972X10749SQ003", limit: 5
    t.string "476665X972X10749SQ004", limit: 5
    t.string "476665X972X10749SQ005", limit: 5
    t.string "476665X972X10749SQ006", limit: 5
    t.string "476665X972X10749SQ007", limit: 5
    t.string "476665X972X10749SQ008", limit: 5
    t.string "476665X972X10749SQ009", limit: 5
    t.string "476665X972X10749SQ010", limit: 5
    t.string "476665X972X10749SQ011", limit: 5
    t.string "476665X972X10749SQ012", limit: 5
    t.string "476665X972X10749SQ013", limit: 5
    t.string "476665X972X10749SQ014", limit: 5
    t.string "476665X972X10749SQ015", limit: 5
    t.string "476665X972X10749SQ016", limit: 5
    t.string "476665X972X10749SQ017", limit: 5
    t.string "476665X972X10749SQ018", limit: 5
    t.string "476665X972X10749SQ019", limit: 5
    t.string "476665X972X10749SQ020", limit: 5
    t.string "476665X972X10749SQ021", limit: 5
    t.string "476665X972X10749SQ022", limit: 5
    t.string "476665X972X10749SQ023", limit: 5
    t.string "476665X972X10749SQ024", limit: 5
    t.string "476665X972X10749SQ025", limit: 5
    t.string "476665X972X10749SQ026", limit: 5
    t.string "476665X972X10749SQ027", limit: 5
    t.string "476665X972X10749SQ028", limit: 5
    t.string "476665X972X10749SQ029", limit: 5
    t.string "476665X972X10749SQ030", limit: 5
    t.string "476665X972X10749SQ031", limit: 5
    t.string "476665X972X10749SQ032", limit: 5
    t.string "476665X972X10749SQ033", limit: 5
    t.string "476665X972X10749SQ034", limit: 5
    t.string "476665X972X10749SQ035", limit: 5
    t.string "476665X972X10749SQ036", limit: 5
    t.string "476665X972X10749SQ037", limit: 5
    t.string "476665X972X10749SQ038", limit: 5
    t.string "476665X972X10749SQ039", limit: 5
    t.string "476665X972X10749SQ040", limit: 5
    t.string "476665X972X10749SQ041", limit: 5
    t.string "476665X972X10749SQ042", limit: 5
    t.string "476665X972X10749SQ043", limit: 5
    t.string "476665X972X10749SQ044", limit: 5
    t.string "476665X972X10749SQ045", limit: 5
    t.string "476665X972X10749SQ046", limit: 5
    t.string "476665X972X10749SQ047", limit: 5
    t.string "476665X972X10749SQ048", limit: 5
    t.string "476665X972X10749SQ049", limit: 5
    t.string "476665X972X10749SQ050", limit: 5
    t.string "476665X972X10749SQ051", limit: 5
    t.string "476665X972X10749SQ052", limit: 5
    t.string "476665X972X10749SQ053", limit: 5
    t.string "476665X972X10749SQ054", limit: 5
    t.string "476665X972X10749SQ055", limit: 5
    t.string "476665X972X10749SQ056", limit: 5
    t.string "476665X972X10749SQ057", limit: 5
    t.string "476665X972X10749SQ058", limit: 5
    t.string "476665X972X10749SQ059", limit: 5
    t.string "476665X972X10749SQ060", limit: 5
    t.string "476665X972X10749SQ061", limit: 5
    t.string "476665X972X10749SQ062", limit: 5
    t.string "476665X972X10749SQ063", limit: 5
    t.string "476665X972X10749SQ064", limit: 5
    t.string "476665X972X10749SQ065", limit: 5
    t.string "476665X972X10749SQ066", limit: 5
    t.string "476665X972X10749SQ067", limit: 5
    t.string "476665X972X10749SQ068", limit: 5
    t.string "476665X972X10749SQ069", limit: 5
    t.string "476665X972X10749SQ070", limit: 5
    t.string "476665X972X10749SQ071", limit: 5
    t.string "476665X972X10749SQ072", limit: 5
    t.string "476665X972X10749SQ073", limit: 5
    t.string "476665X972X10749SQ074", limit: 5
    t.string "476665X972X10749SQ075", limit: 5
    t.string "476665X972X10749SQ076", limit: 5
    t.string "476665X972X10749SQ077", limit: 5
    t.string "476665X972X10749SQ078", limit: 5
    t.string "476665X972X10749SQ079", limit: 5
    t.string "476665X972X10749SQ080", limit: 5
    t.string "476665X972X10749SQ081", limit: 5
    t.string "476665X972X10749SQ082", limit: 5
    t.string "476665X972X10749SQ083", limit: 5
    t.string "476665X972X10749SQ084", limit: 5
    t.string "476665X972X10749SQ085", limit: 5
    t.string "476665X972X10749SQ086", limit: 5
    t.string "476665X972X10749SQ087", limit: 5
    t.string "476665X972X10749SQ088", limit: 5
    t.string "476665X972X10749SQ089", limit: 5
    t.string "476665X972X10749SQ090", limit: 5
    t.string "476665X972X10749SQ091", limit: 5
    t.string "476665X972X10749SQ092", limit: 5
    t.string "476665X972X10749SQ093", limit: 5
    t.string "476665X972X10749SQ094", limit: 5
    t.string "476665X972X10749SQ095", limit: 5
    t.string "476665X972X10749SQ096", limit: 5
    t.string "476665X972X10749SQ097", limit: 5
    t.string "476665X972X10749SQ098", limit: 5
    t.string "476665X972X10749SQ099", limit: 5
    t.string "476665X972X10749SQ100", limit: 5
    t.string "476665X972X10749SQ101", limit: 5
    t.string "476665X972X10749SQ102", limit: 5
    t.string "476665X972X10749SQ103", limit: 5
    t.string "476665X972X10749SQ104", limit: 5
    t.string "476665X972X10749SQ105", limit: 5
    t.string "476665X972X10749SQ106", limit: 5
    t.string "476665X972X10749SQ107", limit: 5
    t.string "476665X972X10749SQ108", limit: 5
    t.string "476665X972X10749SQ109", limit: 5
    t.string "476665X972X10749SQ110", limit: 5
    t.string "476665X972X10749SQ111", limit: 5
    t.string "476665X972X10749SQ112", limit: 5
    t.string "476665X972X10749SQ113", limit: 5
    t.string "476665X972X10749SQ114", limit: 5
    t.string "476665X972X10749SQ115", limit: 5
    t.string "476665X972X10749SQ116", limit: 5
    t.string "476665X972X10749SQ117", limit: 5
    t.string "476665X972X10749SQ118", limit: 5
    t.string "476665X972X10749SQ119", limit: 5
    t.string "476665X972X10749SQ120", limit: 5
    t.string "476665X972X10749SQ121", limit: 5
    t.string "476665X972X10749SQ122", limit: 5
    t.string "476665X972X10749SQ123", limit: 5
    t.string "476665X972X10749SQ124", limit: 5
    t.string "476665X972X10749SQ125", limit: 5
    t.string "476665X972X10749SQ126", limit: 5
    t.string "476665X972X10749SQ127", limit: 5
    t.string "476665X972X10749SQ128", limit: 5
    t.string "476665X972X10749SQ129", limit: 5
    t.string "476665X972X10749SQ130", limit: 5
    t.string "476665X972X10749SQ131", limit: 5
    t.string "476665X972X10749SQ132", limit: 5
    t.string "476665X972X10749SQ133", limit: 5
    t.string "476665X972X10749SQ134", limit: 5
    t.string "476665X972X10749SQ135", limit: 5
    t.string "476665X972X11950SQ002", limit: 5
    t.string "476665X972X11950SQ003", limit: 5
    t.string "476665X972X11950SQ004", limit: 5
    t.string "476665X972X11950SQ005", limit: 5
    t.string "476665X972X11950SQ006", limit: 5
    t.string "476665X972X11950SQ007", limit: 5
    t.string "476665X972X11950SQ008", limit: 5
    t.string "476665X972X11950SQ009", limit: 5
    t.string "476665X972X11950SQ010", limit: 5
    t.string "476665X972X11950SQ011", limit: 5
    t.string "476665X972X11950SQ012", limit: 5
    t.string "476665X972X11950SQ013", limit: 5
    t.string "476665X972X11950SQ014", limit: 5
    t.string "476665X972X11950SQ015", limit: 5
    t.string "476665X972X11950SQ016", limit: 5
    t.string "476665X972X11950SQ017", limit: 5
    t.string "476665X972X11950SQ018", limit: 5
    t.string "476665X972X11950SQ019", limit: 5
    t.string "476665X972X11950SQ020", limit: 5
    t.string "476665X972X11950SQ021", limit: 5
    t.string "476665X972X11950SQ022", limit: 5
    t.string "476665X972X11950SQ023", limit: 5
    t.string "476665X972X11950SQ024", limit: 5
    t.string "476665X972X11950SQ025", limit: 5
    t.string "476665X972X11950SQ026", limit: 5
    t.string "476665X972X11950SQ027", limit: 5
    t.string "476665X972X11950SQ028", limit: 5
    t.string "476665X972X11950SQ029", limit: 5
    t.string "476665X972X11950SQ030", limit: 5
    t.string "476665X972X11950SQ031", limit: 5
    t.string "476665X972X11950SQ032", limit: 5
    t.string "476665X972X11950SQ033", limit: 5
    t.string "476665X972X11950SQ034", limit: 5
    t.string "476665X972X11950SQ035", limit: 5
    t.string "476665X972X11950SQ036", limit: 5
    t.string "476665X972X11950SQ037", limit: 5
    t.string "476665X972X11950SQ038", limit: 5
    t.string "476665X972X11950SQ039", limit: 5
    t.string "476665X972X11950SQ040", limit: 5
    t.string "476665X972X11950SQ041", limit: 5
    t.string "476665X972X11950SQ042", limit: 5
    t.string "476665X972X11950SQ043", limit: 5
    t.string "476665X972X11950SQ044", limit: 5
    t.string "476665X972X11950SQ045", limit: 5
    t.string "476665X972X11950SQ046", limit: 5
    t.string "476665X972X11950SQ047", limit: 5
    t.string "476665X972X11950SQ048", limit: 5
    t.string "476665X972X11950SQ049", limit: 5
    t.string "476665X972X11950SQ050", limit: 5
    t.string "476665X972X11950SQ051", limit: 5
    t.string "476665X972X11950SQ052", limit: 5
    t.string "476665X972X11950SQ053", limit: 5
    t.string "476665X972X11950SQ054", limit: 5
    t.string "476665X972X11950SQ055", limit: 5
    t.string "476665X972X11950SQ056", limit: 5
    t.string "476665X972X11950SQ057", limit: 5
    t.string "476665X972X11950SQ058", limit: 5
    t.string "476665X972X11950SQ059", limit: 5
    t.string "476665X972X11950SQ060", limit: 5
    t.string "476665X972X11950SQ061", limit: 5
    t.string "476665X972X11950SQ062", limit: 5
    t.string "476665X972X11950SQ063", limit: 5
    t.string "476665X972X11950SQ064", limit: 5
    t.string "476665X972X11950SQ065", limit: 5
    t.string "476665X972X11950SQ066", limit: 5
    t.string "476665X972X11950SQ067", limit: 5
    t.string "476665X972X11950SQ068", limit: 5
    t.string "476665X972X11950SQ069", limit: 5
    t.string "476665X972X11950SQ070", limit: 5
    t.string "476665X972X11950SQ071", limit: 5
    t.string "476665X972X11950SQ072", limit: 5
    t.string "476665X972X11950SQ073", limit: 5
    t.string "476665X972X11950SQ074", limit: 5
    t.string "476665X972X11950SQ075", limit: 5
    t.string "476665X972X11950SQ076", limit: 5
    t.string "476665X972X11950SQ077", limit: 5
    t.string "476665X972X11950SQ078", limit: 5
    t.string "476665X972X11950SQ079", limit: 5
    t.string "476665X972X11950SQ080", limit: 5
    t.string "476665X972X11950SQ081", limit: 5
    t.string "476665X972X11950SQ082", limit: 5
    t.string "476665X972X11950SQ083", limit: 5
    t.string "476665X972X11950SQ084", limit: 5
    t.string "476665X972X11950SQ085", limit: 5
    t.string "476665X972X11950SQ086", limit: 5
    t.string "476665X972X11950SQ087", limit: 5
    t.string "476665X972X11950SQ088", limit: 5
    t.string "476665X972X11950SQ089", limit: 5
    t.string "476665X972X11950SQ090", limit: 5
    t.string "476665X972X11950SQ091", limit: 5
    t.string "476665X972X11950SQ092", limit: 5
    t.string "476665X972X11950SQ093", limit: 5
    t.string "476665X972X11950SQ094", limit: 5
    t.string "476665X972X11950SQ095", limit: 5
    t.string "476665X972X11950SQ096", limit: 5
    t.string "476665X972X11950SQ097", limit: 5
    t.string "476665X972X11950SQ098", limit: 5
    t.string "476665X972X11950SQ099", limit: 5
    t.string "476665X972X11950SQ100", limit: 5
    t.string "476665X972X11950SQ101", limit: 5
    t.string "476665X972X11950SQ102", limit: 5
    t.string "476665X972X11950SQ103", limit: 5
    t.string "476665X972X11950SQ104", limit: 5
    t.string "476665X972X11950SQ105", limit: 5
    t.string "476665X972X11950SQ106", limit: 5
    t.string "476665X972X11950SQ107", limit: 5
    t.string "476665X972X11950SQ108", limit: 5
    t.string "476665X972X11950SQ109", limit: 5
    t.string "476665X972X11950SQ110", limit: 5
    t.string "476665X972X11950SQ111", limit: 5
    t.string "476665X972X11950SQ112", limit: 5
    t.string "476665X972X11950SQ113", limit: 5
    t.string "476665X972X11950SQ114", limit: 5
    t.string "476665X972X11950SQ115", limit: 5
    t.string "476665X972X11950SQ116", limit: 5
    t.string "476665X972X11950SQ117", limit: 5
    t.string "476665X972X11950SQ118", limit: 5
    t.string "476665X972X11950SQ119", limit: 5
    t.string "476665X972X11950SQ120", limit: 5
    t.string "476665X972X11950SQ121", limit: 5
    t.string "476665X972X11950SQ122", limit: 5
    t.string "476665X972X11950SQ123", limit: 5
    t.string "476665X972X11950SQ124", limit: 5
    t.string "476665X972X11950SQ125", limit: 5
    t.string "476665X972X11950SQ126", limit: 5
    t.string "476665X972X11950SQ127", limit: 5
    t.string "476665X972X11950SQ128", limit: 5
    t.string "476665X972X11950SQ129", limit: 5
    t.string "476665X972X11950SQ130", limit: 5
    t.string "476665X972X11950SQ131", limit: 5
    t.string "476665X972X11950SQ132", limit: 5
    t.string "476665X972X11950SQ133", limit: 5
    t.string "476665X972X11950SQ134", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_476665_5387"
  end

  create_table "lime_survey_486269", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "486269X418X4510"
    t.string "486269X416X4512", limit: 5
    t.string "486269X416X4513", limit: 5
    t.text "486269X416X4504"
    t.text "486269X416X4503"
    t.text "486269X416X4505"
    t.string "486269X416X4506", limit: 1
    t.text "486269X416X4507"
    t.text "486269X416X4514"
    t.text "486269X416X4508"
    t.string "486269X417X4509SQ001", limit: 5
    t.string "486269X417X4509SQ002", limit: 5
    t.string "486269X417X4509SQ003", limit: 5
    t.string "486269X417X4509SQ004", limit: 5
    t.string "486269X417X4509SQ005", limit: 5
    t.string "486269X417X4509SQ006", limit: 5
    t.string "486269X417X4509SQ007", limit: 5
    t.string "486269X417X4509SQ008", limit: 5
    t.string "486269X417X4509SQ009", limit: 5
    t.string "486269X417X4509SQ010", limit: 5
    t.string "486269X417X4509SQ011", limit: 5
    t.text "486269X419X4511StudentYear"
    t.text "486269X419X4511StudentEmail"
    t.text "486269X419X4511StudentName"
    t.text "486269X419X4511CoachEmail"
    t.text "486269X419X4511CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_486269_38001"
  end

  create_table "lime_survey_486269_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "486269X418time"
    t.float "486269X418X4510time"
    t.float "486269X416time"
    t.float "486269X416X4512time"
    t.float "486269X416X4513time"
    t.float "486269X416X4504time"
    t.float "486269X416X4503time"
    t.float "486269X416X4505time"
    t.float "486269X416X4506time"
    t.float "486269X416X4507time"
    t.float "486269X416X4514time"
    t.float "486269X416X4508time"
    t.float "486269X417time"
    t.float "486269X417X4509time"
    t.float "486269X419time"
    t.float "486269X419X4511time"
  end

  create_table "lime_survey_486571", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "486571X310X3647StudentYear"
    t.text "486571X310X3647StudentEmail"
    t.text "486571X310X3647StudentName"
    t.text "486571X310X3647CoachEmail"
    t.text "486571X310X3647CoachName"
    t.text "486571X308X3635InterComp1"
    t.text "486571X308X3635InterComp2"
    t.text "486571X308X3635InterComp3"
    t.text "486571X308X3635InterComp4"
    t.text "486571X308X3635InterFinal"
    t.decimal "486571X308X3641", precision: 30, scale: 10
    t.text "486571X324X3786Level1"
    t.text "486571X324X3786Level2"
    t.text "486571X324X3786Level3"
    t.text "486571X324X3786Total"
    t.text "486571X324X3787ICS3"
    t.text "486571X324X3788SBPIC4"
    t.text "486571X324X3789MK1"
    t.text "486571X324X3789MK2"
    t.text "486571X324X3789MK3"
    t.text "486571X324X3789MK5"
    t.text "486571X324X3789PBLI1"
    t.text "486571X324X3789PBLI2"
    t.text "486571X324X3789PBLI4"
    t.text "486571X324X3789PPPD7"
    t.text "486571X324X3789PPPD8"
    t.text "486571X324X3789SBPIC2"
    t.text "486571X324X3789SBPIC4"
    t.text "486571X324X3789ICS3"
    t.text "486571X325X3806"
    t.integer "486571X325X3806_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_486571_26963"
  end

  create_table "lime_survey_491682", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "491682X1348X14536SQ001", limit: 5
    t.string "491682X1348X14536SQ002", limit: 5
    t.string "491682X1348X14536SQ003", limit: 5
    t.string "491682X1348X14536SQ004", limit: 5
    t.text "491682X1348X14537"
    t.text "491682X1348X14538"
    t.text "491682X1348X14539"
    t.string "491682X1349X14540SQ001", limit: 5
    t.string "491682X1349X14540SQ002", limit: 5
    t.string "491682X1349X14540SQ003", limit: 5
    t.string "491682X1349X14540SQ004", limit: 5
    t.string "491682X1349X14540SQ005", limit: 5
    t.string "491682X1349X14540SQ006", limit: 5
    t.text "491682X1349X14541"
    t.text "491682X1349X14542"
    t.text "491682X1349X14543"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_491682_37201"
  end

  create_table "lime_survey_492174", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "492174X1344X14501StudentYear"
    t.text "492174X1344X14501StudentEmail"
    t.text "492174X1344X14501StudentName"
    t.text "492174X1344X14501CoachEmail"
    t.text "492174X1344X14501CoachName"
    t.text "492174X1343X14500"
    t.integer "492174X1343X14500_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_492174_26257"
  end

  create_table "lime_survey_492244", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "492244X149X2141", limit: 255
    t.string "492244X149X2142", limit: 255
    t.string "492244X149X2143", limit: 255
    t.string "492244X140X2132PatientCare1", limit: 5
    t.string "492244X140X2132PatientCare2", limit: 5
    t.string "492244X140X2132PatientCare3", limit: 5
    t.string "492244X140X2132PatientCare4", limit: 5
    t.string "492244X140X2132PatientCare5", limit: 5
    t.string "492244X140X2132PatientCare6", limit: 5
    t.string "492244X140X2132PatientCare7", limit: 5
    t.string "492244X140X2132PatientCare8", limit: 5
    t.string "492244X140X2132PatientCare9", limit: 5
    t.string "492244X141X2133KnowledgePractice1", limit: 5
    t.string "492244X141X2133KnowledgePractice2", limit: 5
    t.string "492244X142X2134PracticeBasedLM1", limit: 5
    t.string "492244X142X2134PracticeBasedLM2", limit: 5
    t.string "492244X142X2134PracticeBasedLM3", limit: 5
    t.string "492244X142X2134PracticeBasedLM4", limit: 5
    t.string "492244X143X2135InterpersonalComm1", limit: 5
    t.string "492244X144X2136Prof1", limit: 5
    t.string "492244X144X2136Prof2", limit: 5
    t.string "492244X145X2137SystemsBasedPrac1", limit: 5
    t.string "492244X145X2137SystemsBasedPrac2", limit: 5
    t.string "492244X145X2137SystemsBasedPrac3", limit: 5
    t.string "492244X146X2138OtherLearner1", limit: 5
    t.string "492244X147X2139OverallRating1", limit: 5
    t.text "492244X148X2140"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_492244_34347"
  end

  create_table "lime_survey_493992", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "493992X194X2412StudentYear"
    t.text "493992X194X2412StudentEmail"
    t.text "493992X194X2412StudentName"
    t.text "493992X194X2412CoachEmail"
    t.text "493992X194X2412CoachName"
    t.text "493992X195X2413"
    t.integer "493992X195X2413_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_493992_18236"
  end

  create_table "lime_survey_495231", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "495231X488X5456", limit: 5
    t.text "495231X488X5457"
    t.string "495231X485X5450Clarify", limit: 5
    t.string "495231X485X5450Represents", limit: 5
    t.string "495231X485X5450Responsible", limit: 5
    t.string "495231X485X5450Inspire", limit: 5
    t.string "495231X485X5450Determine", limit: 5
    t.string "495231X485X5450Active", limit: 5
    t.string "495231X485X5450Honest", limit: 5
    t.string "495231X486X5451SeekAndHear", limit: 5
    t.string "495231X486X5451LearnAbout", limit: 5
    t.string "495231X486X5451ConveyAny", limit: 5
    t.string "495231X486X5451DevelopAShared", limit: 5
    t.string "495231X486X5451SpecificMeasurable", limit: 5
    t.string "495231X486X5451WorkWithYourStudent", limit: 5
    t.string "495231X486X5451OrganizeInterpret", limit: 5
    t.string "495231X486X5451DetermineTimelines", limit: 5
    t.string "495231X486X5451MonitorYourProgress", limit: 5
    t.string "495231X486X5451IdentifyProblems", limit: 5
    t.string "495231X486X5451SolveProblems", limit: 5
    t.string "495231X486X5451Characterize", limit: 5
    t.text "495231X487X5452"
    t.text "495231X487X5453"
    t.text "495231X484X5449"
    t.text "495231X484X5455"
    t.text "495231X484X5454"
    t.text "495231X484X5458"
    t.text "495231X484X5459"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_495231_3088"
  end

  create_table "lime_survey_497227", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "497227X1330X14376StudentEmail"
    t.text "497227X1330X14376StudentName"
    t.text "497227X1330X14376StudentID"
    t.text "497227X1330X14376CoachEmail"
    t.text "497227X1330X14376CoachName"
    t.string "497227X1331X14370RateYourHealth4Weeks", limit: 5
    t.string "497227X1331X14371ProblemsWalking", limit: 5
    t.string "497227X1331X14371DifficultDailyWork", limit: 5
    t.string "497227X1331X14371EmotionsProb", limit: 5
    t.string "497227X1331X14371PersonalProbUsualWor", limit: 5
    t.string "497227X1331X14372BodilyPain", limit: 5
    t.string "497227X1331X14373Past4WeekEnergyLevel", limit: 5
    t.string "497227X1331X14374BotheredEmotionalPro", limit: 5
    t.string "497227X1332X14375BennUpset", limit: 5
    t.string "497227X1332X14375UnableControl", limit: 5
    t.string "497227X1332X14375FeltNervous", limit: 5
    t.string "497227X1332X14375FeltConfident", limit: 5
    t.string "497227X1332X14375FeltGoingYourWay", limit: 5
    t.string "497227X1332X14375CouldNotCope", limit: 5
    t.string "497227X1332X14375AbleToControl", limit: 5
    t.string "497227X1332X14375OnTopOfThings", limit: 5
    t.string "497227X1332X14375BeenAngered", limit: 5
    t.string "497227X1332X14375PilingUpHigh", limit: 5
    t.index ["token"], name: "idx_survey_token_497227_5975"
  end

  create_table "lime_survey_499971", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "499971X402X4393StudentEmail"
    t.text "499971X402X4393StudentName"
    t.text "499971X402X4393StudentID"
    t.text "499971X402X4393CoachEmail"
    t.text "499971X402X4393CoachName"
    t.string "499971X403X4387RateYourHealth4Weeks", limit: 5
    t.string "499971X403X4388ProblemsWalking", limit: 5
    t.string "499971X403X4388DifficultDailyWork", limit: 5
    t.string "499971X403X4388EmotionsProb", limit: 5
    t.string "499971X403X4388PersonalProbUsualWor", limit: 5
    t.string "499971X403X4389BodilyPain", limit: 5
    t.string "499971X403X4390Past4WeekEnergyLevel", limit: 5
    t.string "499971X403X4391BotheredEmotionalPro", limit: 5
    t.string "499971X404X4392BennUpset", limit: 5
    t.string "499971X404X4392UnableControl", limit: 5
    t.string "499971X404X4392FeltNervous", limit: 5
    t.string "499971X404X4392FeltConfident", limit: 5
    t.string "499971X404X4392FeltGoingYourWay", limit: 5
    t.string "499971X404X4392CouldNotCope", limit: 5
    t.string "499971X404X4392AbleToControl", limit: 5
    t.string "499971X404X4392OnTopOfThings", limit: 5
    t.string "499971X404X4392BeenAngered", limit: 5
    t.string "499971X404X4392PilingUpHigh", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_499971_40900"
  end

  create_table "lime_survey_511677", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "511677X871X9741StudentYear"
    t.text "511677X871X9741StudentEmail"
    t.text "511677X871X9741StudentName"
    t.text "511677X871X9741CoachEmail"
    t.text "511677X871X9741CoachName"
    t.text "511677X868X9717FirstName"
    t.text "511677X868X9717LastName"
    t.text "511677X868X9717Address1"
    t.text "511677X868X9717Address2"
    t.text "511677X868X9717City"
    t.text "511677X868X9717State"
    t.text "511677X868X9717ZipCode"
    t.text "511677X868X9717HomePhone"
    t.text "511677X868X9717MobilePhone"
    t.datetime "511677X868X9718", precision: nil
    t.string "511677X868X9719", limit: 5
    t.text "511677X868X9719other"
    t.string "511677X868X9720", limit: 5
    t.text "511677X868X9720other"
    t.string "511677X868X9721", limit: 5
    t.string "511677X868X97221", limit: 5
    t.string "511677X868X97222", limit: 5
    t.string "511677X868X97223", limit: 5
    t.string "511677X868X97224", limit: 5
    t.string "511677X868X97225", limit: 5
    t.text "511677X868X9722other"
    t.string "511677X868X9723", limit: 5
    t.string "511677X868X9737", limit: 1
    t.text "511677X868X9724Child1_Age1"
    t.text "511677X868X9724Child2_Age1"
    t.text "511677X868X9724Child3_Age1"
    t.text "511677X868X9724Child4_Age1"
    t.text "511677X868X9724Child5_Age1"
    t.text "511677X868X9725City"
    t.text "511677X868X9725State"
    t.text "511677X868X9725Country"
    t.text "511677X868X9726City"
    t.text "511677X868X9726State"
    t.text "511677X868X9726Country"
    t.text "511677X868X9738Hobby1"
    t.text "511677X868X9738Hobby2"
    t.text "511677X868X9738Hobby3"
    t.decimal "511677X869X9727", precision: 30, scale: 10
    t.text "511677X869X9728Row1_Institution"
    t.text "511677X869X9728Row1_DegreeAttained"
    t.text "511677X869X9728Row1_MajorAreaStudy"
    t.text "511677X869X9728Row1_MinorAreaStudy"
    t.text "511677X869X9728Row1_YrGrad"
    t.text "511677X869X9728Row1_ScienceCoursesHrs"
    t.text "511677X869X9728Row1_ScienceCoursesGPA"
    t.text "511677X869X9728Row1_OverallGPA"
    t.text "511677X869X9728Row2_Institution"
    t.text "511677X869X9728Row2_DegreeAttained"
    t.text "511677X869X9728Row2_MajorAreaStudy"
    t.text "511677X869X9728Row2_MinorAreaStudy"
    t.text "511677X869X9728Row2_YrGrad"
    t.text "511677X869X9728Row2_ScienceCoursesHrs"
    t.text "511677X869X9728Row2_ScienceCoursesGPA"
    t.text "511677X869X9728Row2_OverallGPA"
    t.text "511677X869X9728Row3_Institution"
    t.text "511677X869X9728Row3_DegreeAttained"
    t.text "511677X869X9728Row3_MajorAreaStudy"
    t.text "511677X869X9728Row3_MinorAreaStudy"
    t.text "511677X869X9728Row3_YrGrad"
    t.text "511677X869X9728Row3_ScienceCoursesHrs"
    t.text "511677X869X9728Row3_ScienceCoursesGPA"
    t.text "511677X869X9728Row3_OverallGPA"
    t.text "511677X869X9728Row4_Institution"
    t.text "511677X869X9728Row4_DegreeAttained"
    t.text "511677X869X9728Row4_MajorAreaStudy"
    t.text "511677X869X9728Row4_MinorAreaStudy"
    t.text "511677X869X9728Row4_YrGrad"
    t.text "511677X869X9728Row4_ScienceCoursesHrs"
    t.text "511677X869X9728Row4_ScienceCoursesGPA"
    t.text "511677X869X9728Row4_OverallGPA"
    t.text "511677X869X9729Row1_YrMCAT"
    t.text "511677X869X9729Row1_PhsySciences"
    t.text "511677X869X9729Row1_VerbalReasoning"
    t.text "511677X869X9729Row1_BioSciences"
    t.text "511677X869X9729Row1_MCATTotScore"
    t.text "511677X869X9729Row2_YrMCAT"
    t.text "511677X869X9729Row2_PhsySciences"
    t.text "511677X869X9729Row2_VerbalReasoning"
    t.text "511677X869X9729Row2_BioSciences"
    t.text "511677X869X9729Row2_MCATTotScore"
    t.text "511677X869X9729Row3_YrMCAT"
    t.text "511677X869X9729Row3_PhsySciences"
    t.text "511677X869X9729Row3_VerbalReasoning"
    t.text "511677X869X9729Row3_BioSciences"
    t.text "511677X869X9729Row3_MCATTotScore"
    t.text "511677X869X9730Row1_YrMCAT"
    t.text "511677X869X9730Row1_ChemPhyBioSys"
    t.text "511677X869X9730Row1_CriticalAnalysis"
    t.text "511677X869X9730Row1_BioFoundOfLivingSys"
    t.text "511677X869X9730Row1_PsychSocBioFoundOfBe"
    t.text "511677X869X9730Row1_MCATTotScore"
    t.text "511677X869X9730Row2_YrMCAT"
    t.text "511677X869X9730Row2_ChemPhyBioSys"
    t.text "511677X869X9730Row2_CriticalAnalysis"
    t.text "511677X869X9730Row2_BioFoundOfLivingSys"
    t.text "511677X869X9730Row2_PsychSocBioFoundOfBe"
    t.text "511677X869X9730Row2_MCATTotScore"
    t.text "511677X869X9730Row3_YrMCAT"
    t.text "511677X869X9730Row3_ChemPhyBioSys"
    t.text "511677X869X9730Row3_CriticalAnalysis"
    t.text "511677X869X9730Row3_BioFoundOfLivingSys"
    t.text "511677X869X9730Row3_PsychSocBioFoundOfBe"
    t.text "511677X869X9730Row3_MCATTotScore"
    t.text "511677X869X9739"
    t.string "511677X869X9731", limit: 5
    t.text "511677X869X9732Row1_HealthcareSetting"
    t.text "511677X869X9732Row1_CountryServed"
    t.text "511677X869X9732Row1_Role"
    t.text "511677X869X9732Row1_InclusiveYrs"
    t.text "511677X869X9732Row2_HealthcareSetting"
    t.text "511677X869X9732Row2_CountryServed"
    t.text "511677X869X9732Row2_Role"
    t.text "511677X869X9732Row2_InclusiveYrs"
    t.text "511677X869X9732Row3_HealthcareSetting"
    t.text "511677X869X9732Row3_CountryServed"
    t.text "511677X869X9732Row3_Role"
    t.text "511677X869X9732Row3_InclusiveYrs"
    t.text "511677X869X9740Experience1"
    t.text "511677X869X9740Experience2"
    t.text "511677X869X9740Experience3"
    t.string "511677X869X9733", limit: 5
    t.string "511677X869X97341", limit: 5
    t.string "511677X869X97342", limit: 5
    t.string "511677X869X97343", limit: 5
    t.string "511677X869X97344", limit: 5
    t.string "511677X869X97345", limit: 5
    t.string "511677X869X97346", limit: 5
    t.string "511677X869X97347", limit: 5
    t.string "511677X869X97348", limit: 5
    t.string "511677X869X97349", limit: 5
    t.string "511677X869X973410", limit: 5
    t.string "511677X869X973411", limit: 5
    t.string "511677X869X973412", limit: 5
    t.string "511677X869X973413", limit: 5
    t.string "511677X869X973414", limit: 5
    t.string "511677X869X973415", limit: 5
    t.string "511677X869X973416", limit: 5
    t.string "511677X869X973417", limit: 5
    t.string "511677X869X973418", limit: 5
    t.string "511677X869X973419", limit: 5
    t.string "511677X869X973420", limit: 5
    t.string "511677X869X973421", limit: 5
    t.string "511677X869X973422", limit: 5
    t.string "511677X869X973423", limit: 5
    t.string "511677X870X97351", limit: 5
    t.string "511677X870X97352", limit: 5
    t.string "511677X870X97353", limit: 5
    t.string "511677X870X97354", limit: 5
    t.string "511677X870X97355", limit: 5
    t.string "511677X870X97356", limit: 5
    t.string "511677X870X97357", limit: 5
    t.decimal "511677X870X9736NoOfAdults", precision: 30, scale: 10
    t.decimal "511677X870X9736NoOfChildrens", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_511677_4958"
  end

  create_table "lime_survey_515521", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "515521X879X9880", limit: 1
    t.text "515521X879X9867"
    t.string "515521X879X9853SQ001", limit: 5
    t.string "515521X879X9854", limit: 5
    t.string "515521X879X9855", limit: 1
    t.string "515521X879X9856", limit: 5
    t.text "515521X879X9856other"
    t.string "515521X879X9881", limit: 5
    t.text "515521X879X9881other"
    t.string "515521X879X9857", limit: 1
    t.string "515521X879X9858", limit: 5
    t.text "515521X879X9858other"
    t.string "515521X879X9859", limit: 1
    t.string "515521X879X98611", limit: 5
    t.string "515521X879X98612", limit: 5
    t.string "515521X879X98613", limit: 5
    t.string "515521X879X98614", limit: 5
    t.string "515521X879X98615", limit: 5
    t.text "515521X879X9861other"
    t.string "515521X879X9862HowHelpful", limit: 5
    t.text "515521X879X9865"
    t.string "515521X879X9868Module1", limit: 5
    t.string "515521X879X9868Module2", limit: 5
    t.string "515521X879X9868Module3", limit: 5
    t.string "515521X879X9868Module4", limit: 5
    t.string "515521X879X9868Module5", limit: 5
    t.text "515521X880X9866StudentYear"
    t.text "515521X880X9866StudentEmail"
    t.text "515521X880X9866StudentName"
    t.text "515521X880X9866CoachEmail"
    t.text "515521X880X9866CoachName"
    t.string "515521X881X9869SQ001", limit: 5
    t.string "515521X881X9870SQ001", limit: 5
    t.string "515521X881X9871", limit: 5
    t.text "515521X881X9871other"
    t.string "515521X881X9872", limit: 1
    t.string "515521X881X9874SQ001", limit: 5
    t.string "515521X881X9874SQ002", limit: 5
    t.string "515521X881X9874SQ003", limit: 5
    t.string "515521X881X9874SQ004", limit: 5
    t.string "515521X881X9874SQ005", limit: 5
    t.string "515521X881X9875SQ001", limit: 5
    t.string "515521X881X9878", limit: 5
    t.text "515521X881X9878other"
    t.text "515521X881X9879"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_515521_6114"
  end

  create_table "lime_survey_515521_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "515521X879time"
    t.float "515521X879X9880time"
    t.float "515521X879X9867time"
    t.float "515521X879X9853time"
    t.float "515521X879X9854time"
    t.float "515521X879X9855time"
    t.float "515521X879X9856time"
    t.float "515521X879X9881time"
    t.float "515521X879X9857time"
    t.float "515521X879X9858time"
    t.float "515521X879X9859time"
    t.float "515521X879X9861time"
    t.float "515521X879X9862time"
    t.float "515521X879X9865time"
    t.float "515521X879X9868time"
    t.float "515521X880time"
    t.float "515521X880X9866time"
    t.float "515521X881time"
    t.float "515521X881X9869time"
    t.float "515521X881X9870time"
    t.float "515521X881X9871time"
    t.float "515521X881X9872time"
    t.float "515521X881X9874time"
    t.float "515521X881X9875time"
    t.float "515521X881X9878time"
    t.float "515521X881X9879time"
  end

  create_table "lime_survey_515866", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "515866X1X1SQ001", limit: 5
    t.string "515866X1X2SQ001", limit: 5
    t.string "515866X1X3", limit: 5
    t.text "515866X1X3other"
    t.string "515866X1X4", limit: 1
    t.string "515866X1X5", limit: 5
    t.text "515866X1X5other"
    t.string "515866X1X6SQ001", limit: 5
    t.string "515866X1X6SQ002", limit: 5
    t.string "515866X1X6SQ003", limit: 5
    t.string "515866X1X6SQ004", limit: 5
    t.string "515866X1X6SQ005", limit: 5
    t.string "515866X1X6SQ006", limit: 5
    t.string "515866X1X6SQ007", limit: 5
    t.string "515866X1X6SQ008", limit: 5
    t.string "515866X1X6SQ009", limit: 5
    t.string "515866X1X7SQ001", limit: 5
    t.string "515866X1X8SQ001", limit: 5
    t.string "515866X1X8SQ002", limit: 5
    t.string "515866X1X8SQ003", limit: 5
    t.string "515866X1X8SQ004", limit: 5
    t.string "515866X1X8SQ005", limit: 5
    t.string "515866X1X8SQ006", limit: 5
    t.string "515866X1X9", limit: 5
    t.string "515866X1X10", limit: 5
    t.text "515866X1X10other"
    t.text "515866X1X11"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_515866_44125"
  end

  create_table "lime_survey_515866_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "515866X1time"
    t.float "515866X1X1time"
    t.float "515866X1X2time"
    t.float "515866X1X3time"
    t.float "515866X1X4time"
    t.float "515866X1X5time"
    t.float "515866X1X6time"
    t.float "515866X1X7time"
    t.float "515866X1X8time"
    t.float "515866X1X9time"
    t.float "515866X1X10time"
    t.float "515866X1X11time"
  end

  create_table "lime_survey_519686", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.decimal "519686X233X2841", precision: 30, scale: 10
    t.text "519686X233X2842"
    t.decimal "519686X233X2843Comp1", precision: 30, scale: 10
    t.decimal "519686X233X2843Comp2", precision: 30, scale: 10
    t.decimal "519686X233X2843Comp3", precision: 30, scale: 10
    t.decimal "519686X233X2843Comp4", precision: 30, scale: 10
    t.decimal "519686X233X2843Comp5", precision: 30, scale: 10
    t.text "519686X234X2849"
    t.text "519686X234X2850"
    t.text "519686X234X2851"
    t.text "519686X234X2852"
    t.text "519686X234X2853"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_519686_7060"
  end

  create_table "lime_survey_521515", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "521515X759X8951StudentYear"
    t.text "521515X759X8951StudentEmail"
    t.text "521515X759X8951StudentName"
    t.text "521515X759X8951CoachEmail"
    t.text "521515X759X8951CoachName"
    t.text "521515X764X8956PreceptorName"
    t.text "521515X764X8956SubmitDate"
    t.text "521515X764X8956Grade"
    t.text "521515X764X8956Term"
    t.string "521515X760X8952SBP1", limit: 5
    t.string "521515X760X8952SBP2", limit: 5
    t.string "521515X760X8952SBP3", limit: 5
    t.string "521515X760X8952SBP4", limit: 5
    t.string "521515X761X8953PBL1", limit: 5
    t.string "521515X761X8953PBL2", limit: 5
    t.string "521515X761X8953PBL3", limit: 5
    t.string "521515X761X8953PBL4", limit: 5
    t.string "521515X762X8954PROF1", limit: 5
    t.string "521515X762X8954PROF2", limit: 5
    t.string "521515X762X8954PROF3", limit: 5
    t.string "521515X762X8954PROF4", limit: 5
    t.string "521515X763X8955ICS1", limit: 5
    t.string "521515X763X8955ICS2", limit: 5
    t.string "521515X763X8955ICS3", limit: 5
    t.string "521515X763X8955ICS4", limit: 5
    t.text "521515X765X8957"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_521515_17573"
  end

  create_table "lime_survey_523595", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "523595X1212X13621SQ001", limit: 5
    t.string "523595X1212X13621SQ003", limit: 5
    t.string "523595X1212X13621SQ002", limit: 5
    t.string "523595X1212X13621SQ004", limit: 5
    t.text "523595X1212X13626"
    t.string "523595X1213X13622SQ001", limit: 5
    t.string "523595X1213X13622SQ002", limit: 5
    t.string "523595X1213X13622SQ003", limit: 5
    t.string "523595X1213X13622SQ004", limit: 5
    t.text "523595X1213X13627"
    t.string "523595X1214X13623SQ001", limit: 5
    t.string "523595X1214X13623SQ002", limit: 5
    t.text "523595X1214X13628"
    t.string "523595X1214X14124SQ001", limit: 5
    t.text "523595X1215X13624"
    t.text "523595X1215X13625"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_523595_26225"
  end

  create_table "lime_survey_529666", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "529666X1446X15537StudentYear"
    t.text "529666X1446X15537StudentEmail"
    t.text "529666X1446X15537StudentName"
    t.text "529666X1446X15537CoachEmail"
    t.text "529666X1446X15537CoachName"
    t.text "529666X1442X15522"
    t.text "529666X1442X15525"
    t.text "529666X1444X15524"
    t.string "529666X1445X15526", limit: 5
    t.text "529666X1445X15527"
    t.string "529666X1443X15523C1", limit: 5
    t.string "529666X1443X15523C2", limit: 5
    t.string "529666X1443X15523C3", limit: 5
    t.string "529666X1443X15523C4", limit: 5
    t.string "529666X1443X15523C5", limit: 5
    t.string "529666X1443X15523C6", limit: 5
    t.string "529666X1443X15523C7", limit: 5
    t.string "529666X1443X15523C8", limit: 5
    t.string "529666X1443X15523C9", limit: 5
    t.index ["token"], name: "idx_survey_token_529666_5350"
  end

  create_table "lime_survey_533729", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "533729X1463X15758StudentYear"
    t.text "533729X1463X15758StudentEmail"
    t.text "533729X1463X15758StudentName"
    t.text "533729X1463X15758CoachEmail"
    t.text "533729X1463X15758CoachName"
    t.text "533729X1468X15763PreceptorName"
    t.text "533729X1468X15763SubmitDate"
    t.text "533729X1468X15763Grade"
    t.text "533729X1468X15763Term"
    t.text "533729X1469X15765"
    t.text "533729X1469X15766"
    t.text "533729X1469X15764"
    t.string "533729X1467X15762ICS1", limit: 5
    t.string "533729X1467X15762ICS2", limit: 5
    t.string "533729X1467X15762ICS4", limit: 5
    t.string "533729X1467X15762ICS6", limit: 5
    t.string "533729X1467X15762ICS7", limit: 5
    t.string "533729X1465X15760PBLI1", limit: 5
    t.string "533729X1465X15760PBLI8", limit: 5
    t.string "533729X1466X15761PPPD1", limit: 5
    t.string "533729X1466X15761PPPD2", limit: 5
    t.string "533729X1466X15761PPPD6", limit: 5
    t.string "533729X1466X15761PPPD9", limit: 5
    t.string "533729X1464X15759SBPIC2", limit: 5
    t.string "533729X1464X15759SBPIC4", limit: 5
    t.string "533729X1464X15759SBPIC5", limit: 5
    t.index ["token"], name: "idx_survey_token_533729_41906"
  end

  create_table "lime_survey_533935", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "533935X1327X14346StudentEmail"
    t.text "533935X1327X14346StudentName"
    t.text "533935X1327X14346StudentID"
    t.text "533935X1327X14346CoachEmail"
    t.text "533935X1327X14346CoachName"
    t.string "533935X1328X14340RateYourHealth4Weeks", limit: 5
    t.string "533935X1328X14341ProblemsWalking", limit: 5
    t.string "533935X1328X14341DifficultDailyWork", limit: 5
    t.string "533935X1328X14341EmotionsProb", limit: 5
    t.string "533935X1328X14341PersonalProbUsualWor", limit: 5
    t.string "533935X1328X14342BodilyPain", limit: 5
    t.string "533935X1328X14343Past4WeekEnergyLevel", limit: 5
    t.string "533935X1328X14344BotheredEmotionalPro", limit: 5
    t.string "533935X1329X14345BennUpset", limit: 5
    t.string "533935X1329X14345UnableControl", limit: 5
    t.string "533935X1329X14345FeltNervous", limit: 5
    t.string "533935X1329X14345FeltConfident", limit: 5
    t.string "533935X1329X14345FeltGoingYourWay", limit: 5
    t.string "533935X1329X14345CouldNotCope", limit: 5
    t.string "533935X1329X14345AbleToControl", limit: 5
    t.string "533935X1329X14345OnTopOfThings", limit: 5
    t.string "533935X1329X14345BeenAngered", limit: 5
    t.string "533935X1329X14345PilingUpHigh", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_533935_47483"
  end

  create_table "lime_survey_539178", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "539178X1269X13906SQ001", limit: 5
    t.string "539178X1269X13906SQ002", limit: 5
    t.string "539178X1269X13906SQ003", limit: 5
    t.string "539178X1269X13906SQ004", limit: 5
    t.text "539178X1269X13907"
    t.text "539178X1269X13908"
    t.string "539178X1270X13909SQ001", limit: 5
    t.string "539178X1270X13910SQ001", limit: 5
    t.string "539178X1270X13910SQ002", limit: 5
    t.string "539178X1270X13910SQ003", limit: 5
    t.string "539178X1270X13910SQ004", limit: 5
    t.text "539178X1270X13913"
    t.text "539178X1270X13914"
    t.string "539178X1271X13911SQ001", limit: 5
    t.string "539178X1271X13912SQ001", limit: 5
    t.string "539178X1271X13912SQ002", limit: 5
    t.string "539178X1271X13912SQ003", limit: 5
    t.string "539178X1271X13912SQ004", limit: 5
    t.text "539178X1271X13915"
    t.text "539178X1271X13916"
    t.string "539178X1272X13917SQ001", limit: 5
    t.string "539178X1272X13917SQ002", limit: 5
    t.string "539178X1273X13918SQ001", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_539178_48555"
  end

  create_table "lime_survey_541377", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "541377X957X10569", limit: 5
    t.text "541377X957X10570"
    t.string "541377X954X10563Commit", limit: 5
    t.string "541377X954X10563Responsible", limit: 5
    t.string "541377X954X10563Inspire", limit: 5
    t.string "541377X954X10563Active", limit: 5
    t.string "541377X954X10563Honest", limit: 5
    t.string "541377X955X10564LearnAbout", limit: 5
    t.string "541377X955X10564ConveyAny", limit: 5
    t.string "541377X955X10564DevelopAShared", limit: 5
    t.string "541377X955X10564SpecificMeasurable", limit: 5
    t.string "541377X955X10564WorkWithYourStudent", limit: 5
    t.string "541377X955X10564OrganizeInterpret", limit: 5
    t.string "541377X955X10564MonitorYourProgress", limit: 5
    t.string "541377X955X10564IdentifyProblems", limit: 5
    t.string "541377X955X10564SolveProblems", limit: 5
    t.string "541377X955X10564Characterize", limit: 5
    t.text "541377X956X10565"
    t.text "541377X956X10566"
    t.text "541377X953X10562"
    t.text "541377X953X10568"
    t.text "541377X953X10567"
    t.text "541377X953X10571"
    t.text "541377X953X10572"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_541377_48253"
  end

  create_table "lime_survey_543187", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "543187X1095X13048SQ001"
    t.text "543187X1095X13048SQ002"
    t.text "543187X1095X13048SQ003"
    t.string "543187X1086X13039PatientCare1", limit: 5
    t.string "543187X1086X13039PatientCare2", limit: 5
    t.string "543187X1086X13039PatientCare3", limit: 5
    t.string "543187X1086X13039PatientCare4", limit: 5
    t.string "543187X1086X13039PatientCare5", limit: 5
    t.string "543187X1086X13039PatientCare6", limit: 5
    t.string "543187X1086X13039PatientCare7", limit: 5
    t.string "543187X1086X13039PatientCare8", limit: 5
    t.string "543187X1086X13039PatientCare9", limit: 5
    t.string "543187X1087X13040KnowledgePractice1", limit: 5
    t.string "543187X1087X13040KnowledgePractice2", limit: 5
    t.string "543187X1088X13041PracticeBasedLM1", limit: 5
    t.string "543187X1088X13041PracticeBasedLM2", limit: 5
    t.string "543187X1088X13041PracticeBasedLM3", limit: 5
    t.string "543187X1088X13041PracticeBasedLM4", limit: 5
    t.string "543187X1089X13042InterpersonalComm1", limit: 5
    t.string "543187X1090X13043Prof1", limit: 5
    t.string "543187X1090X13043Prof2", limit: 5
    t.string "543187X1091X13044SystemsBasedPrac1", limit: 5
    t.string "543187X1091X13044SystemsBasedPrac2", limit: 5
    t.string "543187X1091X13044SystemsBasedPrac3", limit: 5
    t.string "543187X1092X13045OtherLearner1", limit: 5
    t.string "543187X1093X13046OverallRating1", limit: 5
    t.text "543187X1094X13047"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_543187_45505"
  end

  create_table "lime_survey_546189", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "546189X1289X14044SQ001", limit: 5
    t.string "546189X1289X14044SQ002", limit: 5
    t.string "546189X1289X14044SQ003", limit: 5
    t.string "546189X1289X14044SQ004", limit: 5
    t.string "546189X1289X14044SQ005", limit: 5
    t.string "546189X1289X14044SQ006", limit: 5
    t.string "546189X1289X14044SQ007", limit: 5
    t.string "546189X1289X14044SQ008", limit: 5
    t.string "546189X1289X14044SQ009", limit: 5
    t.string "546189X1289X14044SQ010", limit: 5
    t.string "546189X1289X14044SQ011", limit: 5
    t.string "546189X1289X14044SQ012", limit: 5
    t.string "546189X1289X14044SQ013", limit: 5
    t.string "546189X1289X14044SQ014", limit: 5
    t.string "546189X1289X14044SQ015", limit: 5
    t.text "546189X1290X14045"
    t.text "546189X1290X14046"
    t.string "546189X1291X14047SQ001", limit: 5
    t.string "546189X1291X14048SQ001", limit: 5
    t.string "546189X1291X14048SQ002", limit: 5
    t.string "546189X1291X14048SQ003", limit: 5
    t.string "546189X1291X14048SQ004", limit: 5
    t.text "546189X1291X14050"
    t.text "546189X1291X14051"
    t.string "546189X1292X14049SQ001", limit: 5
    t.string "546189X1292X14052SQ001", limit: 5
    t.string "546189X1292X14052SQ002", limit: 5
    t.string "546189X1292X14052SQ003", limit: 5
    t.string "546189X1292X14052SQ004", limit: 5
    t.text "546189X1292X14053"
    t.text "546189X1292X14054"
    t.string "546189X1293X14055SQ001", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_546189_23872"
  end

  create_table "lime_survey_555987", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "555987X912X10331"
    t.text "555987X912X10332"
    t.text "555987X912X10338"
    t.text "555987X912X10339"
    t.text "555987X912X10340"
    t.text "555987X912X10341"
    t.string "555987X913X10333Represents", limit: 5
    t.string "555987X913X10333Responsible", limit: 5
    t.string "555987X913X10333Determine", limit: 5
    t.string "555987X913X10333Active", limit: 5
    t.string "555987X914X10334LearnAbout", limit: 5
    t.string "555987X914X10334AcceptAny", limit: 5
    t.string "555987X914X10334DevelopAShared", limit: 5
    t.string "555987X914X10334SpecificMeasurable", limit: 5
    t.string "555987X914X10334WorkWithYourCoach", limit: 5
    t.string "555987X915X10335RecognizePersFeeling", limit: 5
    t.string "555987X915X10335AwareOfEmotions", limit: 5
    t.string "555987X915X10335InvestigateBehavior", limit: 5
    t.string "555987X915X10335MyThinkingHabits", limit: 5
    t.string "555987X915X10335SafeLearningEnv", limit: 5
    t.string "555987X915X10335Commitment", limit: 5
    t.string "555987X915X10335Affirms", limit: 5
    t.string "555987X915X10335esLearningPrStimulat", limit: 5
    t.string "555987X915X10335Encourages", limit: 5
    t.text "555987X916X10336"
    t.text "555987X916X10337"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_555987_14200"
  end

  create_table "lime_survey_555987_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "555987X912time"
    t.float "555987X912X10331time"
    t.float "555987X912X10332time"
    t.float "555987X912X10338time"
    t.float "555987X912X10339time"
    t.float "555987X912X10340time"
    t.float "555987X912X10341time"
    t.float "555987X913time"
    t.float "555987X913X10333time"
    t.float "555987X914time"
    t.float "555987X914X10334time"
    t.float "555987X915time"
    t.float "555987X915X10335time"
    t.float "555987X916time"
    t.float "555987X916X10336time"
    t.float "555987X916X10337time"
  end

  create_table "lime_survey_558829", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.decimal "558829X1044X12607SQ001", precision: 30, scale: 10
    t.decimal "558829X1044X12607SQ002", precision: 30, scale: 10
    t.decimal "558829X1044X12607SQ003", precision: 30, scale: 10
    t.decimal "558829X1044X12607SQ004", precision: 30, scale: 10
    t.decimal "558829X1044X12612SQ001", precision: 30, scale: 10
    t.decimal "558829X1044X12612SQ002", precision: 30, scale: 10
    t.decimal "558829X1044X12612SQ003", precision: 30, scale: 10
    t.decimal "558829X1044X12612SQ004", precision: 30, scale: 10
    t.decimal "558829X1044X12617SQ001", precision: 30, scale: 10
    t.decimal "558829X1044X12617SQ002", precision: 30, scale: 10
    t.decimal "558829X1044X12617SQ003", precision: 30, scale: 10
    t.decimal "558829X1044X12617SQ004", precision: 30, scale: 10
    t.decimal "558829X1044X12622SQ001", precision: 30, scale: 10
    t.decimal "558829X1044X12622SQ002", precision: 30, scale: 10
    t.decimal "558829X1044X12622SQ003", precision: 30, scale: 10
    t.decimal "558829X1044X12622SQ004", precision: 30, scale: 10
    t.decimal "558829X1044X12627SQ001", precision: 30, scale: 10
    t.decimal "558829X1044X12627SQ002", precision: 30, scale: 10
    t.decimal "558829X1044X12627SQ003", precision: 30, scale: 10
    t.decimal "558829X1044X12627SQ004", precision: 30, scale: 10
    t.decimal "558829X1044X12632SQ001", precision: 30, scale: 10
    t.decimal "558829X1044X12632SQ002", precision: 30, scale: 10
    t.decimal "558829X1044X12632SQ003", precision: 30, scale: 10
    t.decimal "558829X1044X12632SQ004", precision: 30, scale: 10
    t.text "558829X1044X12637SQ001_Med18"
    t.text "558829X1044X12637SQ001_Med19"
    t.text "558829X1044X12637SQ001_Med20"
    t.text "558829X1044X12637SQ001_Med21"
    t.text "558829X1044X12637SQ002_Med18"
    t.text "558829X1044X12637SQ002_Med19"
    t.text "558829X1044X12637SQ002_Med20"
    t.text "558829X1044X12637SQ002_Med21"
    t.text "558829X1044X12637SQ003_Med18"
    t.text "558829X1044X12637SQ003_Med19"
    t.text "558829X1044X12637SQ003_Med20"
    t.text "558829X1044X12637SQ003_Med21"
    t.text "558829X1044X12637SQ004_Med18"
    t.text "558829X1044X12637SQ004_Med19"
    t.text "558829X1044X12637SQ004_Med20"
    t.text "558829X1044X12637SQ004_Med21"
    t.text "558829X1044X12643SQ001"
    t.text "558829X1044X12643SQ002"
    t.text "558829X1044X12643SQ003"
    t.text "558829X1044X12643SQ004"
    t.string "558829X1044X12648SQ001", limit: 5
    t.string "558829X1044X12648SQ002", limit: 5
    t.string "558829X1044X12648SQ003", limit: 5
    t.string "558829X1044X12648SQ004", limit: 5
    t.string "558829X1045X12653SQ001", limit: 5
    t.string "558829X1045X12653SQ002", limit: 5
    t.string "558829X1045X12653SQ003", limit: 5
    t.string "558829X1045X12653SQ004", limit: 5
    t.string "558829X1045X12653SQ005", limit: 5
    t.string "558829X1045X12653SQ006", limit: 5
    t.string "558829X1045X12653SQ007", limit: 5
    t.string "558829X1045X12661SQ001", limit: 5
    t.string "558829X1045X12661SQ002", limit: 5
    t.string "558829X1045X12661SQ003", limit: 5
    t.string "558829X1045X12661SQ004", limit: 5
    t.string "558829X1045X12661SQ005", limit: 5
    t.string "558829X1045X12661SQ006", limit: 5
    t.string "558829X1045X12661SQ007", limit: 5
    t.string "558829X1045X12661SQ008", limit: 5
    t.decimal "558829X1045X12670SQ001", precision: 30, scale: 10
    t.text "558829X1045X12799SQ001"
    t.string "558829X1047X12680SQ001", limit: 5
    t.string "558829X1047X12680SQ002", limit: 5
    t.string "558829X1047X12680SQ003", limit: 5
    t.string "558829X1047X12680SQ004", limit: 5
    t.string "558829X1047X12680SQ005", limit: 5
    t.string "558829X1047X12680SQ006", limit: 5
    t.string "558829X1047X12680SQ007", limit: 5
    t.string "558829X1047X12681SQ001", limit: 5
    t.string "558829X1047X12681SQ002", limit: 5
    t.string "558829X1047X12681SQ003", limit: 5
    t.string "558829X1047X12681SQ004", limit: 5
    t.string "558829X1047X12681SQ005", limit: 5
    t.string "558829X1047X12681SQ006", limit: 5
    t.string "558829X1047X12681SQ007", limit: 5
    t.string "558829X1047X12681SQ008", limit: 5
    t.decimal "558829X1047X12682SQ001", precision: 30, scale: 10
    t.text "558829X1047X12813SQ001"
    t.string "558829X1048X12699SQ001", limit: 5
    t.string "558829X1048X12699SQ002", limit: 5
    t.string "558829X1048X12699SQ003", limit: 5
    t.string "558829X1048X12699SQ004", limit: 5
    t.string "558829X1048X12699SQ005", limit: 5
    t.string "558829X1048X12699SQ006", limit: 5
    t.string "558829X1048X12699SQ007", limit: 5
    t.string "558829X1048X12700SQ001", limit: 5
    t.string "558829X1048X12700SQ002", limit: 5
    t.string "558829X1048X12700SQ003", limit: 5
    t.string "558829X1048X12700SQ004", limit: 5
    t.string "558829X1048X12700SQ005", limit: 5
    t.string "558829X1048X12700SQ006", limit: 5
    t.string "558829X1048X12700SQ007", limit: 5
    t.string "558829X1048X12700SQ008", limit: 5
    t.decimal "558829X1048X12701SQ001", precision: 30, scale: 10
    t.text "558829X1048X12815SQ001"
    t.string "558829X1049X12718SQ001", limit: 5
    t.string "558829X1049X12718SQ002", limit: 5
    t.string "558829X1049X12718SQ003", limit: 5
    t.string "558829X1049X12718SQ004", limit: 5
    t.string "558829X1049X12718SQ005", limit: 5
    t.string "558829X1049X12718SQ006", limit: 5
    t.string "558829X1049X12718SQ007", limit: 5
    t.string "558829X1049X12719SQ001", limit: 5
    t.string "558829X1049X12719SQ002", limit: 5
    t.string "558829X1049X12719SQ003", limit: 5
    t.string "558829X1049X12719SQ004", limit: 5
    t.string "558829X1049X12719SQ005", limit: 5
    t.string "558829X1049X12719SQ006", limit: 5
    t.string "558829X1049X12719SQ007", limit: 5
    t.string "558829X1049X12719SQ008", limit: 5
    t.decimal "558829X1049X12720SQ001", precision: 30, scale: 10
    t.text "558829X1049X12817SQ001"
    t.string "558829X1050X12737SQ001", limit: 5
    t.string "558829X1050X12737SQ002", limit: 5
    t.string "558829X1050X12737SQ003", limit: 5
    t.string "558829X1050X12737SQ004", limit: 5
    t.string "558829X1050X12737SQ005", limit: 5
    t.string "558829X1050X12737SQ006", limit: 5
    t.string "558829X1050X12737SQ007", limit: 5
    t.string "558829X1050X12738SQ001", limit: 5
    t.string "558829X1050X12738SQ002", limit: 5
    t.string "558829X1050X12738SQ003", limit: 5
    t.string "558829X1050X12738SQ004", limit: 5
    t.string "558829X1050X12738SQ005", limit: 5
    t.string "558829X1050X12738SQ006", limit: 5
    t.string "558829X1050X12738SQ007", limit: 5
    t.string "558829X1050X12738SQ008", limit: 5
    t.decimal "558829X1050X12739SQ001", precision: 30, scale: 10
    t.text "558829X1050X12819SQ001"
    t.string "558829X1051X12757SQ001", limit: 5
    t.string "558829X1051X12757SQ002", limit: 5
    t.string "558829X1051X12757SQ003", limit: 5
    t.string "558829X1051X12757SQ004", limit: 5
    t.string "558829X1051X12757SQ005", limit: 5
    t.string "558829X1051X12757SQ006", limit: 5
    t.string "558829X1051X12757SQ007", limit: 5
    t.string "558829X1051X12758SQ001", limit: 5
    t.string "558829X1051X12758SQ002", limit: 5
    t.string "558829X1051X12758SQ003", limit: 5
    t.string "558829X1051X12758SQ004", limit: 5
    t.string "558829X1051X12758SQ005", limit: 5
    t.string "558829X1051X12758SQ006", limit: 5
    t.string "558829X1051X12758SQ007", limit: 5
    t.string "558829X1051X12758SQ008", limit: 5
    t.decimal "558829X1051X12759SQ001", precision: 30, scale: 10
    t.text "558829X1051X12821SQ001"
    t.string "558829X1046X12673SQ001", limit: 5
    t.string "558829X1046X12673SQ002", limit: 5
    t.string "558829X1046X12673SQ003", limit: 5
    t.string "558829X1046X12673SQ004", limit: 5
    t.string "558829X1046X12673SQ005", limit: 5
    t.text "558829X1046X12673other"
    t.text "558829X1046X12679"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_558829_48739"
  end

  create_table "lime_survey_563811", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "563811X20X235", limit: 255
    t.decimal "563811X20X342FPEB", precision: 30, scale: 10
    t.decimal "563811X20X342HIST", precision: 30, scale: 10
    t.decimal "563811X20X342PPI", precision: 30, scale: 10
    t.decimal "563811X20X342PE", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_563811_10246"
  end

  create_table "lime_survey_564857", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "564857X1310X14194"
    t.string "564857X1308X14196", limit: 5
    t.text "564857X1308X14196other"
    t.string "564857X1308X14197", limit: 5
    t.text "564857X1308X14197other"
    t.text "564857X1308X14188"
    t.text "564857X1308X14187"
    t.text "564857X1308X14189"
    t.string "564857X1308X14190", limit: 1
    t.text "564857X1308X14191"
    t.text "564857X1308X14198"
    t.text "564857X1308X14192"
    t.string "564857X1309X14193SQ001", limit: 5
    t.string "564857X1309X14193SQ002", limit: 5
    t.string "564857X1309X14193SQ003", limit: 5
    t.string "564857X1309X14193SQ004", limit: 5
    t.string "564857X1309X14193SQ005", limit: 5
    t.string "564857X1309X14193SQ006", limit: 5
    t.string "564857X1309X14193SQ007", limit: 5
    t.string "564857X1309X14193SQ008", limit: 5
    t.string "564857X1309X14193SQ009", limit: 5
    t.string "564857X1309X14193SQ010", limit: 5
    t.string "564857X1309X14193SQ011", limit: 5
    t.text "564857X1311X14195StudentYear"
    t.text "564857X1311X14195StudentEmail"
    t.text "564857X1311X14195StudentName"
    t.text "564857X1311X14195CoachEmail"
    t.text "564857X1311X14195CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_564857_2792"
  end

  create_table "lime_survey_564857_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "564857X1310time"
    t.float "564857X1310X14194time"
    t.float "564857X1308time"
    t.float "564857X1308X14196time"
    t.float "564857X1308X14197time"
    t.float "564857X1308X14188time"
    t.float "564857X1308X14187time"
    t.float "564857X1308X14189time"
    t.float "564857X1308X14190time"
    t.float "564857X1308X14191time"
    t.float "564857X1308X14198time"
    t.float "564857X1308X14192time"
    t.float "564857X1309time"
    t.float "564857X1309X14193time"
    t.float "564857X1311time"
    t.float "564857X1311X14195time"
  end

  create_table "lime_survey_565251", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "565251X1477X15926StudentYear"
    t.text "565251X1477X15926StudentEmail"
    t.text "565251X1477X15926StudentName"
    t.text "565251X1477X15926CoachEmail"
    t.text "565251X1477X15926CoachName"
    t.text "565251X1477X15926Course"
    t.decimal "565251X1477X15927FUND", precision: 30, scale: 10
    t.decimal "565251X1477X15927BLHD", precision: 30, scale: 10
    t.decimal "565251X1477X15927SBM", precision: 30, scale: 10
    t.decimal "565251X1477X15927CPR", precision: 30, scale: 10
    t.decimal "565251X1477X15927HODI", precision: 30, scale: 10
    t.decimal "565251X1477X15927NSF", precision: 30, scale: 10
    t.decimal "565251X1477X15927DEVH", precision: 30, scale: 10
    t.decimal "565251X1477X15928FUNDHSS", precision: 30, scale: 10
    t.decimal "565251X1477X15928FUNDBSS", precision: 30, scale: 10
    t.decimal "565251X1477X15928BLHDHSS", precision: 30, scale: 10
    t.decimal "565251X1477X15928BLHDBSS", precision: 30, scale: 10
    t.decimal "565251X1477X15928SBMHSS", precision: 30, scale: 10
    t.decimal "565251X1477X15928SBMBSS", precision: 30, scale: 10
    t.decimal "565251X1477X15928CPRHSS", precision: 30, scale: 10
    t.decimal "565251X1477X15928CPRBSS", precision: 30, scale: 10
    t.decimal "565251X1477X15928HODIHSS", precision: 30, scale: 10
    t.decimal "565251X1477X15928HODIBSS", precision: 30, scale: 10
    t.decimal "565251X1477X15928NSFHSS", precision: 30, scale: 10
    t.decimal "565251X1477X15928NSFBSS", precision: 30, scale: 10
    t.decimal "565251X1477X15928DEVHHSS", precision: 30, scale: 10
    t.decimal "565251X1477X15928DEVHBSS", precision: 30, scale: 10
    t.decimal "565251X1477X15929FUND", precision: 30, scale: 10
    t.decimal "565251X1477X15929BLHD", precision: 30, scale: 10
    t.decimal "565251X1477X15929SBM", precision: 30, scale: 10
    t.decimal "565251X1477X15929CPR", precision: 30, scale: 10
    t.decimal "565251X1477X15929HODI", precision: 30, scale: 10
    t.decimal "565251X1477X15929NSF", precision: 30, scale: 10
    t.decimal "565251X1477X15929DEVH", precision: 30, scale: 10
    t.decimal "565251X1477X15930FUND", precision: 30, scale: 10
    t.decimal "565251X1477X15930BLHD", precision: 30, scale: 10
    t.decimal "565251X1477X15930SBM", precision: 30, scale: 10
    t.decimal "565251X1477X15930CPR", precision: 30, scale: 10
    t.decimal "565251X1477X15930HODI", precision: 30, scale: 10
    t.decimal "565251X1477X15930NSF", precision: 30, scale: 10
    t.decimal "565251X1477X15930DEVH", precision: 30, scale: 10
    t.decimal "565251X1477X15931FUNDHSS", precision: 30, scale: 10
    t.decimal "565251X1477X15931FUNDBSS", precision: 30, scale: 10
    t.decimal "565251X1477X15931BLHDHSS", precision: 30, scale: 10
    t.decimal "565251X1477X15931BLHDBSS", precision: 30, scale: 10
    t.decimal "565251X1477X15931SBMHSS", precision: 30, scale: 10
    t.decimal "565251X1477X15931SBMBSS", precision: 30, scale: 10
    t.decimal "565251X1477X15931CPRHSS", precision: 30, scale: 10
    t.decimal "565251X1477X15931CPRBSS", precision: 30, scale: 10
    t.decimal "565251X1477X15931HODIHSS", precision: 30, scale: 10
    t.decimal "565251X1477X15931HODIBSS", precision: 30, scale: 10
    t.decimal "565251X1477X15931NSFHSS", precision: 30, scale: 10
    t.decimal "565251X1477X15931NSFBSS", precision: 30, scale: 10
    t.decimal "565251X1477X15931DEVHHSS", precision: 30, scale: 10
    t.decimal "565251X1477X15931DEVHBSS", precision: 30, scale: 10
    t.index ["token"], name: "idx_survey_token_565251_130"
  end

  create_table "lime_survey_573344", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "573344X1242X13753SQ001", limit: 5
    t.string "573344X1242X13753SQ002", limit: 5
    t.string "573344X1242X13753SQ003", limit: 5
    t.string "573344X1242X13753SQ004", limit: 5
    t.text "573344X1242X13758"
    t.string "573344X1243X13754SQ001", limit: 5
    t.string "573344X1243X13754SQ002", limit: 5
    t.string "573344X1244X13755SQ001", limit: 5
    t.string "573344X1244X13755SQ002", limit: 5
    t.string "573344X1244X13755SQ003", limit: 5
    t.string "573344X1244X13755SQ004", limit: 5
    t.string "573344X1244X13755SQ005", limit: 5
    t.string "573344X1244X13755SQ006", limit: 5
    t.string "573344X1244X13755SQ007", limit: 5
    t.string "573344X1244X13755SQ008", limit: 5
    t.string "573344X1244X13755SQ009", limit: 5
    t.string "573344X1244X13755SQ010", limit: 5
    t.text "573344X1244X13759"
    t.string "573344X1245X13756SQ001", limit: 5
    t.text "573344X1246X13757"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_573344_9470"
  end

  create_table "lime_survey_586629", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "586629X536X6431"
    t.text "586629X536X6432"
    t.text "586629X536X6433"
    t.text "586629X536X6434"
    t.text "586629X536X6435"
    t.text "586629X536X6436"
    t.text "586629X536X6437"
    t.text "586629X537X6438"
    t.string "586629X537X6439SQ001", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_586629_3082"
  end

  create_table "lime_survey_587195", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "587195X888X10029StudentYear"
    t.text "587195X888X10029StudentEmail"
    t.text "587195X888X10029StudentName"
    t.text "587195X888X10029CoachEmail"
    t.text "587195X888X10029CoachName"
    t.text "587195X889X10030CourseYear"
    t.text "587195X889X10030CourseName"
    t.decimal "587195X889X10031Week1MCQ", precision: 30, scale: 10
    t.decimal "587195X889X10031Week2MCQ", precision: 30, scale: 10
    t.decimal "587195X889X10031Week3MCQ", precision: 30, scale: 10
    t.decimal "587195X889X10031Week4MCQ", precision: 30, scale: 10
    t.decimal "587195X889X10031Week5MCQ", precision: 30, scale: 10
    t.decimal "587195X889X10031Week6MCQ", precision: 30, scale: 10
    t.decimal "587195X889X10031Week7MCQ", precision: 30, scale: 10
    t.decimal "587195X889X10031Week8MCQ", precision: 30, scale: 10
    t.text "587195X889X10032DroppedQuiz"
    t.text "587195X889X10032DroppedScore"
    t.decimal "587195X889X10033CSA01", precision: 30, scale: 10
    t.decimal "587195X889X10033CSA02", precision: 30, scale: 10
    t.decimal "587195X889X10033CSA03", precision: 30, scale: 10
    t.decimal "587195X889X10033CSA04", precision: 30, scale: 10
    t.decimal "587195X889X10033CSA05", precision: 30, scale: 10
    t.decimal "587195X889X10033CSA06", precision: 30, scale: 10
    t.decimal "587195X889X10033CSA07", precision: 30, scale: 10
    t.decimal "587195X889X10033CSA08", precision: 30, scale: 10
    t.decimal "587195X889X10033CSA09", precision: 30, scale: 10
    t.decimal "587195X889X10033CSA10", precision: 30, scale: 10
    t.decimal "587195X889X10034FinalFund", precision: 30, scale: 10
    t.decimal "587195X889X10035NBME", precision: 30, scale: 10
    t.decimal "587195X889X10036OSCE", precision: 30, scale: 10
    t.decimal "587195X889X10036Anat", precision: 30, scale: 10
    t.decimal "587195X889X10036Histo", precision: 30, scale: 10
    t.decimal "587195X889X10036Genetics", precision: 30, scale: 10
    t.decimal "587195X889X10036CellBio", precision: 30, scale: 10
    t.decimal "587195X889X10036Infor", precision: 30, scale: 10
    t.decimal "587195X889X10036Microbio", precision: 30, scale: 10
    t.decimal "587195X889X10037Component1", precision: 30, scale: 10
    t.decimal "587195X889X10037Component2", precision: 30, scale: 10
    t.decimal "587195X889X10037Component3", precision: 30, scale: 10
    t.decimal "587195X889X10037Component4", precision: 30, scale: 10
    t.decimal "587195X889X10037Component5", precision: 30, scale: 10
    t.text "587195X889X10038"
    t.integer "587195X889X10038_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_587195_11177"
  end

  create_table "lime_survey_588433", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "588433X1138X13297SQ001", limit: 5
    t.string "588433X1138X13297SQ002", limit: 5
    t.string "588433X1138X13297SQ005", limit: 5
    t.string "588433X1138X13297SQ004", limit: 5
    t.string "588433X1139X13298SQ001", limit: 5
    t.string "588433X1139X13298SQ004", limit: 5
    t.string "588433X1139X13298SQ003", limit: 5
    t.string "588433X1139X13298SQ002", limit: 5
    t.text "588433X1140X13299"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_588433_35399"
  end

  create_table "lime_survey_588566", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "588566X659X8053"
    t.text "588566X659X8056"
    t.string "588566X662X8057", limit: 5
    t.text "588566X662X8058"
    t.text "588566X662X8052StudentYear"
    t.text "588566X662X8052StudentEmail"
    t.text "588566X662X8052StudentName"
    t.text "588566X662X8052CoachEmail"
    t.text "588566X662X8052CoachName"
    t.string "588566X660X8054C1", limit: 5
    t.string "588566X660X8054C2", limit: 5
    t.string "588566X660X8054C3", limit: 5
    t.string "588566X660X8054C4", limit: 5
    t.string "588566X660X8054C5", limit: 5
    t.string "588566X660X8054C6", limit: 5
    t.string "588566X660X8054C7", limit: 5
    t.string "588566X660X8054C8", limit: 5
    t.string "588566X660X8054C9", limit: 5
    t.text "588566X661X8055"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_588566_28195"
  end

  create_table "lime_survey_591843", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "591843X258X3166StudentYear"
    t.text "591843X258X3166StudentEmail"
    t.text "591843X258X3166StudentName"
    t.text "591843X258X3166CoachEmail"
    t.text "591843X258X3166CoachName"
    t.decimal "591843X259X3172Comm", precision: 30, scale: 10
    t.decimal "591843X259X3172Patient", precision: 30, scale: 10
    t.decimal "591843X259X3172Exam", precision: 30, scale: 10
    t.decimal "591843X259X3172Clinical", precision: 30, scale: 10
    t.decimal "591843X259X3172Prof", precision: 30, scale: 10
    t.decimal "591843X259X3172Total", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_591843_227"
  end

  create_table "lime_survey_595124", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "595124X1498X16328StudentYear"
    t.text "595124X1498X16328StudentEmail"
    t.text "595124X1498X16328StudentName"
    t.text "595124X1498X16328CoachEmail"
    t.text "595124X1498X16328CoachName"
    t.text "595124X1499X16329CourseYear"
    t.text "595124X1499X16329CourseName"
    t.decimal "595124X1499X16330Week1MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week2MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week3MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week4MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week5MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week6MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week7MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week8MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week9MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week10MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week11MCQ", precision: 30, scale: 10
    t.decimal "595124X1499X16330Week11MCQAve", precision: 30, scale: 10
    t.text "595124X1499X16331DroppedQuiz"
    t.text "595124X1499X16331DroppedScore"
    t.decimal "595124X1499X16332CSA1", precision: 30, scale: 10
    t.decimal "595124X1499X16332CSA2", precision: 30, scale: 10
    t.decimal "595124X1499X16332CSA3", precision: 30, scale: 10
    t.decimal "595124X1499X16332CSA4", precision: 30, scale: 10
    t.decimal "595124X1499X16332CSA5", precision: 30, scale: 10
    t.decimal "595124X1499X16332CSL1", precision: 30, scale: 10
    t.decimal "595124X1499X16332HSS1", precision: 30, scale: 10
    t.decimal "595124X1499X16332HSS2Ave", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS1AnatPB", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS2AnatPL1", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS3AnatPract1", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS4Histo1", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS5Histo2", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS6Path", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS7AnatPL2", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS8AnatPract2", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS9Histo3", precision: 30, scale: 10
    t.decimal "595124X1499X16338BSS10Ave", precision: 30, scale: 10
    t.decimal "595124X1499X16333Cardio", precision: 30, scale: 10
    t.decimal "595124X1499X16333Renal", precision: 30, scale: 10
    t.decimal "595124X1499X16333Pulm", precision: 30, scale: 10
    t.decimal "595124X1499X16334NBME", precision: 30, scale: 10
    t.decimal "595124X1499X16335CSAOSCE", precision: 30, scale: 10
    t.decimal "595124X1499X16335HSSInfAve", precision: 30, scale: 10
    t.decimal "595124X1499X16339BSSAnat", precision: 30, scale: 10
    t.decimal "595124X1499X16339BSSBchem", precision: 30, scale: 10
    t.decimal "595124X1499X16339BSSPath", precision: 30, scale: 10
    t.decimal "595124X1499X16339BSSMicrobio", precision: 30, scale: 10
    t.decimal "595124X1499X16339BSSAve", precision: 30, scale: 10
    t.decimal "595124X1499X16336Component1", precision: 30, scale: 10
    t.decimal "595124X1499X16336Component2A", precision: 30, scale: 10
    t.decimal "595124X1499X16336Component2B", precision: 30, scale: 10
    t.decimal "595124X1499X16336Component3", precision: 30, scale: 10
    t.decimal "595124X1499X16336Component4", precision: 30, scale: 10
    t.decimal "595124X1499X16336Component5A", precision: 30, scale: 10
    t.decimal "595124X1499X16336Component5B", precision: 30, scale: 10
    t.text "595124X1499X16337"
    t.integer "595124X1499X16337_filecount"
    t.index ["token"], name: "idx_survey_token_595124_6274"
  end

  create_table "lime_survey_596212", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "596212X496X5619StudentYear"
    t.text "596212X496X5619StudentEmail"
    t.text "596212X496X5619StudentName"
    t.text "596212X496X5619CoachEmail"
    t.text "596212X496X5619CoachName"
    t.text "596212X498X5624Name"
    t.text "596212X498X5624StartDt"
    t.text "596212X498X5624EndDt"
    t.text "596212X498X5624SubmitDt"
    t.text "596212X498X5624Eval"
    t.text "596212X498X5624FinalGrade"
    t.text "596212X499X5625"
    t.text "596212X499X5626FeedBack"
    t.text "596212X499X5626DeanComm"
    t.text "596212X499X5626OptionalCE"
    t.text "596212X499X5626MSPEComm"
    t.text "596212X499X5626DeanLetter"
    t.text "596212X499X5626Comments"
    t.text "596212X497X5620ICS1"
    t.text "596212X497X5620ICS2"
    t.text "596212X497X5620ICS3"
    t.text "596212X497X5620ICS4"
    t.text "596212X497X5620ICS5"
    t.text "596212X497X5620ICS6"
    t.text "596212X497X5620ICS7"
    t.text "596212X497X5620ICS8"
    t.text "596212X497X5620MK1"
    t.text "596212X497X5620MK2"
    t.text "596212X497X5620MK3"
    t.text "596212X497X5620MK4"
    t.text "596212X497X5620MK5"
    t.text "596212X497X5620PBLI1"
    t.text "596212X497X5620PBLI2"
    t.text "596212X497X5620PBLI3"
    t.text "596212X497X5620PBLI4"
    t.text "596212X497X5620PBLI5"
    t.text "596212X497X5620PBLI6"
    t.text "596212X497X5620PBLI7"
    t.text "596212X497X5620PBLI8"
    t.text "596212X497X5620PCP1"
    t.text "596212X497X5620PCP2"
    t.text "596212X497X5620PCP3"
    t.text "596212X497X5620PCP4"
    t.text "596212X497X5620PCP5"
    t.text "596212X497X5620PCP6"
    t.text "596212X497X5620PPPD1"
    t.text "596212X497X5620PPPD2"
    t.text "596212X497X5620PPPD3"
    t.text "596212X497X5620PPPD4"
    t.text "596212X497X5620PPPD5"
    t.text "596212X497X5620PPPD6"
    t.text "596212X497X5620PPPD7"
    t.text "596212X497X5620PPPD8"
    t.text "596212X497X5620PPPD9"
    t.text "596212X497X5620PPP10"
    t.text "596212X497X5620PPP11"
    t.text "596212X497X5620SBPIC1"
    t.text "596212X497X5620SBPIC2"
    t.text "596212X497X5620SBPIC3"
    t.text "596212X497X5620SBPIC4"
    t.text "596212X497X5620SBPIC5"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_596212_18439"
  end

  create_table "lime_survey_597816", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "597816X863X9650", limit: 1
    t.decimal "597816X863X9651", precision: 30, scale: 10
    t.string "597816X863X9652", limit: 5
    t.text "597816X863X9652other"
    t.string "597816X863X9653", limit: 5
    t.text "597816X863X9653other"
    t.string "597816X863X9654", limit: 5
    t.string "597816X863X9655", limit: 5
    t.string "597816X863X9656", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_597816_38536"
  end

  create_table "lime_survey_598842", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "598842X1418X15237StudentYear"
    t.text "598842X1418X15237StudentEmail"
    t.text "598842X1418X15237StudentName"
    t.text "598842X1418X15237CoachEmail"
    t.text "598842X1418X15237CoachName"
    t.text "598842X1419X15238CourseYear"
    t.text "598842X1419X15238CourseName"
    t.decimal "598842X1419X15239Week1MCQ", precision: 30, scale: 10
    t.decimal "598842X1419X15239Week2MCQ", precision: 30, scale: 10
    t.decimal "598842X1419X15239Week3MCQ", precision: 30, scale: 10
    t.decimal "598842X1419X15239Week4MCQ", precision: 30, scale: 10
    t.decimal "598842X1419X15239Week5MCQ", precision: 30, scale: 10
    t.decimal "598842X1419X15239Week6MCQAve", precision: 30, scale: 10
    t.text "598842X1419X15240DroppedQuiz"
    t.text "598842X1419X15240DroppedScore"
    t.decimal "598842X1419X15241CSA01", precision: 30, scale: 10
    t.decimal "598842X1419X15241CSA02", precision: 30, scale: 10
    t.decimal "598842X1419X15241HSS1Infor", precision: 30, scale: 10
    t.decimal "598842X1419X15241HSS2CSL", precision: 30, scale: 10
    t.decimal "598842X1419X15241HSS3EHR", precision: 30, scale: 10
    t.decimal "598842X1419X15241HSS3Ave", precision: 30, scale: 10
    t.decimal "598842X1419X15247BSS1Histo", precision: 30, scale: 10
    t.decimal "598842X1419X15247BSS2Path1", precision: 30, scale: 10
    t.decimal "598842X1419X15247BSS3Path2", precision: 30, scale: 10
    t.decimal "598842X1419X15247BSS4Ave", precision: 30, scale: 10
    t.decimal "598842X1419X15242FinalFund", precision: 30, scale: 10
    t.decimal "598842X1419X15243NBME", precision: 30, scale: 10
    t.decimal "598842X1419X15244HSSOSCE", precision: 30, scale: 10
    t.decimal "598842X1419X15248BSSPath", precision: 30, scale: 10
    t.decimal "598842X1419X15248BSSCellBio", precision: 30, scale: 10
    t.decimal "598842X1419X15248BSSGenetics", precision: 30, scale: 10
    t.decimal "598842X1419X1524849231", precision: 30, scale: 10
    t.decimal "598842X1419X1524812005", precision: 30, scale: 10
    t.decimal "598842X1419X1524892048", precision: 30, scale: 10
    t.decimal "598842X1419X15245Component1", precision: 30, scale: 10
    t.decimal "598842X1419X15245Component2A", precision: 30, scale: 10
    t.decimal "598842X1419X15245Component2B", precision: 30, scale: 10
    t.decimal "598842X1419X15245Component3", precision: 30, scale: 10
    t.decimal "598842X1419X15245Component4", precision: 30, scale: 10
    t.decimal "598842X1419X15245Component5A", precision: 30, scale: 10
    t.decimal "598842X1419X15245Component5B", precision: 30, scale: 10
    t.text "598842X1419X15246"
    t.integer "598842X1419X15246_filecount"
    t.index ["token"], name: "idx_survey_token_598842_355"
  end

  create_table "lime_survey_599254", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "599254X1359X14565"
    t.text "599254X1359X14566"
    t.text "599254X1359X14567"
    t.string "599254X1350X14556PatientCare1", limit: 5
    t.string "599254X1350X14556PatientCare2", limit: 5
    t.string "599254X1350X14556PatientCare3", limit: 5
    t.string "599254X1350X14556PatientCare4", limit: 5
    t.string "599254X1350X14556PatientCare5", limit: 5
    t.string "599254X1350X14556PatientCare6", limit: 5
    t.string "599254X1350X14556PatientCare7", limit: 5
    t.string "599254X1350X14556PatientCare8", limit: 5
    t.string "599254X1350X14556PatientCare9", limit: 5
    t.string "599254X1351X14557KnowledgePractice1", limit: 5
    t.string "599254X1351X14557KnowledgePractice2", limit: 5
    t.string "599254X1352X14558PracticeBasedLM1", limit: 5
    t.string "599254X1352X14558PracticeBasedLM2", limit: 5
    t.string "599254X1352X14558PracticeBasedLM3", limit: 5
    t.string "599254X1352X14558PracticeBasedLM4", limit: 5
    t.string "599254X1353X14559InterpersonalComm1", limit: 5
    t.string "599254X1354X14560Prof1", limit: 5
    t.string "599254X1354X14560Prof2", limit: 5
    t.string "599254X1355X14561SystemsBasedPrac1", limit: 5
    t.string "599254X1355X14561SystemsBasedPrac2", limit: 5
    t.string "599254X1355X14561SystemsBasedPrac3", limit: 5
    t.string "599254X1356X14562OtherLearner1", limit: 5
    t.string "599254X1357X14563OverallRating1", limit: 5
    t.text "599254X1358X14564"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_599254_39004"
  end

  create_table "lime_survey_612253", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "612253X1085X13011SQ001"
    t.text "612253X1085X13011SQ002"
    t.text "612253X1085X13011SQ003"
    t.string "612253X1077X13003PatientCare1", limit: 5
    t.string "612253X1077X13003PatientCare2", limit: 5
    t.string "612253X1077X13003PatientCare3", limit: 5
    t.string "612253X1077X13003PatientCare4", limit: 5
    t.string "612253X1077X13003PatientCare5", limit: 5
    t.string "612253X1077X13003PatientCare6", limit: 5
    t.string "612253X1077X13003PatientCare7", limit: 5
    t.string "612253X1077X13003PatientCare8", limit: 5
    t.string "612253X1077X13003PatientCare9", limit: 5
    t.string "612253X1078X13004KnowledgePractice1", limit: 5
    t.string "612253X1078X13004KnowledgePractice2", limit: 5
    t.string "612253X1079X13005PracticeBasedLM1", limit: 5
    t.string "612253X1079X13005PracticeBasedLM2", limit: 5
    t.string "612253X1079X13005PracticeBasedLM3", limit: 5
    t.string "612253X1079X13005PracticeBasedLM4", limit: 5
    t.string "612253X1080X13006InterpersonalComm1", limit: 5
    t.string "612253X1081X13007Prof1", limit: 5
    t.string "612253X1082X13008SystemsBasedPrac1", limit: 5
    t.string "612253X1082X13008SystemsBasedPrac2", limit: 5
    t.string "612253X1082X13008SystemsBasedPrac3", limit: 5
    t.string "612253X1083X13009OverallRating1", limit: 5
    t.text "612253X1084X13010"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_612253_46019"
  end

  create_table "lime_survey_613333", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "613333X856X9575StudentYear"
    t.text "613333X856X9575StudentEmail"
    t.text "613333X856X9575StudentName"
    t.text "613333X856X9575CoachEmail"
    t.text "613333X856X9575CoachName"
    t.text "613333X857X9576CourseYear"
    t.text "613333X857X9576CourseName"
    t.decimal "613333X857X9577Week1MCQ", precision: 30, scale: 10
    t.decimal "613333X857X9577Week2MCQ", precision: 30, scale: 10
    t.decimal "613333X857X9577Week3MCQ", precision: 30, scale: 10
    t.decimal "613333X857X9577Week4MCQ", precision: 30, scale: 10
    t.decimal "613333X857X9577Week5MCQ", precision: 30, scale: 10
    t.decimal "613333X857X9577Week6MCQ", precision: 30, scale: 10
    t.text "613333X857X9578DroppedQuiz"
    t.text "613333X857X9578DroppedScore"
    t.decimal "613333X857X9579CSA01", precision: 30, scale: 10
    t.decimal "613333X857X9579CSA02", precision: 30, scale: 10
    t.decimal "613333X857X9579CSA03", precision: 30, scale: 10
    t.decimal "613333X857X9579CSA04", precision: 30, scale: 10
    t.decimal "613333X857X9579CSA05", precision: 30, scale: 10
    t.decimal "613333X857X9579CSA06", precision: 30, scale: 10
    t.decimal "613333X857X9579CSA07", precision: 30, scale: 10
    t.decimal "613333X857X9579CSA08", precision: 30, scale: 10
    t.decimal "613333X857X9579CSA09", precision: 30, scale: 10
    t.decimal "613333X857X9579CSA10", precision: 30, scale: 10
    t.decimal "613333X857X9579CSA11", precision: 30, scale: 10
    t.decimal "613333X857X9579CSA12", precision: 30, scale: 10
    t.decimal "613333X857X9580FinalBlockGastro", precision: 30, scale: 10
    t.decimal "613333X857X9580FinalBlockEndo", precision: 30, scale: 10
    t.decimal "613333X857X9581NBME", precision: 30, scale: 10
    t.decimal "613333X857X9582OSCE", precision: 30, scale: 10
    t.decimal "613333X857X9582Histo", precision: 30, scale: 10
    t.decimal "613333X857X9582Path", precision: 30, scale: 10
    t.decimal "613333X857X9582Micro", precision: 30, scale: 10
    t.decimal "613333X857X9582Meta", precision: 30, scale: 10
    t.decimal "613333X857X9582Info", precision: 30, scale: 10
    t.decimal "613333X857X9582Anat", precision: 30, scale: 10
    t.decimal "613333X857X9583Component1", precision: 30, scale: 10
    t.decimal "613333X857X9583Component2", precision: 30, scale: 10
    t.decimal "613333X857X9583Component3", precision: 30, scale: 10
    t.decimal "613333X857X9583Component4", precision: 30, scale: 10
    t.decimal "613333X857X9583Component5", precision: 30, scale: 10
    t.text "613333X857X9584"
    t.integer "613333X857X9584_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_613333_24580"
  end

  create_table "lime_survey_613437", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "613437X170X2293StudentYear"
    t.text "613437X170X2293StudentEmail"
    t.text "613437X170X2293StudentName"
    t.text "613437X170X2293CoachEmail"
    t.text "613437X170X2293CoachName"
    t.decimal "613437X171X2294Comp2", precision: 30, scale: 10
    t.decimal "613437X171X2294Comp5", precision: 30, scale: 10
    t.decimal "613437X172X2295Comp2", precision: 30, scale: 10
    t.decimal "613437X173X2296Comp2", precision: 30, scale: 10
    t.decimal "613437X173X2296Comp5", precision: 30, scale: 10
    t.decimal "613437X174X2297Comp21", precision: 30, scale: 10
    t.decimal "613437X174X2297Comp22", precision: 30, scale: 10
    t.decimal "613437X174X2297Comp5", precision: 30, scale: 10
    t.decimal "613437X175X2298Comp2", precision: 30, scale: 10
    t.decimal "613437X175X2298Comp5", precision: 30, scale: 10
    t.decimal "613437X176X2299", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_613437_45980"
  end

  create_table "lime_survey_615493", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.decimal "615493X740X8833", precision: 30, scale: 10
    t.text "615493X740X8837"
    t.string "615493X740X8845", limit: 5
    t.text "615493X740X8845other"
    t.string "615493X740X8874SQ001", limit: 5
    t.string "615493X740X8874SQ002", limit: 5
    t.text "615493X740X8874other"
    t.string "615493X746X8891SQ001", limit: 5
    t.string "615493X746X8891SQ002", limit: 5
    t.string "615493X746X8891SQ003", limit: 5
    t.string "615493X756X8937A1", limit: 5
    t.string "615493X756X8937A2", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_615493_4802"
  end

  create_table "lime_survey_619823", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "619823X72X1244SQ001", limit: 5
    t.string "619823X72X1244SQ002", limit: 5
    t.string "619823X72X1244SQ003", limit: 5
    t.text "619823X72X1245"
    t.text "619823X72X1246"
    t.string "619823X72X1247", limit: 255
    t.string "619823X72X1248", limit: 255
    t.string "619823X72X1249", limit: 255
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_619823_4612"
  end

  create_table "lime_survey_621988", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "621988X1229X14157SQ001", limit: 5
    t.string "621988X1229X13697SQ001", limit: 5
    t.string "621988X1229X13697SQ003", limit: 5
    t.string "621988X1229X13697SQ002", limit: 5
    t.string "621988X1230X13698SQ001", limit: 5
    t.string "621988X1230X13698SQ002", limit: 5
    t.string "621988X1230X13698SQ003", limit: 5
    t.string "621988X1230X13698SQ004", limit: 5
    t.string "621988X1230X13698SQ005", limit: 5
    t.string "621988X1230X13698SQ006", limit: 5
    t.string "621988X1230X13698SQ007", limit: 5
    t.string "621988X1231X13699SQ001", limit: 5
    t.text "621988X1232X13700"
    t.text "621988X1232X13701"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_621988_15539"
  end

  create_table "lime_survey_624522", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "624522X63X1008StudentYear"
    t.text "624522X63X1008StudentEmail"
    t.text "624522X63X1008StudentName"
    t.text "624522X63X1008CoachEmail"
    t.text "624522X63X1008CoachName"
    t.text "624522X62X1009CourseYear"
    t.text "624522X62X1009CourseName"
    t.decimal "624522X62X1002Week1MCQ", precision: 30, scale: 10
    t.decimal "624522X62X1002Week2MCQ", precision: 30, scale: 10
    t.decimal "624522X62X1002Week3MCQ", precision: 30, scale: 10
    t.decimal "624522X62X1002Week4MCQ", precision: 30, scale: 10
    t.decimal "624522X62X1002Week5MCQ", precision: 30, scale: 10
    t.decimal "624522X62X1002Week6MCQ", precision: 30, scale: 10
    t.decimal "624522X62X1002Week7MCQ", precision: 30, scale: 10
    t.text "624522X62X1007DroppedQuiz"
    t.text "624522X62X1007DroppedScore"
    t.decimal "624522X62X1003Week2", precision: 30, scale: 10
    t.decimal "624522X62X1003Week4", precision: 30, scale: 10
    t.decimal "624522X62X1003Week6", precision: 30, scale: 10
    t.decimal "624522X62X1004", precision: 30, scale: 10
    t.decimal "624522X62X1005", precision: 30, scale: 10
    t.decimal "624522X62X1006OSCE1", precision: 30, scale: 10
    t.decimal "624522X62X1006OSCE2", precision: 30, scale: 10
    t.decimal "624522X62X1006HistologySkills", precision: 30, scale: 10
    t.decimal "624522X62X1006GeneticsPedigree", precision: 30, scale: 10
    t.decimal "624522X62X1010Component1", precision: 30, scale: 10
    t.decimal "624522X62X1010Component2", precision: 30, scale: 10
    t.decimal "624522X62X1010Component3", precision: 30, scale: 10
    t.decimal "624522X62X1010Component4", precision: 30, scale: 10
    t.decimal "624522X62X1010Component5", precision: 30, scale: 10
    t.text "624522X62X1445"
    t.integer "624522X62X1445_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_624522_45381"
  end

  create_table "lime_survey_632996", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "632996X647X7916", limit: 5
    t.text "632996X647X7917"
    t.string "632996X644X7910Clarify", limit: 5
    t.string "632996X644X7910Represents", limit: 5
    t.string "632996X644X7910Responsible", limit: 5
    t.string "632996X644X7910Inspire", limit: 5
    t.string "632996X644X7910Determine", limit: 5
    t.string "632996X644X7910Active", limit: 5
    t.string "632996X644X7910Honest", limit: 5
    t.string "632996X645X7911SeekAndHear", limit: 5
    t.string "632996X645X7911LearnAbout", limit: 5
    t.string "632996X645X7911ConveyAny", limit: 5
    t.string "632996X645X7911DevelopAShared", limit: 5
    t.string "632996X645X7911SpecificMeasurable", limit: 5
    t.string "632996X645X7911WorkWithYourStudent", limit: 5
    t.string "632996X645X7911OrganizeInterpret", limit: 5
    t.string "632996X645X7911DetermineTimelines", limit: 5
    t.string "632996X645X7911MonitorYourProgress", limit: 5
    t.string "632996X645X7911IdentifyProblems", limit: 5
    t.string "632996X645X7911SolveProblems", limit: 5
    t.string "632996X645X7911Characterize", limit: 5
    t.text "632996X646X7912"
    t.text "632996X646X7913"
    t.text "632996X643X7909"
    t.text "632996X643X7915"
    t.text "632996X643X7914"
    t.text "632996X643X7918"
    t.text "632996X643X7919"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_632996_5300"
  end

  create_table "lime_survey_641121", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "641121X982X12178", limit: 5
    t.text "641121X983X12179"
    t.text "641121X983X12180"
    t.text "641121X983X12181"
    t.text "641121X983X12182"
    t.text "641121X984X12183"
    t.text "641121X984X12184"
    t.text "641121X984X12255"
    t.text "641121X984X12185"
    t.text "641121X985X12186"
    t.text "641121X985X12254"
    t.text "641121X985X12187"
    t.text "641121X985X12188"
    t.text "641121X985X12189"
    t.text "641121X986X12190"
    t.text "641121X986X12191"
    t.text "641121X986X12192"
    t.text "641121X987X12193"
    t.text "641121X987X12194"
    t.text "641121X987X12195"
    t.text "641121X987X12196"
    t.text "641121X987X12197"
    t.text "641121X988X12198"
    t.text "641121X988X12199"
    t.text "641121X988X12200"
    t.text "641121X988X12201"
    t.text "641121X989X12202"
    t.text "641121X989X12203"
    t.text "641121X989X12204"
    t.text "641121X990X12205"
    t.text "641121X990X12206"
    t.text "641121X990X12207"
    t.text "641121X991X12208"
    t.text "641121X991X12209"
    t.text "641121X991X12210"
    t.text "641121X992X12211"
    t.text "641121X992X12212"
    t.text "641121X992X12213"
    t.text "641121X993X12214"
    t.text "641121X993X12215"
    t.text "641121X993X12216"
    t.text "641121X994X12217"
    t.text "641121X994X12218"
    t.text "641121X994X12219"
    t.text "641121X995X12220"
    t.text "641121X995X12221"
    t.text "641121X995X12222"
    t.text "641121X995X12223"
    t.text "641121X996X12224"
    t.text "641121X996X12225"
    t.text "641121X996X12226"
    t.text "641121X996X12227"
    t.text "641121X997X12228"
    t.text "641121X997X12229"
    t.text "641121X997X12230"
    t.text "641121X997X12231"
    t.text "641121X998X12232"
    t.text "641121X998X12233"
    t.text "641121X998X12234"
    t.text "641121X999X12235"
    t.text "641121X999X12236"
    t.text "641121X999X12237"
    t.text "641121X1000X12238"
    t.text "641121X1000X12239"
    t.text "641121X1001X12240"
    t.text "641121X1001X12241"
    t.text "641121X1002X12242"
    t.text "641121X1002X12243"
    t.text "641121X1002X12244"
    t.text "641121X1003X12245"
    t.text "641121X1003X12253"
    t.text "641121X1003X12246"
    t.text "641121X1004X12247"
    t.text "641121X1004X12248"
    t.text "641121X1004X12249"
    t.text "641121X1004X12250"
    t.text "641121X1004X12251"
    t.text "641121X1005X12252"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_641121_5367"
  end

  create_table "lime_survey_642132", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "642132X1199X13563SQ001", limit: 5
    t.string "642132X1199X13563SQ004", limit: 5
    t.string "642132X1199X13563SQ003", limit: 5
    t.string "642132X1199X13563SQ002", limit: 5
    t.text "642132X1199X13568"
    t.string "642132X1200X13564SQ001", limit: 5
    t.string "642132X1200X13564SQ002", limit: 5
    t.string "642132X1200X13564SQ003", limit: 5
    t.string "642132X1200X13564SQ004", limit: 5
    t.text "642132X1200X13569"
    t.string "642132X1201X13565SQ001", limit: 5
    t.string "642132X1201X13565SQ002", limit: 5
    t.text "642132X1201X13570"
    t.string "642132X1201X14122SQ001", limit: 5
    t.text "642132X1202X13566"
    t.text "642132X1202X13567"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_642132_29847"
  end

  create_table "lime_survey_646543", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "646543X679X8237RecognizePersFeeling", limit: 5
    t.string "646543X679X8237AwareOfEmotions", limit: 5
    t.string "646543X679X8237InvestigateBehavior", limit: 5
    t.string "646543X679X8237ContradictoryFeeling", limit: 5
    t.string "646543X679X8237ThinkingHabits", limit: 5
    t.string "646543X679X8237TrustingRelationship", limit: 5
    t.string "646543X679X8237SafeLearning", limit: 5
    t.string "646543X679X8237Commitment", limit: 5
    t.string "646543X679X8237Affirm", limit: 5
    t.string "646543X679X8237AcceptFeedback", limit: 5
    t.string "646543X679X8237Stimulates", limit: 5
    t.string "646543X679X8237Encourage", limit: 5
    t.string "646543X679X8237EncourageProfDev", limit: 5
    t.string "646543X679X8237ConstructiveFeedback", limit: 5
    t.string "646543X680X8254", limit: 1
    t.string "646543X680X8242", limit: 5
    t.text "646543X680X8243"
    t.string "646543X680X8244", limit: 5
    t.string "646543X680X8245", limit: 5
    t.string "646543X680X8246", limit: 5
    t.string "646543X680X8247", limit: 5
    t.text "646543X680X8247other"
    t.string "646543X680X8248", limit: 5
    t.text "646543X680X8248other"
    t.string "646543X680X8249", limit: 5
    t.text "646543X680X8250"
    t.string "646543X680X8251Q1", limit: 5
    t.text "646543X680X8252"
    t.string "646543X680X8253Q1", limit: 5
    t.text "646543X678X8236"
    t.text "646543X678X8239"
    t.text "646543X678X8238"
    t.text "646543X678X8240"
    t.text "646543X678X8241"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_646543_44330"
  end

  create_table "lime_survey_647365", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "647365X1006X12256StudentYear"
    t.text "647365X1006X12256StudentEmail"
    t.text "647365X1006X12256StudentName"
    t.text "647365X1006X12256CoachEmail"
    t.text "647365X1006X12256CoachName"
    t.text "647365X1007X12257CourseYear"
    t.text "647365X1007X12257CourseName"
    t.decimal "647365X1007X12258Week1MCQ", precision: 30, scale: 10
    t.decimal "647365X1007X12258Week2MCQ", precision: 30, scale: 10
    t.decimal "647365X1007X12258Week3MCQ", precision: 30, scale: 10
    t.decimal "647365X1007X12258Week4MCQ", precision: 30, scale: 10
    t.decimal "647365X1007X12258Week5MCQ", precision: 30, scale: 10
    t.decimal "647365X1007X12258Week6MCQ", precision: 30, scale: 10
    t.decimal "647365X1007X12258Week7MCQ", precision: 30, scale: 10
    t.decimal "647365X1007X12258Week8MCQ", precision: 30, scale: 10
    t.decimal "647365X1007X12258Week9MCQ", precision: 30, scale: 10
    t.decimal "647365X1007X12258Week10MCQ", precision: 30, scale: 10
    t.decimal "647365X1007X12258Week11MCQ", precision: 30, scale: 10
    t.text "647365X1007X12259DroppedQuiz"
    t.text "647365X1007X12259DroppedScore"
    t.decimal "647365X1007X12260CSA01", precision: 30, scale: 10
    t.decimal "647365X1007X12260CSA02", precision: 30, scale: 10
    t.decimal "647365X1007X12260CSA03", precision: 30, scale: 10
    t.decimal "647365X1007X12260CSA04", precision: 30, scale: 10
    t.decimal "647365X1007X12260CSA05", precision: 30, scale: 10
    t.decimal "647365X1007X12260CSA06", precision: 30, scale: 10
    t.decimal "647365X1007X12260CSA07", precision: 30, scale: 10
    t.decimal "647365X1007X12260CSA08", precision: 30, scale: 10
    t.decimal "647365X1007X12260CSA09", precision: 30, scale: 10
    t.decimal "647365X1007X12260CSA10", precision: 30, scale: 10
    t.decimal "647365X1007X12260CSA11", precision: 30, scale: 10
    t.decimal "647365X1007X12260CSA12", precision: 30, scale: 10
    t.decimal "647365X1007X12261FinalBlockCardio", precision: 30, scale: 10
    t.decimal "647365X1007X12261FinalBlockRenal", precision: 30, scale: 10
    t.decimal "647365X1007X12261FinalBlockPulm", precision: 30, scale: 10
    t.decimal "647365X1007X12262NBME", precision: 30, scale: 10
    t.decimal "647365X1007X12266sq001", precision: 30, scale: 10
    t.decimal "647365X1007X12266sq002", precision: 30, scale: 10
    t.decimal "647365X1007X12266sq003", precision: 30, scale: 10
    t.decimal "647365X1007X12266sq004", precision: 30, scale: 10
    t.decimal "647365X1007X12266sq005", precision: 30, scale: 10
    t.decimal "647365X1007X12263OSCE", precision: 30, scale: 10
    t.decimal "647365X1007X12263Histo", precision: 30, scale: 10
    t.decimal "647365X1007X12263Path", precision: 30, scale: 10
    t.decimal "647365X1007X12263Anat", precision: 30, scale: 10
    t.decimal "647365X1007X12263Micro", precision: 30, scale: 10
    t.decimal "647365X1007X12263BChem", precision: 30, scale: 10
    t.decimal "647365X1007X12264Component1", precision: 30, scale: 10
    t.decimal "647365X1007X12264Component2", precision: 30, scale: 10
    t.decimal "647365X1007X12264Component3", precision: 30, scale: 10
    t.decimal "647365X1007X12264Component4", precision: 30, scale: 10
    t.decimal "647365X1007X12264Component5", precision: 30, scale: 10
    t.text "647365X1007X12265"
    t.integer "647365X1007X12265_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_647365_22183"
  end

  create_table "lime_survey_648667", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "648667X1486X16222StudentYear"
    t.text "648667X1486X16222StudentEmail"
    t.text "648667X1486X16222StudentName"
    t.text "648667X1486X16222CoachEmail"
    t.text "648667X1486X16222CoachName"
    t.text "648667X1487X16223CourseYear"
    t.text "648667X1487X16223CourseName"
    t.decimal "648667X1487X16224Week1MCQ", precision: 30, scale: 10
    t.decimal "648667X1487X16224Week2MCQ", precision: 30, scale: 10
    t.decimal "648667X1487X16224Week3MCQ", precision: 30, scale: 10
    t.decimal "648667X1487X16224Week4MCQ", precision: 30, scale: 10
    t.decimal "648667X1487X16224Week5MCQ", precision: 30, scale: 10
    t.decimal "648667X1487X16224Week9MCQAve", precision: 30, scale: 10
    t.text "648667X1487X16225DroppedQuiz"
    t.text "648667X1487X16225DroppedScore"
    t.decimal "648667X1487X16226CSA1", precision: 30, scale: 10
    t.decimal "648667X1487X16226CSA2", precision: 30, scale: 10
    t.decimal "648667X1487X16226CSL", precision: 30, scale: 10
    t.decimal "648667X1487X16226EHR", precision: 30, scale: 10
    t.decimal "648667X1487X16232BSS1AnatPB", precision: 30, scale: 10
    t.decimal "648667X1487X16232BSS2AnatPL1", precision: 30, scale: 10
    t.decimal "648667X1487X16232BSS3AnatPL2", precision: 30, scale: 10
    t.decimal "648667X1487X16232BSS4AnatSkill1", precision: 30, scale: 10
    t.decimal "648667X1487X16232BSS5AnatSkill2", precision: 30, scale: 10
    t.decimal "648667X1487X16232BSS6AnatPL3", precision: 30, scale: 10
    t.decimal "648667X1487X16232BSS7Histo", precision: 30, scale: 10
    t.decimal "648667X1487X16232BSS8AnatSkill3", precision: 30, scale: 10
    t.decimal "648667X1487X16227FinalSBM", precision: 30, scale: 10
    t.decimal "648667X1487X16228NBME", precision: 30, scale: 10
    t.decimal "648667X1487X16229OSCE", precision: 30, scale: 10
    t.decimal "648667X1487X16229VisualDx", precision: 30, scale: 10
    t.decimal "648667X1487X16233BSSHisto", precision: 30, scale: 10
    t.decimal "648667X1487X16233BSSCellBio", precision: 30, scale: 10
    t.decimal "648667X1487X16233BSSMicro", precision: 30, scale: 10
    t.decimal "648667X1487X16233BSSAnat", precision: 30, scale: 10
    t.decimal "648667X1487X16233BSSAve", precision: 30, scale: 10
    t.decimal "648667X1487X16230Component1", precision: 30, scale: 10
    t.decimal "648667X1487X16230Component2A", precision: 30, scale: 10
    t.decimal "648667X1487X16230Component2B", precision: 30, scale: 10
    t.decimal "648667X1487X16230Component3", precision: 30, scale: 10
    t.decimal "648667X1487X16230Component4", precision: 30, scale: 10
    t.decimal "648667X1487X16230Component5A", precision: 30, scale: 10
    t.decimal "648667X1487X16230Component5B", precision: 30, scale: 10
    t.text "648667X1487X16231"
    t.integer "648667X1487X16231_filecount"
    t.index ["token"], name: "idx_survey_token_648667_22412"
  end

  create_table "lime_survey_649133", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "649133X223X2711", limit: 5
    t.text "649133X223X2712"
    t.string "649133X219X2704Clarify", limit: 5
    t.string "649133X219X2704Represents", limit: 5
    t.string "649133X219X2704Responsible", limit: 5
    t.string "649133X219X2704Inspire", limit: 5
    t.string "649133X219X2704Determine", limit: 5
    t.string "649133X219X2704Active", limit: 5
    t.string "649133X219X2704Honest", limit: 5
    t.string "649133X220X2705SeekAndHear", limit: 5
    t.string "649133X220X2705LearnAbout", limit: 5
    t.string "649133X220X2705ConveyAny", limit: 5
    t.string "649133X220X2705DevelopAShared", limit: 5
    t.string "649133X220X2705SpecificMeasurable", limit: 5
    t.string "649133X220X2705WorkWithYourStudent", limit: 5
    t.string "649133X220X2705OrganizeInterpret", limit: 5
    t.string "649133X220X2705DetermineTimelines", limit: 5
    t.string "649133X220X2705MonitorYourProgress", limit: 5
    t.string "649133X220X2705IdentifyProblems", limit: 5
    t.string "649133X220X2705SolveProblems", limit: 5
    t.string "649133X220X2705Characterize", limit: 5
    t.string "649133X221X2706RecognizePersFeeling", limit: 5
    t.string "649133X221X2706AwareOfEmotions", limit: 5
    t.string "649133X221X2706InvestigateBehavior", limit: 5
    t.string "649133X221X2706ContradictoryFeeling", limit: 5
    t.string "649133X221X2706ThinkingHabits", limit: 5
    t.string "649133X221X2706TrustingRelationship", limit: 5
    t.string "649133X221X2706SafeLearning", limit: 5
    t.string "649133X221X2706Commitment", limit: 5
    t.string "649133X221X2706Affirm", limit: 5
    t.string "649133X221X2706AcceptFeedback", limit: 5
    t.string "649133X221X2706Stimulates", limit: 5
    t.string "649133X221X2706Encourage", limit: 5
    t.string "649133X221X2706EncourageProfDev", limit: 5
    t.string "649133X221X2706ConstructiveFeedback", limit: 5
    t.text "649133X222X2707"
    t.text "649133X222X2708"
    t.text "649133X218X2703"
    t.text "649133X218X2710"
    t.text "649133X218X2709"
    t.text "649133X218X2713"
    t.text "649133X218X2714"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_649133_18768"
  end

  create_table "lime_survey_659914", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "659914X235X2854StudentYear"
    t.text "659914X235X2854StudentEmail"
    t.text "659914X235X2854StudentName"
    t.text "659914X235X2854CoachEmail"
    t.text "659914X235X2854CoachName"
    t.text "659914X240X2859PreceptorName"
    t.text "659914X240X2859SubmitDate"
    t.text "659914X240X2859Grade"
    t.text "659914X240X2859Term"
    t.string "659914X236X2855SBP1", limit: 5
    t.string "659914X236X2855SBP2", limit: 5
    t.string "659914X236X2855SBP3", limit: 5
    t.string "659914X236X2855SBP4", limit: 5
    t.string "659914X237X2856PBL1", limit: 5
    t.string "659914X237X2856PBL2", limit: 5
    t.string "659914X237X2856PBL3", limit: 5
    t.string "659914X237X2856PBL4", limit: 5
    t.string "659914X238X2857PROF1", limit: 5
    t.string "659914X238X2857PROF2", limit: 5
    t.string "659914X238X2857PROF3", limit: 5
    t.string "659914X238X2857PROF4", limit: 5
    t.string "659914X239X2858ICS1", limit: 5
    t.string "659914X239X2858ICS2", limit: 5
    t.string "659914X239X2858ICS3", limit: 5
    t.string "659914X239X2858ICS4", limit: 5
    t.text "659914X241X2860"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_659914_8282"
  end

  create_table "lime_survey_662352", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "662352X785X9140"
    t.text "662352X785X9141"
    t.text "662352X785X9147"
    t.text "662352X785X9148"
    t.text "662352X785X9149"
    t.text "662352X785X9150"
    t.string "662352X786X9142Represents", limit: 5
    t.string "662352X786X9142Responsible", limit: 5
    t.string "662352X786X9142Determine", limit: 5
    t.string "662352X786X9142Active", limit: 5
    t.string "662352X787X9143LearnAbout", limit: 5
    t.string "662352X787X9143AcceptAny", limit: 5
    t.string "662352X787X9143DevelopAShared", limit: 5
    t.string "662352X787X9143SpecificMeasurable", limit: 5
    t.string "662352X787X9143WorkWithYourCoach", limit: 5
    t.string "662352X788X9144RecognizePersFeeling", limit: 5
    t.string "662352X788X9144AwareOfEmotions", limit: 5
    t.string "662352X788X9144InvestigateBehavior", limit: 5
    t.string "662352X788X9144MyThinkingHabits", limit: 5
    t.string "662352X788X9144SafeLearningEnv", limit: 5
    t.string "662352X788X9144Commitment", limit: 5
    t.string "662352X788X9144Affirms", limit: 5
    t.string "662352X788X9144esLearningPrStimulat", limit: 5
    t.string "662352X788X9144Encourages", limit: 5
    t.text "662352X789X9145"
    t.text "662352X789X9146"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_662352_46561"
  end

  create_table "lime_survey_662352_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "662352X785time"
    t.float "662352X785X9140time"
    t.float "662352X785X9141time"
    t.float "662352X785X9147time"
    t.float "662352X785X9148time"
    t.float "662352X785X9149time"
    t.float "662352X785X9150time"
    t.float "662352X786time"
    t.float "662352X786X9142time"
    t.float "662352X787time"
    t.float "662352X787X9143time"
    t.float "662352X788time"
    t.float "662352X788X9144time"
    t.float "662352X789time"
    t.float "662352X789X9145time"
    t.float "662352X789X9146time"
  end

  create_table "lime_survey_665268", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "665268X276X3355StudentYear"
    t.text "665268X276X3355StudentEmail"
    t.text "665268X276X3355StudentName"
    t.text "665268X276X3355CoachEmail"
    t.text "665268X276X3355CoachName"
    t.text "665268X277X3715Step1PassFail"
    t.text "665268X277X3715Step1ExamScore"
    t.text "665268X277X3715Step1ExamDT"
    t.text "665268X278X3364CK01"
    t.text "665268X278X3364CK02"
    t.text "665268X278X3364CK03"
    t.text "665268X279X3367CS01"
    t.text "665268X279X3367CS02"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_665268_39078"
  end

  create_table "lime_survey_665981", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "665981X1247X13777SQ001", limit: 5
    t.string "665981X1247X13777SQ004", limit: 5
    t.string "665981X1247X13777SQ003", limit: 5
    t.string "665981X1247X13777SQ002", limit: 5
    t.text "665981X1247X13782"
    t.string "665981X1248X13778SQ001", limit: 5
    t.string "665981X1248X13778SQ002", limit: 5
    t.string "665981X1248X13778SQ003", limit: 5
    t.string "665981X1248X13778SQ004", limit: 5
    t.text "665981X1248X13783"
    t.string "665981X1249X13779SQ001", limit: 5
    t.string "665981X1249X13779SQ002", limit: 5
    t.text "665981X1249X13784"
    t.string "665981X1249X14130SQ001", limit: 5
    t.text "665981X1250X13780"
    t.text "665981X1250X13781"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_665981_25523"
  end

  create_table "lime_survey_666796", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "666796X1390X14895", limit: 1
    t.text "666796X1390X14885"
    t.string "666796X1390X14874SQ001", limit: 5
    t.string "666796X1390X14875", limit: 5
    t.string "666796X1390X14876", limit: 1
    t.string "666796X1390X14877", limit: 5
    t.text "666796X1390X14877other"
    t.string "666796X1390X14896", limit: 5
    t.text "666796X1390X14896other"
    t.string "666796X1390X14878", limit: 1
    t.string "666796X1390X14879", limit: 5
    t.text "666796X1390X14879other"
    t.string "666796X1390X14880", limit: 1
    t.string "666796X1390X148811", limit: 5
    t.string "666796X1390X148812", limit: 5
    t.string "666796X1390X148813", limit: 5
    t.string "666796X1390X148814", limit: 5
    t.string "666796X1390X148815", limit: 5
    t.text "666796X1390X14881other"
    t.string "666796X1390X14882HowHelpful", limit: 5
    t.text "666796X1390X14883"
    t.string "666796X1390X14886Module1", limit: 5
    t.string "666796X1390X14886Module2", limit: 5
    t.string "666796X1390X14886Module3", limit: 5
    t.string "666796X1390X14886Module4", limit: 5
    t.string "666796X1390X14886Module5", limit: 5
    t.text "666796X1391X14884StudentYear"
    t.text "666796X1391X14884StudentEmail"
    t.text "666796X1391X14884StudentName"
    t.text "666796X1391X14884CoachEmail"
    t.text "666796X1391X14884CoachName"
    t.string "666796X1392X14887SQ001", limit: 5
    t.string "666796X1392X14888SQ001", limit: 5
    t.string "666796X1392X14889", limit: 5
    t.text "666796X1392X14889other"
    t.string "666796X1392X14890", limit: 1
    t.string "666796X1392X14891SQ001", limit: 5
    t.string "666796X1392X14891SQ002", limit: 5
    t.string "666796X1392X14891SQ003", limit: 5
    t.string "666796X1392X14891SQ004", limit: 5
    t.string "666796X1392X14891SQ005", limit: 5
    t.string "666796X1392X14892SQ001", limit: 5
    t.string "666796X1392X14893", limit: 5
    t.text "666796X1392X14893other"
    t.text "666796X1392X14894"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_666796_2390"
  end

  create_table "lime_survey_666796_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "666796X1390time"
    t.float "666796X1390X14895time"
    t.float "666796X1390X14885time"
    t.float "666796X1390X14874time"
    t.float "666796X1390X14875time"
    t.float "666796X1390X14876time"
    t.float "666796X1390X14877time"
    t.float "666796X1390X14896time"
    t.float "666796X1390X14878time"
    t.float "666796X1390X14879time"
    t.float "666796X1390X14880time"
    t.float "666796X1390X14881time"
    t.float "666796X1390X14882time"
    t.float "666796X1390X14883time"
    t.float "666796X1390X14886time"
    t.float "666796X1391time"
    t.float "666796X1391X14884time"
    t.float "666796X1392time"
    t.float "666796X1392X14887time"
    t.float "666796X1392X14888time"
    t.float "666796X1392X14889time"
    t.float "666796X1392X14890time"
    t.float "666796X1392X14891time"
    t.float "666796X1392X14892time"
    t.float "666796X1392X14893time"
    t.float "666796X1392X14894time"
  end

  create_table "lime_survey_668697", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "668697X939X10490"
    t.text "668697X939X10493"
    t.string "668697X943X10510", limit: 5
    t.text "668697X943X10511"
    t.string "668697X940X10491C1", limit: 5
    t.string "668697X940X10491C2", limit: 5
    t.string "668697X940X10491C3", limit: 5
    t.string "668697X940X10491C4", limit: 5
    t.string "668697X940X10491C5", limit: 5
    t.string "668697X940X10491C6", limit: 5
    t.string "668697X940X10491C7", limit: 5
    t.string "668697X940X10491C8", limit: 5
    t.string "668697X940X10491C9", limit: 5
    t.text "668697X941X10492"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_668697_30304"
  end

  create_table "lime_survey_671159", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "671159X242X2886StudentYear"
    t.text "671159X242X2886StudentEmail"
    t.text "671159X242X2886StudentName"
    t.text "671159X242X2886CoachEmail"
    t.text "671159X242X2886CoachName"
    t.decimal "671159X243X2887CReason", precision: 30, scale: 10
    t.decimal "671159X243X2887Comm", precision: 30, scale: 10
    t.decimal "671159X243X2887Exam", precision: 30, scale: 10
    t.decimal "671159X243X2887PatientInterview", precision: 30, scale: 10
    t.decimal "671159X243X2887Prof", precision: 30, scale: 10
    t.decimal "671159X243X2887Total", precision: 30, scale: 10
    t.text "671159X244X2888Eval1"
    t.text "671159X244X2888Eval2"
    t.text "671159X244X2889"
    t.text "671159X244X2890"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_671159_46148"
  end

  create_table "lime_survey_677249", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "677249X1258X13834SQ001", limit: 5
    t.string "677249X1258X13834SQ002", limit: 5
    t.string "677249X1258X13834SQ003", limit: 5
    t.string "677249X1258X13834SQ004", limit: 5
    t.string "677249X1258X13834SQ005", limit: 5
    t.string "677249X1258X13834SQ006", limit: 5
    t.string "677249X1258X13834SQ007", limit: 5
    t.string "677249X1258X13834SQ008", limit: 5
    t.string "677249X1258X13834SQ009", limit: 5
    t.string "677249X1258X13834SQ010", limit: 5
    t.string "677249X1258X13834SQ011", limit: 5
    t.string "677249X1258X13834SQ012", limit: 5
    t.string "677249X1258X13834SQ013", limit: 5
    t.string "677249X1258X13834SQ014", limit: 5
    t.string "677249X1259X13835SQ001", limit: 5
    t.string "677249X1259X13835SQ002", limit: 5
    t.string "677249X1259X13835SQ003", limit: 5
    t.string "677249X1259X13835SQ004", limit: 5
    t.text "677249X1260X13836"
    t.string "677249X1302X14140SQ001", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_677249_6266"
  end

  create_table "lime_survey_683612", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "683612X1294X14082SQ001", limit: 5
    t.string "683612X1294X14082SQ002", limit: 5
    t.string "683612X1294X14082SQ003", limit: 5
    t.string "683612X1294X14082SQ004", limit: 5
    t.string "683612X1294X14082SQ005", limit: 5
    t.string "683612X1294X14082SQ006", limit: 5
    t.string "683612X1294X14082SQ007", limit: 5
    t.string "683612X1294X14082SQ008", limit: 5
    t.string "683612X1294X14082SQ009", limit: 5
    t.string "683612X1294X14082SQ010", limit: 5
    t.string "683612X1294X14082SQ011", limit: 5
    t.string "683612X1294X14082SQ012", limit: 5
    t.string "683612X1294X14082SQ013", limit: 5
    t.string "683612X1294X14082SQ014", limit: 5
    t.string "683612X1294X14082SQ015", limit: 5
    t.text "683612X1295X14083"
    t.text "683612X1295X14084"
    t.string "683612X1296X14085SQ001", limit: 5
    t.string "683612X1296X14086SQ001", limit: 5
    t.string "683612X1296X14086SQ002", limit: 5
    t.string "683612X1296X14086SQ003", limit: 5
    t.string "683612X1296X14086SQ004", limit: 5
    t.text "683612X1296X14088"
    t.text "683612X1296X14089"
    t.string "683612X1297X14087SQ001", limit: 5
    t.string "683612X1297X14090SQ001", limit: 5
    t.string "683612X1297X14090SQ002", limit: 5
    t.string "683612X1297X14090SQ003", limit: 5
    t.string "683612X1297X14090SQ004", limit: 5
    t.text "683612X1297X14091"
    t.text "683612X1297X14092"
    t.string "683612X1298X14093SQ001", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_683612_19327"
  end

  create_table "lime_survey_692188", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "692188X805X9273"
    t.string "692188X803X9275", limit: 5
    t.text "692188X803X9275other"
    t.string "692188X803X9276", limit: 5
    t.text "692188X803X9276other"
    t.text "692188X803X9267"
    t.text "692188X803X9266"
    t.text "692188X803X9268"
    t.string "692188X803X9269", limit: 1
    t.text "692188X803X9270"
    t.text "692188X803X9277"
    t.text "692188X803X9271"
    t.string "692188X804X9272SQ001", limit: 5
    t.string "692188X804X9272SQ002", limit: 5
    t.string "692188X804X9272SQ003", limit: 5
    t.string "692188X804X9272SQ004", limit: 5
    t.string "692188X804X9272SQ005", limit: 5
    t.string "692188X804X9272SQ006", limit: 5
    t.string "692188X804X9272SQ007", limit: 5
    t.string "692188X804X9272SQ008", limit: 5
    t.string "692188X804X9272SQ009", limit: 5
    t.string "692188X804X9272SQ010", limit: 5
    t.string "692188X804X9272SQ011", limit: 5
    t.text "692188X806X9274StudentYear"
    t.text "692188X806X9274StudentEmail"
    t.text "692188X806X9274StudentName"
    t.text "692188X806X9274CoachEmail"
    t.text "692188X806X9274CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_692188_14432"
  end

  create_table "lime_survey_692188_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "692188X805time"
    t.float "692188X805X9273time"
    t.float "692188X803time"
    t.float "692188X803X9275time"
    t.float "692188X803X9276time"
    t.float "692188X803X9267time"
    t.float "692188X803X9266time"
    t.float "692188X803X9268time"
    t.float "692188X803X9269time"
    t.float "692188X803X9270time"
    t.float "692188X803X9277time"
    t.float "692188X803X9271time"
    t.float "692188X804time"
    t.float "692188X804X9272time"
    t.float "692188X806time"
    t.float "692188X806X9274time"
  end

  create_table "lime_survey_692745", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "692745X1264X13876SQ001", limit: 5
    t.string "692745X1264X13876SQ002", limit: 5
    t.string "692745X1264X13876SQ003", limit: 5
    t.string "692745X1264X13876SQ004", limit: 5
    t.text "692745X1264X13877"
    t.text "692745X1264X13878"
    t.string "692745X1265X13879SQ001", limit: 5
    t.string "692745X1265X13880SQ001", limit: 5
    t.string "692745X1265X13880SQ002", limit: 5
    t.string "692745X1265X13880SQ003", limit: 5
    t.string "692745X1265X13880SQ004", limit: 5
    t.text "692745X1265X13883"
    t.text "692745X1265X13884"
    t.string "692745X1266X13881SQ001", limit: 5
    t.string "692745X1266X13882SQ001", limit: 5
    t.string "692745X1266X13882SQ002", limit: 5
    t.string "692745X1266X13882SQ003", limit: 5
    t.string "692745X1266X13882SQ004", limit: 5
    t.text "692745X1266X13885"
    t.text "692745X1266X13886"
    t.string "692745X1267X13887SQ001", limit: 5
    t.string "692745X1267X13887SQ002", limit: 5
    t.string "692745X1268X13888SQ001", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_692745_43903"
  end

  create_table "lime_survey_693131", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "693131X1237X13729SQ001", limit: 5
    t.string "693131X1237X13729SQ002", limit: 5
    t.string "693131X1237X13729SQ003", limit: 5
    t.string "693131X1237X13729SQ004", limit: 5
    t.text "693131X1237X13734"
    t.string "693131X1238X13730SQ001", limit: 5
    t.string "693131X1238X13730SQ002", limit: 5
    t.string "693131X1239X13731SQ001", limit: 5
    t.string "693131X1239X13731SQ002", limit: 5
    t.string "693131X1239X13731SQ003", limit: 5
    t.string "693131X1239X13731SQ004", limit: 5
    t.string "693131X1239X13731SQ005", limit: 5
    t.string "693131X1239X13731SQ006", limit: 5
    t.string "693131X1239X13731SQ007", limit: 5
    t.string "693131X1239X13731SQ008", limit: 5
    t.string "693131X1239X13731SQ009", limit: 5
    t.string "693131X1239X13731SQ010", limit: 5
    t.text "693131X1239X13735"
    t.string "693131X1240X13732SQ001", limit: 5
    t.text "693131X1241X13733"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_693131_19982"
  end

  create_table "lime_survey_695171", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.decimal "695171X216X2697", precision: 30, scale: 10
    t.text "695171X216X2696"
    t.decimal "695171X216X2690Comp1", precision: 30, scale: 10
    t.decimal "695171X216X2690Comp2", precision: 30, scale: 10
    t.decimal "695171X216X2690Comp3", precision: 30, scale: 10
    t.decimal "695171X216X2690Comp4", precision: 30, scale: 10
    t.decimal "695171X216X2690Comp5", precision: 30, scale: 10
    t.text "695171X217X2692"
    t.text "695171X217X2693"
    t.text "695171X217X2695"
    t.text "695171X217X2694"
    t.text "695171X217X2691"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_695171_47182"
  end

  create_table "lime_survey_696162", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "696162X1441X15516StudentYear"
    t.text "696162X1441X15516StudentEmail"
    t.text "696162X1441X15516StudentName"
    t.text "696162X1441X15516CoachEmail"
    t.text "696162X1441X15516CoachName"
    t.text "696162X1432X15480"
    t.text "696162X1432X15483"
    t.text "696162X1434X15482"
    t.string "696162X1435X15484", limit: 5
    t.text "696162X1435X15485"
    t.string "696162X1433X15481C1", limit: 5
    t.string "696162X1433X15481C2", limit: 5
    t.string "696162X1433X15481C3", limit: 5
    t.string "696162X1433X15481C4", limit: 5
    t.string "696162X1433X15481C5", limit: 5
    t.string "696162X1433X15481C6", limit: 5
    t.string "696162X1433X15481C7", limit: 5
    t.string "696162X1433X15481C8", limit: 5
    t.string "696162X1433X15481C9", limit: 5
    t.index ["token"], name: "idx_survey_token_696162_30970"
  end

  create_table "lime_survey_696695", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "696695X1127X13240SQ001", limit: 5
    t.string "696695X1127X13240SQ002", limit: 5
    t.string "696695X1127X13240SQ005", limit: 5
    t.string "696695X1127X13240SQ004", limit: 5
    t.string "696695X1127X13240SQ003", limit: 5
    t.string "696695X1127X13240SQ006", limit: 5
    t.string "696695X1127X13240SQ007", limit: 5
    t.string "696695X1127X13240SQ008", limit: 5
    t.string "696695X1127X13240SQ009", limit: 5
    t.string "696695X1127X13240SQ010", limit: 5
    t.string "696695X1127X13240SQ012", limit: 5
    t.string "696695X1127X13240SQ011", limit: 5
    t.string "696695X1151X13348SQ001", limit: 5
    t.text "696695X1133X13280"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_696695_36189"
  end

  create_table "lime_survey_698673", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "698673X828X9410", limit: 1
    t.decimal "698673X828X9411", precision: 30, scale: 10
    t.string "698673X828X9412", limit: 5
    t.text "698673X828X9412other"
    t.string "698673X828X9413", limit: 5
    t.text "698673X828X9413other"
    t.string "698673X828X9414", limit: 5
    t.string "698673X828X9415", limit: 5
    t.string "698673X828X9416", limit: 5
    t.string "698673X827X9406", limit: 5
    t.text "698673X827X9407"
    t.string "698673X824X9400Commit", limit: 5
    t.string "698673X824X9400Responsible", limit: 5
    t.string "698673X824X9400Inspire", limit: 5
    t.string "698673X824X9400Active", limit: 5
    t.string "698673X824X9400Honest", limit: 5
    t.string "698673X825X9401LearnAbout", limit: 5
    t.string "698673X825X9401ConveyAny", limit: 5
    t.string "698673X825X9401DevelopAShared", limit: 5
    t.string "698673X825X9401SpecificMeasurable", limit: 5
    t.string "698673X825X9401WorkWithYourStudent", limit: 5
    t.string "698673X825X9401OrganizeInterpret", limit: 5
    t.string "698673X825X9401MonitorYourProgress", limit: 5
    t.string "698673X825X9401IdentifyProblems", limit: 5
    t.string "698673X825X9401SolveProblems", limit: 5
    t.string "698673X825X9401Characterize", limit: 5
    t.text "698673X826X9402"
    t.text "698673X826X9403"
    t.text "698673X823X9399"
    t.text "698673X823X9405"
    t.text "698673X823X9404"
    t.text "698673X823X9408"
    t.text "698673X823X9409"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_698673_34030"
  end

  create_table "lime_survey_699643", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "699643X632X8003", limit: 1
    t.decimal "699643X632X7842", precision: 30, scale: 10
    t.decimal "699643X632X7843", precision: 30, scale: 10
    t.string "699643X633X7844Q1", limit: 5
    t.string "699643X633X7844Q2", limit: 5
    t.string "699643X633X7844Q3", limit: 5
    t.string "699643X633X7844Q4", limit: 5
    t.string "699643X633X7844Q5", limit: 5
    t.string "699643X633X7844Q6", limit: 5
    t.string "699643X633X7844Q7", limit: 5
    t.string "699643X633X7844Q8", limit: 5
    t.string "699643X633X7844Q9", limit: 5
    t.string "699643X633X7844Q10", limit: 5
    t.string "699643X634X7855Q1", limit: 5
    t.string "699643X634X7855Q2", limit: 5
    t.string "699643X635X7858Q1", limit: 5
    t.string "699643X635X7858Q2", limit: 5
    t.string "699643X635X7858Q3", limit: 5
    t.string "699643X636X7862Q1", limit: 5
    t.string "699643X636X7862Q2", limit: 5
    t.string "699643X636X7862Q3", limit: 5
    t.string "699643X637X7866Q1", limit: 5
    t.string "699643X637X7866Q2", limit: 5
    t.string "699643X638X7870Q1", limit: 5
    t.string "699643X638X7870Q2", limit: 5
    t.string "699643X638X7870Q3", limit: 5
    t.text "699643X639X7874"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_699643_33869"
  end

  create_table "lime_survey_712943", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "712943X572X7030StudentYear"
    t.text "712943X572X7030StudentEmail"
    t.text "712943X572X7030StudentName"
    t.text "712943X572X7030CoachEmail"
    t.text "712943X572X7030CoachName"
    t.text "712943X572X7030Course"
    t.decimal "712943X572X7031FUND", precision: 30, scale: 10
    t.decimal "712943X572X7031BLHD", precision: 30, scale: 10
    t.decimal "712943X572X7031SBM", precision: 30, scale: 10
    t.decimal "712943X572X7031CPR", precision: 30, scale: 10
    t.decimal "712943X572X7031HODI", precision: 30, scale: 10
    t.decimal "712943X572X7031NSF", precision: 30, scale: 10
    t.decimal "712943X572X7031DEVH", precision: 30, scale: 10
    t.decimal "712943X572X7032FUND", precision: 30, scale: 10
    t.decimal "712943X572X7032BLHD", precision: 30, scale: 10
    t.decimal "712943X572X7032SBM", precision: 30, scale: 10
    t.decimal "712943X572X7032CPR", precision: 30, scale: 10
    t.decimal "712943X572X7032HODI", precision: 30, scale: 10
    t.decimal "712943X572X7032NSF", precision: 30, scale: 10
    t.decimal "712943X572X7032DEVH", precision: 30, scale: 10
    t.decimal "712943X572X7033FUND", precision: 30, scale: 10
    t.decimal "712943X572X7033BLHD", precision: 30, scale: 10
    t.decimal "712943X572X7033SBM", precision: 30, scale: 10
    t.decimal "712943X572X7033CPR", precision: 30, scale: 10
    t.decimal "712943X572X7033HODI", precision: 30, scale: 10
    t.decimal "712943X572X7033NSF", precision: 30, scale: 10
    t.decimal "712943X572X7033DEVH", precision: 30, scale: 10
    t.decimal "712943X572X7034FUND", precision: 30, scale: 10
    t.decimal "712943X572X7034BLHD", precision: 30, scale: 10
    t.decimal "712943X572X7034SBM", precision: 30, scale: 10
    t.decimal "712943X572X7034CPR", precision: 30, scale: 10
    t.decimal "712943X572X7034HODI", precision: 30, scale: 10
    t.decimal "712943X572X7034NSF", precision: 30, scale: 10
    t.decimal "712943X572X7034DEVH", precision: 30, scale: 10
    t.decimal "712943X572X7035FUND", precision: 30, scale: 10
    t.decimal "712943X572X7035BLHD", precision: 30, scale: 10
    t.decimal "712943X572X7035SBM", precision: 30, scale: 10
    t.decimal "712943X572X7035CPR", precision: 30, scale: 10
    t.decimal "712943X572X7035HODI", precision: 30, scale: 10
    t.decimal "712943X572X7035NSF", precision: 30, scale: 10
    t.decimal "712943X572X7035DEVH", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_712943_40204"
  end

  create_table "lime_survey_717754", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "717754X1113X13117"
    t.text "717754X1113X13118"
    t.text "717754X1113X13119"
    t.string "717754X1105X13109PatientCare1", limit: 5
    t.string "717754X1105X13109PatientCare2", limit: 5
    t.string "717754X1105X13109PatientCare3", limit: 5
    t.string "717754X1105X13109PatientCare4", limit: 5
    t.string "717754X1105X13109PatientCare5", limit: 5
    t.string "717754X1105X13109PatientCare6", limit: 5
    t.string "717754X1105X13109PatientCare7", limit: 5
    t.string "717754X1105X13109PatientCare8", limit: 5
    t.string "717754X1105X13109PatientCare9", limit: 5
    t.string "717754X1106X13110KnowledgePractice1", limit: 5
    t.string "717754X1106X13110KnowledgePractice2", limit: 5
    t.string "717754X1107X13111PracticeBasedLM1", limit: 5
    t.string "717754X1107X13111PracticeBasedLM2", limit: 5
    t.string "717754X1107X13111PracticeBasedLM3", limit: 5
    t.string "717754X1107X13111PracticeBasedLM4", limit: 5
    t.string "717754X1108X13112InterpersonalComm1", limit: 5
    t.string "717754X1109X13113Prof1", limit: 5
    t.string "717754X1110X13114SystemsBasedPrac1", limit: 5
    t.string "717754X1110X13114SystemsBasedPrac2", limit: 5
    t.string "717754X1110X13114SystemsBasedPrac3", limit: 5
    t.string "717754X1111X13115OverallRating1", limit: 5
    t.text "717754X1112X13116"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_717754_38151"
  end

  create_table "lime_survey_719849", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "719849X1216X14153SQ001", limit: 5
    t.string "719849X1216X13639SQ001", limit: 5
    t.string "719849X1216X13639SQ003", limit: 5
    t.string "719849X1216X13639SQ002", limit: 5
    t.string "719849X1217X13640SQ001", limit: 5
    t.string "719849X1217X13640SQ002", limit: 5
    t.string "719849X1217X13640SQ003", limit: 5
    t.string "719849X1217X13640SQ004", limit: 5
    t.string "719849X1217X13640SQ005", limit: 5
    t.string "719849X1217X13640SQ006", limit: 5
    t.string "719849X1217X13640SQ007", limit: 5
    t.string "719849X1218X13641SQ001", limit: 5
    t.text "719849X1219X13642"
    t.text "719849X1219X13643"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_719849_24602"
  end

  create_table "lime_survey_721872", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "721872X1484X16160StudentYear"
    t.text "721872X1484X16160StudentEmail"
    t.text "721872X1484X16160StudentName"
    t.text "721872X1484X16160CoachEmail"
    t.text "721872X1484X16160CoachName"
    t.text "721872X1485X16161CourseYear"
    t.text "721872X1485X16161CourseName"
    t.decimal "721872X1485X16162Week1MCQ", precision: 30, scale: 10
    t.decimal "721872X1485X16162Week2MCQ", precision: 30, scale: 10
    t.decimal "721872X1485X16162Week3MCQ", precision: 30, scale: 10
    t.decimal "721872X1485X16162Week4MCQ", precision: 30, scale: 10
    t.decimal "721872X1485X16162Week5MCQ", precision: 30, scale: 10
    t.decimal "721872X1485X16162Week9MCQAve", precision: 30, scale: 10
    t.text "721872X1485X16163DroppedQuiz"
    t.text "721872X1485X16163DroppedScore"
    t.decimal "721872X1485X16164CSA1", precision: 30, scale: 10
    t.decimal "721872X1485X16164CSA2", precision: 30, scale: 10
    t.decimal "721872X1485X16164Infor", precision: 30, scale: 10
    t.decimal "721872X1485X16164BloodLab", precision: 30, scale: 10
    t.decimal "721872X1485X16164CSL", precision: 30, scale: 10
    t.decimal "721872X1485X16164EHR", precision: 30, scale: 10
    t.decimal "721872X1485X16164HSS2Ave", precision: 30, scale: 10
    t.decimal "721872X1485X16170BSS1Path1", precision: 30, scale: 10
    t.decimal "721872X1485X16170BSS2Path2", precision: 30, scale: 10
    t.decimal "721872X1485X16170BSS3Histo", precision: 30, scale: 10
    t.decimal "721872X1485X16170BSS7Ave", precision: 30, scale: 10
    t.decimal "721872X1485X16165FinalBLHD", precision: 30, scale: 10
    t.decimal "721872X1485X16166NBME", precision: 30, scale: 10
    t.decimal "721872X1485X16167CSAOSCE", precision: 30, scale: 10
    t.decimal "721872X1485X16167HSSInfor", precision: 30, scale: 10
    t.decimal "721872X1485X16167HSSInfAve", precision: 30, scale: 10
    t.decimal "721872X1485X16171BSSPathHeme", precision: 30, scale: 10
    t.decimal "721872X1485X16171BSSCellBioImmuno", precision: 30, scale: 10
    t.decimal "721872X1485X16171BSSHisto", precision: 30, scale: 10
    t.decimal "721872X1485X16171BSSMicro", precision: 30, scale: 10
    t.decimal "721872X1485X16171BSSAve", precision: 30, scale: 10
    t.decimal "721872X1485X16168Component1", precision: 30, scale: 10
    t.decimal "721872X1485X16168Component2A", precision: 30, scale: 10
    t.decimal "721872X1485X16168Component2B", precision: 30, scale: 10
    t.decimal "721872X1485X16168Component3", precision: 30, scale: 10
    t.decimal "721872X1485X16168Component4", precision: 30, scale: 10
    t.decimal "721872X1485X16168Component5A", precision: 30, scale: 10
    t.decimal "721872X1485X16168Component5B", precision: 30, scale: 10
    t.text "721872X1485X16169"
    t.integer "721872X1485X16169_filecount"
    t.index ["token"], name: "idx_survey_token_721872_36988"
  end

  create_table "lime_survey_723278", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "723278X1341X14419StudentYear"
    t.text "723278X1341X14419StudentEmail"
    t.text "723278X1341X14419StudentName"
    t.text "723278X1341X14419CoachEmail"
    t.text "723278X1341X14419CoachName"
    t.text "723278X1342X14420CourseYear"
    t.text "723278X1342X14420CourseName"
    t.decimal "723278X1342X14421Week1MCQ", precision: 30, scale: 10
    t.decimal "723278X1342X14421Week2MCQ", precision: 30, scale: 10
    t.decimal "723278X1342X14421Week3MCQ", precision: 30, scale: 10
    t.decimal "723278X1342X14421Week4MCQ", precision: 30, scale: 10
    t.decimal "723278X1342X14421Week5MCQ", precision: 30, scale: 10
    t.decimal "723278X1342X14421Week6MCQ", precision: 30, scale: 10
    t.text "723278X1342X14422DroppedQuiz"
    t.text "723278X1342X14422DroppedScore"
    t.decimal "723278X1342X14423CSA01", precision: 30, scale: 10
    t.decimal "723278X1342X14423CSA02", precision: 30, scale: 10
    t.decimal "723278X1342X14423CSA03", precision: 30, scale: 10
    t.decimal "723278X1342X14423CSA04", precision: 30, scale: 10
    t.decimal "723278X1342X14423CSA05", precision: 30, scale: 10
    t.decimal "723278X1342X14423CSA06", precision: 30, scale: 10
    t.decimal "723278X1342X14423CSA07", precision: 30, scale: 10
    t.decimal "723278X1342X14423CSA08", precision: 30, scale: 10
    t.decimal "723278X1342X14423CSA09", precision: 30, scale: 10
    t.decimal "723278X1342X14423CSA10", precision: 30, scale: 10
    t.decimal "723278X1342X14423CSA11", precision: 30, scale: 10
    t.decimal "723278X1342X14423CSA12", precision: 30, scale: 10
    t.decimal "723278X1342X14424FinalBlockGast", precision: 30, scale: 10
    t.decimal "723278X1342X14424FinalBlockEndo", precision: 30, scale: 10
    t.decimal "723278X1342X14425NBME", precision: 30, scale: 10
    t.decimal "723278X1342X14429sq001", precision: 30, scale: 10
    t.decimal "723278X1342X14429sq002", precision: 30, scale: 10
    t.decimal "723278X1342X14429sq003", precision: 30, scale: 10
    t.decimal "723278X1342X14429sq004", precision: 30, scale: 10
    t.decimal "723278X1342X14429sq005", precision: 30, scale: 10
    t.decimal "723278X1342X14426OSCE", precision: 30, scale: 10
    t.decimal "723278X1342X14426Histo", precision: 30, scale: 10
    t.decimal "723278X1342X14426Path", precision: 30, scale: 10
    t.decimal "723278X1342X14426Micro", precision: 30, scale: 10
    t.decimal "723278X1342X14426Meta", precision: 30, scale: 10
    t.decimal "723278X1342X14426Anat", precision: 30, scale: 10
    t.decimal "723278X1342X14427Component1", precision: 30, scale: 10
    t.decimal "723278X1342X14427Component2", precision: 30, scale: 10
    t.decimal "723278X1342X14427Component3", precision: 30, scale: 10
    t.decimal "723278X1342X14427Component4", precision: 30, scale: 10
    t.decimal "723278X1342X14427Component5", precision: 30, scale: 10
    t.text "723278X1342X14428"
    t.integer "723278X1342X14428_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_723278_43436"
  end

  create_table "lime_survey_723478", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "723478X1043X12601SQ001"
    t.text "723478X1043X12601SQ002"
    t.text "723478X1043X12601SQ003"
    t.text "723478X1043X12601SQ004"
    t.text "723478X1043X12601SQ005"
    t.text "723478X1043X12601SQ006"
    t.string "723478X1037X12423", limit: 5
    t.string "723478X1037X12430", limit: 5
    t.string "723478X1037X12431", limit: 5
    t.string "723478X1037X12432", limit: 5
    t.string "723478X1037X12433", limit: 5
    t.string "723478X1038X12436SQ001", limit: 5
    t.string "723478X1038X12436SQ002", limit: 5
    t.string "723478X1038X12436SQ003", limit: 5
    t.string "723478X1038X12436SQ004", limit: 5
    t.string "723478X1038X12436SQ005", limit: 5
    t.string "723478X1038X12436SQ006", limit: 5
    t.string "723478X1038X12436SQ007", limit: 5
    t.string "723478X1038X12436SQ008", limit: 5
    t.text "723478X1038X12445"
    t.text "723478X1039X12446"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_723478_41940"
  end

  create_table "lime_survey_731241", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "731241X1318X14250"
    t.string "731241X1316X14252", limit: 5
    t.text "731241X1316X14252other"
    t.string "731241X1316X14253", limit: 5
    t.text "731241X1316X14253other"
    t.text "731241X1316X14244"
    t.text "731241X1316X14243"
    t.text "731241X1316X14245"
    t.string "731241X1316X14246", limit: 1
    t.text "731241X1316X14247"
    t.text "731241X1316X14254"
    t.text "731241X1316X14248"
    t.string "731241X1317X14249SQ001", limit: 5
    t.string "731241X1317X14249SQ002", limit: 5
    t.string "731241X1317X14249SQ003", limit: 5
    t.string "731241X1317X14249SQ004", limit: 5
    t.string "731241X1317X14249SQ005", limit: 5
    t.string "731241X1317X14249SQ006", limit: 5
    t.string "731241X1317X14249SQ007", limit: 5
    t.string "731241X1317X14249SQ008", limit: 5
    t.string "731241X1317X14249SQ009", limit: 5
    t.string "731241X1317X14249SQ010", limit: 5
    t.string "731241X1317X14249SQ011", limit: 5
    t.text "731241X1319X14251StudentYear"
    t.text "731241X1319X14251StudentEmail"
    t.text "731241X1319X14251StudentName"
    t.text "731241X1319X14251CoachEmail"
    t.text "731241X1319X14251CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_731241_30232"
  end

  create_table "lime_survey_731241_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "731241X1318time"
    t.float "731241X1318X14250time"
    t.float "731241X1316time"
    t.float "731241X1316X14252time"
    t.float "731241X1316X14253time"
    t.float "731241X1316X14244time"
    t.float "731241X1316X14243time"
    t.float "731241X1316X14245time"
    t.float "731241X1316X14246time"
    t.float "731241X1316X14247time"
    t.float "731241X1316X14254time"
    t.float "731241X1316X14248time"
    t.float "731241X1317time"
    t.float "731241X1317X14249time"
    t.float "731241X1319time"
    t.float "731241X1319X14251time"
  end

  create_table "lime_survey_732242", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "732242X899X10181StudentYear"
    t.text "732242X899X10181StudentEmail"
    t.text "732242X899X10181StudentName"
    t.text "732242X899X10181CoachEmail"
    t.text "732242X899X10181CoachName"
    t.text "732242X900X10182SQ001"
    t.text "732242X900X10182SQ002"
    t.text "732242X900X10183"
    t.integer "732242X900X10183_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_732242_8625"
  end

  create_table "lime_survey_732933", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "732933X903X10241StudentYear"
    t.text "732933X903X10241StudentEmail"
    t.text "732933X903X10241StudentName"
    t.text "732933X903X10241CoachEmail"
    t.text "732933X903X10241CoachName"
    t.text "732933X904X10242CourseYear"
    t.text "732933X904X10242CourseName"
    t.decimal "732933X904X10243Week1MCQ", precision: 30, scale: 10
    t.decimal "732933X904X10243Week2MCQ", precision: 30, scale: 10
    t.decimal "732933X904X10243Week3MCQ", precision: 30, scale: 10
    t.decimal "732933X904X10243Week4MCQ", precision: 30, scale: 10
    t.decimal "732933X904X10243Week5MCQ", precision: 30, scale: 10
    t.text "732933X904X10244DroppedQuiz"
    t.text "732933X904X10244DroppedScore"
    t.decimal "732933X904X10245CSA01", precision: 30, scale: 10
    t.decimal "732933X904X10245CSA02", precision: 30, scale: 10
    t.decimal "732933X904X10245CSA03", precision: 30, scale: 10
    t.decimal "732933X904X10245CSA04", precision: 30, scale: 10
    t.decimal "732933X904X10245CSA05", precision: 30, scale: 10
    t.decimal "732933X904X10245CSA06", precision: 30, scale: 10
    t.decimal "732933X904X10245CSA07", precision: 30, scale: 10
    t.decimal "732933X904X10246FinalBLHD", precision: 30, scale: 10
    t.decimal "732933X904X10247NBME", precision: 30, scale: 10
    t.decimal "732933X904X10248OSCE", precision: 30, scale: 10
    t.decimal "732933X904X10248Path", precision: 30, scale: 10
    t.decimal "732933X904X10248CellBio", precision: 30, scale: 10
    t.decimal "732933X904X10248Histo", precision: 30, scale: 10
    t.decimal "732933X904X10248PathHeme", precision: 30, scale: 10
    t.decimal "732933X904X10248MicroBio", precision: 30, scale: 10
    t.decimal "732933X904X10249Component1", precision: 30, scale: 10
    t.decimal "732933X904X10249Component2", precision: 30, scale: 10
    t.decimal "732933X904X10249Component3", precision: 30, scale: 10
    t.decimal "732933X904X10249Component4", precision: 30, scale: 10
    t.decimal "732933X904X10249Component5", precision: 30, scale: 10
    t.text "732933X904X10250"
    t.integer "732933X904X10250_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_732933_8666"
  end

  create_table "lime_survey_735127", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "735127X1168X13414SQ001", limit: 5
    t.string "735127X1168X13414SQ002", limit: 5
    t.string "735127X1168X13414SQ003", limit: 5
    t.string "735127X1168X13414SQ004", limit: 5
    t.text "735127X1168X13419"
    t.text "735127X1168X13420"
    t.string "735127X1170X13421SQ001", limit: 5
    t.string "735127X1170X13423SQ001", limit: 5
    t.string "735127X1170X13423SQ002", limit: 5
    t.string "735127X1170X13423SQ003", limit: 5
    t.string "735127X1170X13423SQ004", limit: 5
    t.text "735127X1170X13435"
    t.text "735127X1170X13436"
    t.string "735127X1171X13428SQ001", limit: 5
    t.string "735127X1171X13430SQ001", limit: 5
    t.string "735127X1171X13430SQ002", limit: 5
    t.string "735127X1171X13430SQ003", limit: 5
    t.string "735127X1171X13430SQ004", limit: 5
    t.text "735127X1171X13437"
    t.text "735127X1171X13438"
    t.string "735127X1172X13439SQ001", limit: 5
    t.string "735127X1172X13439SQ002", limit: 5
    t.string "735127X1173X13442SQ001", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_735127_24727"
  end

  create_table "lime_survey_735426", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "735426X717X8646"
    t.text "735426X717X8649"
    t.string "735426X720X8650", limit: 5
    t.text "735426X720X8651"
    t.text "735426X720X8645StudentYear"
    t.text "735426X720X8645StudentEmail"
    t.text "735426X720X8645StudentName"
    t.text "735426X720X8645CoachEmail"
    t.text "735426X720X8645CoachName"
    t.string "735426X718X8647C1", limit: 5
    t.string "735426X718X8647C2", limit: 5
    t.string "735426X718X8647C3", limit: 5
    t.string "735426X718X8647C4", limit: 5
    t.string "735426X718X8647C5", limit: 5
    t.string "735426X718X8647C6", limit: 5
    t.string "735426X718X8647C7", limit: 5
    t.string "735426X718X8647C8", limit: 5
    t.string "735426X718X8647C9", limit: 5
    t.text "735426X719X8648"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_735426_14373"
  end

  create_table "lime_survey_737564", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "ipaddr"
    t.text "737564X1052X12776SQ001"
    t.text "737564X1052X12776SQ002"
    t.text "737564X1052X12776SQ003"
    t.string "737564X1053X12780SQ001", limit: 5
    t.string "737564X1053X12780SQ002", limit: 5
    t.string "737564X1053X12780SQ003", limit: 5
    t.string "737564X1053X12780SQ004", limit: 5
    t.string "737564X1053X12780SQ005", limit: 5
    t.string "737564X1053X12780SQ006", limit: 5
    t.string "737564X1053X12780SQ007", limit: 5
    t.string "737564X1053X12781SQ001", limit: 5
    t.string "737564X1053X12781SQ002", limit: 5
    t.string "737564X1053X12781SQ003", limit: 5
    t.string "737564X1053X12781SQ004", limit: 5
    t.string "737564X1053X12781SQ005", limit: 5
    t.string "737564X1053X12781SQ006", limit: 5
    t.string "737564X1053X12781SQ007", limit: 5
    t.string "737564X1053X12781SQ008", limit: 5
    t.decimal "737564X1053X12782SQ001", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_737564_17154"
  end

  create_table "lime_survey_737849", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "737849X521X6068StudentYear"
    t.text "737849X521X6068StudentEmail"
    t.text "737849X521X6068StudentName"
    t.text "737849X521X6068CoachEmail"
    t.text "737849X521X6068CoachName"
    t.text "737849X518X6044FirstName"
    t.text "737849X518X6044LastName"
    t.text "737849X518X6044Address1"
    t.text "737849X518X6044Address2"
    t.text "737849X518X6044City"
    t.text "737849X518X6044State"
    t.text "737849X518X6044ZipCode"
    t.text "737849X518X6044HomePhone"
    t.text "737849X518X6044MobilePhone"
    t.datetime "737849X518X6045", precision: nil
    t.string "737849X518X6046", limit: 5
    t.text "737849X518X6046other"
    t.string "737849X518X6047", limit: 5
    t.text "737849X518X6047other"
    t.string "737849X518X6048", limit: 5
    t.string "737849X518X60491", limit: 5
    t.string "737849X518X60492", limit: 5
    t.string "737849X518X60493", limit: 5
    t.string "737849X518X60494", limit: 5
    t.string "737849X518X60495", limit: 5
    t.text "737849X518X6049other"
    t.string "737849X518X6050", limit: 5
    t.string "737849X518X6064", limit: 1
    t.text "737849X518X6051Child1_Age1"
    t.text "737849X518X6051Child2_Age1"
    t.text "737849X518X6051Child3_Age1"
    t.text "737849X518X6051Child4_Age1"
    t.text "737849X518X6051Child5_Age1"
    t.text "737849X518X6052City"
    t.text "737849X518X6052State"
    t.text "737849X518X6052Country"
    t.text "737849X518X6053City"
    t.text "737849X518X6053State"
    t.text "737849X518X6053Country"
    t.text "737849X518X6065Hobby1"
    t.text "737849X518X6065Hobby2"
    t.text "737849X518X6065Hobby3"
    t.decimal "737849X519X6054", precision: 30, scale: 10
    t.text "737849X519X6055Row1_Institution"
    t.text "737849X519X6055Row1_DegreeAttained"
    t.text "737849X519X6055Row1_MajorAreaStudy"
    t.text "737849X519X6055Row1_MinorAreaStudy"
    t.text "737849X519X6055Row1_YrGrad"
    t.text "737849X519X6055Row1_ScienceCoursesHrs"
    t.text "737849X519X6055Row1_ScienceCoursesGPA"
    t.text "737849X519X6055Row1_OverallGPA"
    t.text "737849X519X6055Row2_Institution"
    t.text "737849X519X6055Row2_DegreeAttained"
    t.text "737849X519X6055Row2_MajorAreaStudy"
    t.text "737849X519X6055Row2_MinorAreaStudy"
    t.text "737849X519X6055Row2_YrGrad"
    t.text "737849X519X6055Row2_ScienceCoursesHrs"
    t.text "737849X519X6055Row2_ScienceCoursesGPA"
    t.text "737849X519X6055Row2_OverallGPA"
    t.text "737849X519X6055Row3_Institution"
    t.text "737849X519X6055Row3_DegreeAttained"
    t.text "737849X519X6055Row3_MajorAreaStudy"
    t.text "737849X519X6055Row3_MinorAreaStudy"
    t.text "737849X519X6055Row3_YrGrad"
    t.text "737849X519X6055Row3_ScienceCoursesHrs"
    t.text "737849X519X6055Row3_ScienceCoursesGPA"
    t.text "737849X519X6055Row3_OverallGPA"
    t.text "737849X519X6055Row4_Institution"
    t.text "737849X519X6055Row4_DegreeAttained"
    t.text "737849X519X6055Row4_MajorAreaStudy"
    t.text "737849X519X6055Row4_MinorAreaStudy"
    t.text "737849X519X6055Row4_YrGrad"
    t.text "737849X519X6055Row4_ScienceCoursesHrs"
    t.text "737849X519X6055Row4_ScienceCoursesGPA"
    t.text "737849X519X6055Row4_OverallGPA"
    t.text "737849X519X6066"
    t.text "737849X519X6056Row1_YrMCAT"
    t.text "737849X519X6056Row1_PhsySciences"
    t.text "737849X519X6056Row1_VerbalReasoning"
    t.text "737849X519X6056Row1_BioSciences"
    t.text "737849X519X6056Row1_MCATTotScore"
    t.text "737849X519X6056Row2_YrMCAT"
    t.text "737849X519X6056Row2_PhsySciences"
    t.text "737849X519X6056Row2_VerbalReasoning"
    t.text "737849X519X6056Row2_BioSciences"
    t.text "737849X519X6056Row2_MCATTotScore"
    t.text "737849X519X6056Row3_YrMCAT"
    t.text "737849X519X6056Row3_PhsySciences"
    t.text "737849X519X6056Row3_VerbalReasoning"
    t.text "737849X519X6056Row3_BioSciences"
    t.text "737849X519X6056Row3_MCATTotScore"
    t.text "737849X519X6057Row1_YrMCAT"
    t.text "737849X519X6057Row1_ChemPhyBioSys"
    t.text "737849X519X6057Row1_CriticalAnalysis"
    t.text "737849X519X6057Row1_BioFoundOfLivingSys"
    t.text "737849X519X6057Row1_PsychSocBioFoundOfBe"
    t.text "737849X519X6057Row1_MCATTotScore"
    t.text "737849X519X6057Row2_YrMCAT"
    t.text "737849X519X6057Row2_ChemPhyBioSys"
    t.text "737849X519X6057Row2_CriticalAnalysis"
    t.text "737849X519X6057Row2_BioFoundOfLivingSys"
    t.text "737849X519X6057Row2_PsychSocBioFoundOfBe"
    t.text "737849X519X6057Row2_MCATTotScore"
    t.text "737849X519X6057Row3_YrMCAT"
    t.text "737849X519X6057Row3_ChemPhyBioSys"
    t.text "737849X519X6057Row3_CriticalAnalysis"
    t.text "737849X519X6057Row3_BioFoundOfLivingSys"
    t.text "737849X519X6057Row3_PsychSocBioFoundOfBe"
    t.text "737849X519X6057Row3_MCATTotScore"
    t.string "737849X519X6058", limit: 5
    t.text "737849X519X6059Row1_HealthcareSetting"
    t.text "737849X519X6059Row1_CountryServed"
    t.text "737849X519X6059Row1_Role"
    t.text "737849X519X6059Row1_InclusiveYrs"
    t.text "737849X519X6059Row2_HealthcareSetting"
    t.text "737849X519X6059Row2_CountryServed"
    t.text "737849X519X6059Row2_Role"
    t.text "737849X519X6059Row2_InclusiveYrs"
    t.text "737849X519X6059Row3_HealthcareSetting"
    t.text "737849X519X6059Row3_CountryServed"
    t.text "737849X519X6059Row3_Role"
    t.text "737849X519X6059Row3_InclusiveYrs"
    t.text "737849X519X6067Experience1"
    t.text "737849X519X6067Experience2"
    t.text "737849X519X6067Experience3"
    t.string "737849X519X6060", limit: 5
    t.string "737849X519X60611", limit: 5
    t.string "737849X519X60612", limit: 5
    t.string "737849X519X60613", limit: 5
    t.string "737849X519X60614", limit: 5
    t.string "737849X519X60615", limit: 5
    t.string "737849X519X60616", limit: 5
    t.string "737849X519X60617", limit: 5
    t.string "737849X519X60618", limit: 5
    t.string "737849X519X60619", limit: 5
    t.string "737849X519X606110", limit: 5
    t.string "737849X519X606111", limit: 5
    t.string "737849X519X606112", limit: 5
    t.string "737849X519X606113", limit: 5
    t.string "737849X519X606114", limit: 5
    t.string "737849X519X606115", limit: 5
    t.string "737849X519X606116", limit: 5
    t.string "737849X519X606117", limit: 5
    t.string "737849X519X606118", limit: 5
    t.string "737849X519X606119", limit: 5
    t.string "737849X519X606120", limit: 5
    t.string "737849X519X606121", limit: 5
    t.string "737849X519X606122", limit: 5
    t.string "737849X519X606123", limit: 5
    t.string "737849X520X60621", limit: 5
    t.string "737849X520X60622", limit: 5
    t.string "737849X520X60623", limit: 5
    t.string "737849X520X60624", limit: 5
    t.string "737849X520X60625", limit: 5
    t.string "737849X520X60626", limit: 5
    t.string "737849X520X60627", limit: 5
    t.decimal "737849X520X6063NoOfAdults", precision: 30, scale: 10
    t.decimal "737849X520X6063NoOfChildrens", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_737849_298"
  end

  create_table "lime_survey_751219", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "751219X778X9076"
    t.string "751219X776X9078", limit: 5
    t.text "751219X776X9078other"
    t.string "751219X776X9079", limit: 5
    t.text "751219X776X9079other"
    t.text "751219X776X9070"
    t.text "751219X776X9069"
    t.text "751219X776X9071"
    t.string "751219X776X9072", limit: 1
    t.text "751219X776X9073"
    t.text "751219X776X9080"
    t.text "751219X776X9074"
    t.string "751219X777X9075SQ001", limit: 5
    t.string "751219X777X9075SQ002", limit: 5
    t.string "751219X777X9075SQ003", limit: 5
    t.string "751219X777X9075SQ004", limit: 5
    t.string "751219X777X9075SQ005", limit: 5
    t.string "751219X777X9075SQ006", limit: 5
    t.string "751219X777X9075SQ007", limit: 5
    t.string "751219X777X9075SQ008", limit: 5
    t.string "751219X777X9075SQ009", limit: 5
    t.string "751219X777X9075SQ010", limit: 5
    t.string "751219X777X9075SQ011", limit: 5
    t.text "751219X779X9077StudentYear"
    t.text "751219X779X9077StudentEmail"
    t.text "751219X779X9077StudentName"
    t.text "751219X779X9077CoachEmail"
    t.text "751219X779X9077CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_751219_46533"
  end

  create_table "lime_survey_751219_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "751219X778time"
    t.float "751219X778X9076time"
    t.float "751219X776time"
    t.float "751219X776X9078time"
    t.float "751219X776X9079time"
    t.float "751219X776X9070time"
    t.float "751219X776X9069time"
    t.float "751219X776X9071time"
    t.float "751219X776X9072time"
    t.float "751219X776X9073time"
    t.float "751219X776X9080time"
    t.float "751219X776X9074time"
    t.float "751219X777time"
    t.float "751219X777X9075time"
    t.float "751219X779time"
    t.float "751219X779X9077time"
  end

  create_table "lime_survey_756815", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "756815X1274X13936SQ001", limit: 5
    t.string "756815X1274X13936SQ002", limit: 5
    t.string "756815X1274X13936SQ003", limit: 5
    t.string "756815X1274X13936SQ004", limit: 5
    t.text "756815X1274X13937"
    t.text "756815X1274X13938"
    t.string "756815X1275X13939SQ001", limit: 5
    t.string "756815X1275X13940SQ001", limit: 5
    t.string "756815X1275X13940SQ002", limit: 5
    t.string "756815X1275X13940SQ003", limit: 5
    t.string "756815X1275X13940SQ004", limit: 5
    t.text "756815X1275X13943"
    t.text "756815X1275X13944"
    t.string "756815X1276X13941SQ001", limit: 5
    t.string "756815X1276X13942SQ001", limit: 5
    t.string "756815X1276X13942SQ002", limit: 5
    t.string "756815X1276X13942SQ003", limit: 5
    t.string "756815X1276X13942SQ004", limit: 5
    t.text "756815X1276X13945"
    t.text "756815X1276X13946"
    t.string "756815X1277X13947SQ001", limit: 5
    t.string "756815X1277X13947SQ002", limit: 5
    t.string "756815X1278X13948SQ001", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_756815_5545"
  end

  create_table "lime_survey_763739", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "763739X4X556StudentEmail"
    t.text "763739X4X556StudentName"
    t.text "763739X4X556StudentID"
    t.text "763739X4X556CoachEmail"
    t.text "763739X4X556CoachName"
    t.string "763739X25X77RateYourHealth4Weeks", limit: 5
    t.string "763739X25X78ProblemsWalking", limit: 5
    t.string "763739X25X78DifficultDailyWork", limit: 5
    t.string "763739X25X78EmotionsProb", limit: 5
    t.string "763739X25X78PersonalProbUsualWor", limit: 5
    t.string "763739X25X79BodilyPain", limit: 5
    t.string "763739X25X80Past4WeekEnergyLevel", limit: 5
    t.string "763739X25X81BotheredEmotionalPro", limit: 5
    t.string "763739X26X82BennUpset", limit: 5
    t.string "763739X26X82UnableControl", limit: 5
    t.string "763739X26X82FeltNervous", limit: 5
    t.string "763739X26X82FeltConfident", limit: 5
    t.string "763739X26X82FeltGoingYourWay", limit: 5
    t.string "763739X26X82CouldNotCope", limit: 5
    t.string "763739X26X82AbleToControl", limit: 5
    t.string "763739X26X82OnTopOfThings", limit: 5
    t.string "763739X26X82BeenAngered", limit: 5
    t.string "763739X26X82PilingUpHigh", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_763739_1407"
  end

  create_table "lime_survey_765455", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "765455X273X3304StudentYear"
    t.text "765455X273X3304StudentEmail"
    t.text "765455X273X3304StudentName"
    t.text "765455X273X3304CoachEmail"
    t.text "765455X273X3304CoachName"
    t.text "765455X274X3305CourseYear"
    t.text "765455X274X3305CourseName"
    t.decimal "765455X274X3306Week1MCQ", precision: 30, scale: 10
    t.decimal "765455X274X3306Week2MCQ", precision: 30, scale: 10
    t.decimal "765455X274X3306Week3MCQ", precision: 30, scale: 10
    t.decimal "765455X274X3306Week4MCQ", precision: 30, scale: 10
    t.decimal "765455X274X3306Week5MCQ", precision: 30, scale: 10
    t.text "765455X274X3307DroppedQuiz"
    t.text "765455X274X3307DroppedScore"
    t.decimal "765455X274X3308CSA1", precision: 30, scale: 10
    t.decimal "765455X274X3308CSA2", precision: 30, scale: 10
    t.decimal "765455X274X3308CSA3", precision: 30, scale: 10
    t.decimal "765455X274X3308CSA4", precision: 30, scale: 10
    t.decimal "765455X274X3308CSA5", precision: 30, scale: 10
    t.decimal "765455X274X3308CSA6", precision: 30, scale: 10
    t.decimal "765455X274X3309", precision: 30, scale: 10
    t.decimal "765455X274X3310", precision: 30, scale: 10
    t.decimal "765455X274X3311Comp5a", precision: 30, scale: 10
    t.decimal "765455X274X3311Comp5b", precision: 30, scale: 10
    t.decimal "765455X274X3311Comp5c", precision: 30, scale: 10
    t.decimal "765455X274X3311Comp5d", precision: 30, scale: 10
    t.decimal "765455X274X3312Component1", precision: 30, scale: 10
    t.decimal "765455X274X3312Component2", precision: 30, scale: 10
    t.decimal "765455X274X3312Component3", precision: 30, scale: 10
    t.decimal "765455X274X3312Component4", precision: 30, scale: 10
    t.decimal "765455X274X3312Component5", precision: 30, scale: 10
    t.text "765455X274X3313"
    t.integer "765455X274X3313_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_765455_32089"
  end

  create_table "lime_survey_766876", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "766876X674X8216"
    t.text "766876X674X8219"
    t.string "766876X677X8220", limit: 5
    t.text "766876X677X8221"
    t.text "766876X677X8215StudentYear"
    t.text "766876X677X8215StudentEmail"
    t.text "766876X677X8215StudentName"
    t.text "766876X677X8215CoachEmail"
    t.text "766876X677X8215CoachName"
    t.string "766876X675X8217C1", limit: 5
    t.string "766876X675X8217C2", limit: 5
    t.string "766876X675X8217C3", limit: 5
    t.string "766876X675X8217C4", limit: 5
    t.string "766876X675X8217C5", limit: 5
    t.string "766876X675X8217C6", limit: 5
    t.string "766876X675X8217C7", limit: 5
    t.string "766876X675X8217C8", limit: 5
    t.string "766876X675X8217C9", limit: 5
    t.text "766876X676X8218"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_766876_39868"
  end

  create_table "lime_survey_767155", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "767155X427X4616StudentYear"
    t.text "767155X427X4616StudentEmail"
    t.text "767155X427X4616StudentName"
    t.text "767155X427X4616CoachEmail"
    t.text "767155X427X4616CoachName"
    t.text "767155X426X4614InterComp1"
    t.text "767155X426X4614InterComp2"
    t.text "767155X426X4614InterComp3"
    t.text "767155X426X4614InterComp4"
    t.text "767155X426X4614InterFinal"
    t.decimal "767155X426X4615", precision: 30, scale: 10
    t.text "767155X428X4617Level1"
    t.text "767155X428X4617Level2"
    t.text "767155X428X4617Level3"
    t.text "767155X428X4617Total"
    t.text "767155X428X4618ICS3"
    t.text "767155X428X4619SBPIC4"
    t.text "767155X428X4620ICS3"
    t.text "767155X428X4620MK1"
    t.text "767155X428X4620MK2"
    t.text "767155X428X4620MK3"
    t.text "767155X428X4620MK5"
    t.text "767155X428X4620PBLI1"
    t.text "767155X428X4620PBLI2"
    t.text "767155X428X4620PBLI4"
    t.text "767155X428X4620PPPD7"
    t.text "767155X428X4620PPPD8"
    t.text "767155X428X4620SBPIC2"
    t.text "767155X428X4620SBPIC4"
    t.text "767155X429X4621"
    t.integer "767155X429X4621_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_767155_27453"
  end

  create_table "lime_survey_771162", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "771162X1412X15153StudentYear"
    t.text "771162X1412X15153StudentEmail"
    t.text "771162X1412X15153StudentName"
    t.text "771162X1412X15153CoachEmail"
    t.text "771162X1412X15153CoachName"
    t.text "771162X1413X15154ExamDt1"
    t.text "771162X1413X15154ExamSc1"
    t.text "771162X1413X15154ExamDt2"
    t.text "771162X1413X15154ExamSc2"
    t.text "771162X1413X15155"
    t.integer "771162X1413X15155_filecount"
    t.index ["token"], name: "idx_survey_token_771162_14794"
  end

  create_table "lime_survey_771525", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "771525X931X10425", limit: 5
    t.text "771525X931X10426"
    t.string "771525X928X10419Commit", limit: 5
    t.string "771525X928X10419Responsible", limit: 5
    t.string "771525X928X10419Inspire", limit: 5
    t.string "771525X928X10419Active", limit: 5
    t.string "771525X928X10419Honest", limit: 5
    t.string "771525X929X10420LearnAbout", limit: 5
    t.string "771525X929X10420ConveyAny", limit: 5
    t.string "771525X929X10420DevelopAShared", limit: 5
    t.string "771525X929X10420SpecificMeasurable", limit: 5
    t.string "771525X929X10420WorkWithYourStudent", limit: 5
    t.string "771525X929X10420OrganizeInterpret", limit: 5
    t.string "771525X929X10420MonitorYourProgress", limit: 5
    t.string "771525X929X10420IdentifyProblems", limit: 5
    t.string "771525X929X10420SolveProblems", limit: 5
    t.string "771525X929X10420Characterize", limit: 5
    t.text "771525X930X10421"
    t.text "771525X930X10422"
    t.text "771525X927X10418"
    t.text "771525X927X10424"
    t.text "771525X927X10423"
    t.text "771525X927X10427"
    t.text "771525X927X10428"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_771525_3744"
  end

  create_table "lime_survey_775361", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "775361X864X9672StudentYear"
    t.text "775361X864X9672StudentEmail"
    t.text "775361X864X9672StudentName"
    t.text "775361X864X9672CoachEmail"
    t.text "775361X864X9672CoachName"
    t.text "775361X865X9673"
    t.integer "775361X865X9673_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_775361_4711"
  end

  create_table "lime_survey_777581", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "777581X901X10191StudentYear"
    t.text "777581X901X10191StudentEmail"
    t.text "777581X901X10191StudentName"
    t.text "777581X901X10191CoachEmail"
    t.text "777581X901X10191CoachName"
    t.text "777581X902X10192CourseYear"
    t.text "777581X902X10192CourseName"
    t.decimal "777581X902X10193Week1MCQ", precision: 30, scale: 10
    t.decimal "777581X902X10193Week2MCQ", precision: 30, scale: 10
    t.decimal "777581X902X10193Week3MCQ", precision: 30, scale: 10
    t.decimal "777581X902X10193Week4MCQ", precision: 30, scale: 10
    t.decimal "777581X902X10193Week5MCQ", precision: 30, scale: 10
    t.decimal "777581X902X10193Week6MCQ", precision: 30, scale: 10
    t.decimal "777581X902X10193Week7MCQ", precision: 30, scale: 10
    t.text "777581X902X10194DroppedQuiz"
    t.text "777581X902X10194DroppedScore"
    t.decimal "777581X902X10195CSA01", precision: 30, scale: 10
    t.decimal "777581X902X10195CSA02", precision: 30, scale: 10
    t.decimal "777581X902X10195CSA03", precision: 30, scale: 10
    t.decimal "777581X902X10195CSA04", precision: 30, scale: 10
    t.decimal "777581X902X10195CSA05", precision: 30, scale: 10
    t.decimal "777581X902X10195CSA06", precision: 30, scale: 10
    t.decimal "777581X902X10195CSA07", precision: 30, scale: 10
    t.decimal "777581X902X10195CSA08", precision: 30, scale: 10
    t.decimal "777581X902X10195CSA09", precision: 30, scale: 10
    t.decimal "777581X902X10195CSA10", precision: 30, scale: 10
    t.decimal "777581X902X10196Final", precision: 30, scale: 10
    t.decimal "777581X902X10197NBME", precision: 30, scale: 10
    t.decimal "777581X902X10198Anat", precision: 30, scale: 10
    t.decimal "777581X902X10198ReproBio", precision: 30, scale: 10
    t.decimal "777581X902X10198HistoPath", precision: 30, scale: 10
    t.decimal "777581X902X10198Infor", precision: 30, scale: 10
    t.decimal "777581X902X10198OSCE", precision: 30, scale: 10
    t.decimal "777581X902X10198Microbio", precision: 30, scale: 10
    t.decimal "777581X902X10199Component1", precision: 30, scale: 10
    t.decimal "777581X902X10199Component2", precision: 30, scale: 10
    t.decimal "777581X902X10199Component3", precision: 30, scale: 10
    t.decimal "777581X902X10199Component4", precision: 30, scale: 10
    t.decimal "777581X902X10199Component5", precision: 30, scale: 10
    t.text "777581X902X10200"
    t.integer "777581X902X10200_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_777581_13188"
  end

  create_table "lime_survey_777632", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "777632X105X1599", limit: 255
    t.text "777632X102X1598StudentEmail"
    t.text "777632X102X1598StudentName"
    t.text "777632X102X1598StudentID"
    t.text "777632X102X1598CoachEmail"
    t.text "777632X102X1598CoachName"
    t.string "777632X103X1592RateYourHealth4Weeks", limit: 5
    t.string "777632X103X1593ProblemsWalking", limit: 5
    t.string "777632X103X1593DifficultDailyWork", limit: 5
    t.string "777632X103X1593EmotionsProb", limit: 5
    t.string "777632X103X1593PersonalProbUsualWor", limit: 5
    t.string "777632X103X1594BodilyPain", limit: 5
    t.string "777632X103X1595Past4WeekEnergyLevel", limit: 5
    t.string "777632X103X1596BotheredEmotionalPro", limit: 5
    t.string "777632X104X1597BennUpset", limit: 5
    t.string "777632X104X1597UnableControl", limit: 5
    t.string "777632X104X1597FeltNervous", limit: 5
    t.string "777632X104X1597FeltConfident", limit: 5
    t.string "777632X104X1597FeltGoingYourWay", limit: 5
    t.string "777632X104X1597CouldNotCope", limit: 5
    t.string "777632X104X1597AbleToControl", limit: 5
    t.string "777632X104X1597OnTopOfThings", limit: 5
    t.string "777632X104X1597BeenAngered", limit: 5
    t.string "777632X104X1597PilingUpHigh", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_777632_1953"
  end

  create_table "lime_survey_777632_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "777632X105time"
    t.float "777632X105X1599time"
    t.float "777632X102time"
    t.float "777632X102X1598time"
    t.float "777632X103time"
    t.float "777632X103X1592time"
    t.float "777632X103X1593time"
    t.float "777632X103X1594time"
    t.float "777632X103X1595time"
    t.float "777632X103X1596time"
    t.float "777632X104time"
    t.float "777632X104X1597time"
  end

  create_table "lime_survey_777786", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "777786X122X1961", limit: 5
    t.string "777786X122X1962", limit: 255
    t.string "777786X89X1402Clarify", limit: 5
    t.string "777786X89X1402Represents", limit: 5
    t.string "777786X89X1402Responsible", limit: 5
    t.string "777786X89X1402Inspire", limit: 5
    t.string "777786X89X1402Determine", limit: 5
    t.string "777786X89X1402Active", limit: 5
    t.string "777786X89X1402Honest", limit: 5
    t.string "777786X90X1403SeekAndHear", limit: 5
    t.string "777786X90X1403LearnAbout", limit: 5
    t.string "777786X90X1403ConveyAny", limit: 5
    t.string "777786X90X1403DevelopAShared", limit: 5
    t.string "777786X90X1403SpecificMeasurable", limit: 5
    t.string "777786X90X1403WorkWithYourStudent", limit: 5
    t.string "777786X90X1403OrganizeInterpret", limit: 5
    t.string "777786X90X1403DetermineTimelines", limit: 5
    t.string "777786X90X1403MonitorYourProgress", limit: 5
    t.string "777786X90X1403IdentifyProblems", limit: 5
    t.string "777786X90X1403SolveProblems", limit: 5
    t.string "777786X90X1403Characterize", limit: 5
    t.string "777786X91X1404RecognizePersFeeling", limit: 5
    t.string "777786X91X1404AwareOfEmotions", limit: 5
    t.string "777786X91X1404InvestigateBehavior", limit: 5
    t.string "777786X91X1404ContradictoryFeeling", limit: 5
    t.string "777786X91X1404ThinkingHabits", limit: 5
    t.string "777786X91X1404TrustingRelationship", limit: 5
    t.string "777786X91X1404SafeLearning", limit: 5
    t.string "777786X91X1404Commitment", limit: 5
    t.string "777786X91X1404Affirm", limit: 5
    t.string "777786X91X1404AcceptFeedback", limit: 5
    t.string "777786X91X1404Stimulates", limit: 5
    t.string "777786X91X1404Encourage", limit: 5
    t.string "777786X91X1404EncourageProfDev", limit: 5
    t.string "777786X91X1404ConstructiveFeedback", limit: 5
    t.text "777786X92X1405"
    t.text "777786X92X1406"
    t.text "777786X88X1400"
    t.text "777786X88X1410"
    t.text "777786X88X1409"
    t.string "777786X88X2130", limit: 255
    t.string "777786X88X2131", limit: 255
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_777786_35677"
  end

  create_table "lime_survey_783623", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "783623X809X9301"
    t.string "783623X807X9303", limit: 5
    t.text "783623X807X9303other"
    t.string "783623X807X9304", limit: 5
    t.text "783623X807X9304other"
    t.text "783623X807X9295"
    t.text "783623X807X9294"
    t.text "783623X807X9296"
    t.string "783623X807X9297", limit: 1
    t.text "783623X807X9298"
    t.text "783623X807X9305"
    t.text "783623X807X9299"
    t.string "783623X808X9300SQ001", limit: 5
    t.string "783623X808X9300SQ002", limit: 5
    t.string "783623X808X9300SQ003", limit: 5
    t.string "783623X808X9300SQ004", limit: 5
    t.string "783623X808X9300SQ005", limit: 5
    t.string "783623X808X9300SQ006", limit: 5
    t.string "783623X808X9300SQ007", limit: 5
    t.string "783623X808X9300SQ008", limit: 5
    t.string "783623X808X9300SQ009", limit: 5
    t.string "783623X808X9300SQ010", limit: 5
    t.string "783623X808X9300SQ011", limit: 5
    t.text "783623X810X9302StudentYear"
    t.text "783623X810X9302StudentEmail"
    t.text "783623X810X9302StudentName"
    t.text "783623X810X9302CoachEmail"
    t.text "783623X810X9302CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_783623_35943"
  end

  create_table "lime_survey_783623_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "783623X809time"
    t.float "783623X809X9301time"
    t.float "783623X807time"
    t.float "783623X807X9303time"
    t.float "783623X807X9304time"
    t.float "783623X807X9295time"
    t.float "783623X807X9294time"
    t.float "783623X807X9296time"
    t.float "783623X807X9297time"
    t.float "783623X807X9298time"
    t.float "783623X807X9305time"
    t.float "783623X807X9299time"
    t.float "783623X808time"
    t.float "783623X808X9300time"
    t.float "783623X810time"
    t.float "783623X810X9302time"
  end

  create_table "lime_survey_784264", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "784264X551X6845InstructorKnowledge", limit: 5
    t.string "784264X551X6845InstructorWellPrep", limit: 5
    t.string "784264X551X6845InstructorRate", limit: 5
    t.text "784264X551X6846"
    t.text "784264X551X6847"
    t.text "784264X551X6848"
    t.text "784264X551X6849"
    t.text "784264X551X6850"
    t.text "784264X551X6851"
    t.string "784264X551X6852ClickerQ", limit: 5
    t.string "784264X551X6852Brief", limit: 5
    t.string "784264X551X6852Pair", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_784264_13496"
  end

  create_table "lime_survey_784488", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "784488X1058X12852SQ001"
    t.text "784488X1058X12852SQ002"
    t.text "784488X1058X12852SQ003"
    t.string "784488X1058X12873", limit: 5
    t.text "784488X1058X12873other"
    t.string "784488X1058X12882SQ001", limit: 5
    t.text "784488X1058X12882SQ001comment"
    t.string "784488X1058X12882SQ002", limit: 5
    t.text "784488X1058X12882SQ002comment"
    t.string "784488X1058X12882SQ003", limit: 5
    t.text "784488X1058X12882SQ003comment"
    t.string "784488X1058X12882SQ004", limit: 5
    t.text "784488X1058X12882SQ004comment"
    t.text "784488X1058X12882other"
    t.text "784488X1058X12882othercomment"
    t.decimal "784488X1063X12901SQ001", precision: 30, scale: 10
    t.decimal "784488X1063X12901SQ002", precision: 30, scale: 10
    t.decimal "784488X1063X12901SQ003", precision: 30, scale: 10
    t.string "784488X1063X12921SQ001", limit: 5
    t.string "784488X1063X12921SQ002", limit: 5
    t.string "784488X1063X12921SQ003", limit: 5
    t.string "784488X1063X12941SQ001", limit: 5
    t.string "784488X1063X12941SQ004", limit: 5
    t.string "784488X1063X12941SQ003", limit: 5
    t.string "784488X1063X12941SQ002", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_784488_46118"
  end

  create_table "lime_survey_786237", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "786237X758X8950"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_786237_24870"
  end

  create_table "lime_survey_788731", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "788731X578X7099StudentYear"
    t.text "788731X578X7099StudentID"
    t.text "788731X578X7099StudentEmail"
    t.text "788731X578X7099StudentName"
    t.text "788731X578X7099CoachEmail"
    t.text "788731X578X7099CoachName"
    t.text "788731X580X7104Name"
    t.text "788731X580X7104StartDt"
    t.text "788731X580X7104EndDt"
    t.text "788731X580X7104SubmitDt"
    t.text "788731X580X7104Eval"
    t.text "788731X577X7098NeuroComp1"
    t.text "788731X577X7098NeuroComp2"
    t.text "788731X577X7098NeuroComp3"
    t.text "788731X577X7098NeuroComp4"
    t.text "788731X577X7098NeuroFinal"
    t.text "788731X581X7106ProfConcerns"
    t.text "788731X581X7106CommProfConcerns"
    t.text "788731X581X7106OverSummCommPerf"
    t.text "788731X581X7106AddCommOnPerform"
    t.text "788731X581X7106MSPE"
    t.text "788731X581X7106OptClinicExpComm"
    t.text "788731X581X7106Feedback"
    t.text "788731X579X7100Level0"
    t.text "788731X579X7100Level1"
    t.text "788731X579X7100Level2"
    t.text "788731X579X7100Level3"
    t.text "788731X579X7100Total"
    t.text "788731X579X7105ICS4"
    t.text "788731X579X7105ICS8"
    t.text "788731X579X7105MK1"
    t.text "788731X579X7105MK2"
    t.text "788731X579X7105PCP1"
    t.text "788731X579X7105PCP2"
    t.text "788731X579X7105PCP3"
    t.text "788731X579X7105PPPD10"
    t.text "788731X579X7101ICS4"
    t.text "788731X579X7101ICS8"
    t.text "788731X579X7101MK1"
    t.text "788731X579X7101MK2"
    t.text "788731X579X7101PCP1"
    t.text "788731X579X7101PCP2"
    t.text "788731X579X7101PCP3"
    t.text "788731X579X7101PPPD10"
    t.text "788731X579X7102ICS4"
    t.text "788731X579X7102ICS8"
    t.text "788731X579X7102MK1"
    t.text "788731X579X7102MK2"
    t.text "788731X579X7102PCP1"
    t.text "788731X579X7102PCP2"
    t.text "788731X579X7102PCP3"
    t.text "788731X579X7102PPPD10"
    t.text "788731X579X7103ICS4"
    t.text "788731X579X7103ICS8"
    t.text "788731X579X7103MK1"
    t.text "788731X579X7103MK2"
    t.text "788731X579X7103PCP1"
    t.text "788731X579X7103PCP2"
    t.text "788731X579X7103PCP3"
    t.text "788731X579X7103PPPD10"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_788731_7096"
  end

  create_table "lime_survey_789651", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "789651X422X4538"
    t.string "789651X420X4540", limit: 5
    t.string "789651X420X4541", limit: 5
    t.text "789651X420X4532"
    t.text "789651X420X4531"
    t.text "789651X420X4533"
    t.string "789651X420X4534", limit: 1
    t.text "789651X420X4535"
    t.text "789651X420X4542"
    t.text "789651X420X4536"
    t.string "789651X421X4537SQ001", limit: 5
    t.string "789651X421X4537SQ002", limit: 5
    t.string "789651X421X4537SQ003", limit: 5
    t.string "789651X421X4537SQ004", limit: 5
    t.string "789651X421X4537SQ005", limit: 5
    t.string "789651X421X4537SQ006", limit: 5
    t.string "789651X421X4537SQ007", limit: 5
    t.string "789651X421X4537SQ008", limit: 5
    t.string "789651X421X4537SQ009", limit: 5
    t.string "789651X421X4537SQ010", limit: 5
    t.string "789651X421X4537SQ011", limit: 5
    t.text "789651X423X4539StudentYear"
    t.text "789651X423X4539StudentEmail"
    t.text "789651X423X4539StudentName"
    t.text "789651X423X4539CoachEmail"
    t.text "789651X423X4539CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_789651_47454"
  end

  create_table "lime_survey_789651_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "789651X422time"
    t.float "789651X422X4538time"
    t.float "789651X420time"
    t.float "789651X420X4540time"
    t.float "789651X420X4541time"
    t.float "789651X420X4532time"
    t.float "789651X420X4531time"
    t.float "789651X420X4533time"
    t.float "789651X420X4534time"
    t.float "789651X420X4535time"
    t.float "789651X420X4542time"
    t.float "789651X420X4536time"
    t.float "789651X421time"
    t.float "789651X421X4537time"
    t.float "789651X423time"
    t.float "789651X423X4539time"
  end

  create_table "lime_survey_791695", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "791695X1424X15384StudentYear"
    t.text "791695X1424X15384StudentID"
    t.text "791695X1424X15384MedhubID"
    t.text "791695X1424X15384StudentEmail"
    t.text "791695X1424X15384StudentName"
    t.text "791695X1424X15384CoachEmail"
    t.text "791695X1424X15384CoachName"
    t.text "791695X1426X15386CourseName"
    t.text "791695X1426X15386CourseID"
    t.text "791695X1426X15386StartDt"
    t.text "791695X1426X15386EndDt"
    t.text "791695X1426X15386SubmitDt"
    t.text "791695X1426X15386Eval"
    t.text "791695X1426X15386FinalGrade"
    t.text "791695X1426X15386Env"
    t.text "791695X1427X15387ProfConcerns"
    t.text "791695X1427X15387CommProfConcerns"
    t.text "791695X1427X15387OverSummCommPerf"
    t.text "791695X1427X15387AddCommOnPerform"
    t.text "791695X1427X15387MSPE"
    t.text "791695X1427X15387OptClinicExpComm"
    t.text "791695X1427X15387Feedback"
    t.text "791695X1425X15385ICS1"
    t.text "791695X1425X15385ICS2"
    t.text "791695X1425X15385ICS3"
    t.text "791695X1425X15385ICS4"
    t.text "791695X1425X15385ICS5"
    t.text "791695X1425X15385ICS6"
    t.text "791695X1425X15385ICS7"
    t.text "791695X1425X15385ICS8"
    t.text "791695X1425X15385MK1"
    t.text "791695X1425X15385MK2"
    t.text "791695X1425X15385MK3"
    t.text "791695X1425X15385MK4"
    t.text "791695X1425X15385MK5"
    t.text "791695X1425X15385PBLI1"
    t.text "791695X1425X15385PBLI2"
    t.text "791695X1425X15385PBLI3"
    t.text "791695X1425X15385PBLI4"
    t.text "791695X1425X15385PBLI5"
    t.text "791695X1425X15385PBLI6"
    t.text "791695X1425X15385PBLI7"
    t.text "791695X1425X15385PBLI8"
    t.text "791695X1425X15385PCP1"
    t.text "791695X1425X15385PCP2"
    t.text "791695X1425X15385PCP3"
    t.text "791695X1425X15385PCP4"
    t.text "791695X1425X15385PCP5"
    t.text "791695X1425X15385PCP6"
    t.text "791695X1425X15385PPPD01"
    t.text "791695X1425X15385PPPD02"
    t.text "791695X1425X15385PPPD03"
    t.text "791695X1425X15385PPPD04"
    t.text "791695X1425X15385PPPD05"
    t.text "791695X1425X15385PPPD06"
    t.text "791695X1425X15385PPPD07"
    t.text "791695X1425X15385PPPD08"
    t.text "791695X1425X15385PPPD09"
    t.text "791695X1425X15385PPPD10"
    t.text "791695X1425X15385PPPD11"
    t.text "791695X1425X15385SBPIC1"
    t.text "791695X1425X15385SBPIC2"
    t.text "791695X1425X15385SBPIC3"
    t.text "791695X1425X15385SBPIC4"
    t.text "791695X1425X15385SBPIC5"
    t.index ["791695X1424X15384StudentEmail", "id"], name: "idx_lime_survey_791695_student_email"
    t.index ["token"], name: "idx_survey_token_791695_6567"
  end

  create_table "lime_survey_794391", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "794391X1480X16038StudentYear"
    t.text "794391X1480X16038StudentEmail"
    t.text "794391X1480X16038StudentName"
    t.text "794391X1480X16038CoachEmail"
    t.text "794391X1480X16038CoachName"
    t.decimal "794391X1481X16039Week1MCQ", precision: 30, scale: 10
    t.decimal "794391X1481X16039Week2MCQ", precision: 30, scale: 10
    t.decimal "794391X1481X16039Week3MCQ", precision: 30, scale: 10
    t.decimal "794391X1481X16039Week4MCQ", precision: 30, scale: 10
    t.decimal "794391X1481X16039Week5MCQ", precision: 30, scale: 10
    t.decimal "794391X1481X16039Week6MCQ", precision: 30, scale: 10
    t.decimal "794391X1481X16039Week7MCQ", precision: 30, scale: 10
    t.decimal "794391X1481X16039Week8MCQ", precision: 30, scale: 10
    t.decimal "794391X1481X16039MCQAve", precision: 30, scale: 10
    t.text "794391X1481X16040DroppedQuiz"
    t.text "794391X1481X16040DroppedScore"
    t.decimal "794391X1481X16041CSA1", precision: 30, scale: 10
    t.decimal "794391X1481X16041CSA2", precision: 30, scale: 10
    t.decimal "794391X1481X16041CSA3", precision: 30, scale: 10
    t.decimal "794391X1481X16041CSA4EHR", precision: 30, scale: 10
    t.decimal "794391X1481X16041CSA5CSL", precision: 30, scale: 10
    t.decimal "794391X1481X16041CSA6Actlearn", precision: 30, scale: 10
    t.decimal "794391X1481X16041HSSAve", precision: 30, scale: 10
    t.decimal "794391X1481X16047BSS1AnatPB", precision: 30, scale: 10
    t.decimal "794391X1481X16047BSS2AnatPL1", precision: 30, scale: 10
    t.decimal "794391X1481X16047BSS3AnatPL2", precision: 30, scale: 10
    t.decimal "794391X1481X16047BSS4Neuro", precision: 30, scale: 10
    t.decimal "794391X1481X16047BSS5AHisto", precision: 30, scale: 10
    t.decimal "794391X1481X16047BSS6Anat", precision: 30, scale: 10
    t.decimal "794391X1481X16047BSSAvg", precision: 30, scale: 10
    t.decimal "794391X1481X16042Final1", precision: 30, scale: 10
    t.decimal "794391X1481X16042Final2", precision: 30, scale: 10
    t.decimal "794391X1481X16043NBME", precision: 30, scale: 10
    t.decimal "794391X1481X16044HSSOSCE", precision: 30, scale: 10
    t.decimal "794391X1481X16044HSSAvg", precision: 30, scale: 10
    t.decimal "794391X1481X16048BSSHisto", precision: 30, scale: 10
    t.decimal "794391X1481X16048BSSAnatPract", precision: 30, scale: 10
    t.decimal "794391X1481X16048BSSNeuroAnat", precision: 30, scale: 10
    t.decimal "794391X1481X16048BSSAvg", precision: 30, scale: 10
    t.decimal "794391X1481X16045Component1", precision: 30, scale: 10
    t.decimal "794391X1481X16045Component2A", precision: 30, scale: 10
    t.decimal "794391X1481X16045Component2B", precision: 30, scale: 10
    t.decimal "794391X1481X16045Component3", precision: 30, scale: 10
    t.decimal "794391X1481X16045Component4", precision: 30, scale: 10
    t.decimal "794391X1481X16045Component5A", precision: 30, scale: 10
    t.decimal "794391X1481X16045Component5B", precision: 30, scale: 10
    t.text "794391X1481X16046"
    t.integer "794391X1481X16046_filecount"
    t.index ["token"], name: "idx_survey_token_794391_5346"
  end

  create_table "lime_survey_795622", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "795622X482X5428RecognizePersFeeling", limit: 5
    t.string "795622X482X5428AwareOfEmotions", limit: 5
    t.string "795622X482X5428InvestigateBehavior", limit: 5
    t.string "795622X482X5428ContradictoryFeeling", limit: 5
    t.string "795622X482X5428ThinkingHabits", limit: 5
    t.string "795622X482X5428TrustingRelationship", limit: 5
    t.string "795622X482X5428SafeLearning", limit: 5
    t.string "795622X482X5428Commitment", limit: 5
    t.string "795622X482X5428Affirm", limit: 5
    t.string "795622X482X5428AcceptFeedback", limit: 5
    t.string "795622X482X5428Stimulates", limit: 5
    t.string "795622X482X5428Encourage", limit: 5
    t.string "795622X482X5428EncourageProfDev", limit: 5
    t.string "795622X482X5428ConstructiveFeedback", limit: 5
    t.text "795622X483X5429"
    t.text "795622X483X5430"
    t.text "795622X481X5427"
    t.text "795622X481X5432"
    t.text "795622X481X5431"
    t.text "795622X481X5433"
    t.text "795622X481X5434"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_795622_43759"
  end

  create_table "lime_survey_795667", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "795667X75X1273InstructorKnowledge", limit: 5
    t.string "795667X75X1273InstructorWellPrep", limit: 5
    t.string "795667X75X1273InstructorRate", limit: 5
    t.text "795667X75X1274"
    t.text "795667X75X1275"
    t.text "795667X75X1276"
    t.string "795667X75X1277", limit: 255
    t.string "795667X75X1278", limit: 255
    t.string "795667X75X1279", limit: 255
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_795667_32907"
  end

  create_table "lime_survey_796478", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "796478X405X4423StudentEmail"
    t.text "796478X405X4423StudentName"
    t.text "796478X405X4423StudentID"
    t.text "796478X405X4423CoachEmail"
    t.text "796478X405X4423CoachName"
    t.string "796478X406X4417RateYourHealth4Weeks", limit: 5
    t.string "796478X406X4418ProblemsWalking", limit: 5
    t.string "796478X406X4418DifficultDailyWork", limit: 5
    t.string "796478X406X4418EmotionsProb", limit: 5
    t.string "796478X406X4418PersonalProbUsualWor", limit: 5
    t.string "796478X406X4419BodilyPain", limit: 5
    t.string "796478X406X4420Past4WeekEnergyLevel", limit: 5
    t.string "796478X406X4421BotheredEmotionalPro", limit: 5
    t.string "796478X407X4422BennUpset", limit: 5
    t.string "796478X407X4422UnableControl", limit: 5
    t.string "796478X407X4422FeltNervous", limit: 5
    t.string "796478X407X4422FeltConfident", limit: 5
    t.string "796478X407X4422FeltGoingYourWay", limit: 5
    t.string "796478X407X4422CouldNotCope", limit: 5
    t.string "796478X407X4422AbleToControl", limit: 5
    t.string "796478X407X4422OnTopOfThings", limit: 5
    t.string "796478X407X4422BeenAngered", limit: 5
    t.string "796478X407X4422PilingUpHigh", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_796478_34160"
  end

  create_table "lime_survey_798191", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "798191X281X3376Course"
    t.text "798191X281X3376StartDate"
    t.text "798191X281X3376EndDate"
    t.text "798191X281X3376ScheduledServices"
    t.text "798191X280X3370StudentYear"
    t.text "798191X280X3370StudentEmail"
    t.text "798191X280X3370StudentName"
    t.text "798191X280X3370CoachEmail"
    t.text "798191X280X3370CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_798191_32052"
  end

  create_table "lime_survey_799577", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "799577X378X4173RecognizePersFeeling", limit: 5
    t.string "799577X378X4173AwareOfEmotions", limit: 5
    t.string "799577X378X4173InvestigateBehavior", limit: 5
    t.string "799577X378X4173ContradictoryFeeling", limit: 5
    t.string "799577X378X4173ThinkingHabits", limit: 5
    t.string "799577X378X4173TrustingRelationship", limit: 5
    t.string "799577X378X4173SafeLearning", limit: 5
    t.string "799577X378X4173Commitment", limit: 5
    t.string "799577X378X4173Affirm", limit: 5
    t.string "799577X378X4173AcceptFeedback", limit: 5
    t.string "799577X378X4173Stimulates", limit: 5
    t.string "799577X378X4173Encourage", limit: 5
    t.string "799577X378X4173EncourageProfDev", limit: 5
    t.string "799577X378X4173ConstructiveFeedback", limit: 5
    t.text "799577X379X4174"
    t.text "799577X379X4175"
    t.text "799577X375X4170"
    t.text "799577X375X4177"
    t.text "799577X375X4176"
    t.text "799577X375X4180"
    t.text "799577X375X4181"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_799577_2274"
  end

  create_table "lime_survey_812723", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "812723X229X2794StudentYear"
    t.text "812723X229X2794StudentEmail"
    t.text "812723X229X2794StudentName"
    t.text "812723X229X2794CoachEmail"
    t.text "812723X229X2794CoachName"
    t.text "812723X230X2800SQ001"
    t.text "812723X230X2800SQ002"
    t.text "812723X230X2801"
    t.integer "812723X230X2801_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_812723_14011"
  end

  create_table "lime_survey_814276", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "814276X612X7457", limit: 5
    t.string "814276X613X74581", limit: 5
    t.string "814276X613X74582", limit: 5
    t.string "814276X613X74583", limit: 5
    t.string "814276X613X74584", limit: 5
    t.string "814276X613X74585", limit: 5
    t.string "814276X613X74586", limit: 5
    t.string "814276X613X74587", limit: 5
    t.string "814276X613X74588", limit: 5
    t.string "814276X613X74589", limit: 5
    t.string "814276X613X745810", limit: 5
    t.text "814276X613X7460"
    t.string "814276X614X74591", limit: 5
    t.string "814276X614X74592", limit: 5
    t.string "814276X614X74593", limit: 5
    t.string "814276X614X74594", limit: 5
    t.string "814276X614X74595", limit: 5
    t.string "814276X614X74596", limit: 5
    t.string "814276X614X74597", limit: 5
    t.string "814276X614X74598", limit: 5
    t.string "814276X614X74599", limit: 5
    t.string "814276X614X745910", limit: 5
    t.string "814276X614X745911", limit: 5
    t.string "814276X614X745912", limit: 5
    t.string "814276X614X745913", limit: 5
    t.string "814276X614X745914", limit: 5
    t.string "814276X614X745915", limit: 5
    t.string "814276X614X745916", limit: 5
    t.string "814276X614X745917", limit: 5
    t.string "814276X614X745918", limit: 5
    t.string "814276X614X745919", limit: 5
    t.string "814276X614X745920", limit: 5
    t.string "814276X614X745921", limit: 5
    t.string "814276X614X745922", limit: 5
    t.string "814276X614X745923", limit: 5
    t.string "814276X614X745924", limit: 5
    t.text "814276X614X7461"
    t.text "814276X615X7462"
    t.text "814276X615X7463"
    t.text "814276X615X7464"
    t.text "814276X615X7465"
    t.text "814276X615X7466"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_814276_2922"
  end

  create_table "lime_survey_815884", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "815884X231X2804StudentYear"
    t.text "815884X231X2804StudentEmail"
    t.text "815884X231X2804StudentName"
    t.text "815884X231X2804CoachEmail"
    t.text "815884X231X2804CoachName"
    t.text "815884X232X2811CourseYear"
    t.text "815884X232X2811CourseName"
    t.decimal "815884X232X2805Week1MCQ", precision: 30, scale: 10
    t.decimal "815884X232X2805Week2MCQ", precision: 30, scale: 10
    t.decimal "815884X232X2805Week3MCQ", precision: 30, scale: 10
    t.decimal "815884X232X2805Week4MCQ", precision: 30, scale: 10
    t.decimal "815884X232X2805Week5MCQ", precision: 30, scale: 10
    t.text "815884X232X2806DroppedQuiz"
    t.text "815884X232X2806DroppedScore"
    t.decimal "815884X232X2807CSA1", precision: 30, scale: 10
    t.decimal "815884X232X2807CSA2", precision: 30, scale: 10
    t.decimal "815884X232X2807CSA3", precision: 30, scale: 10
    t.decimal "815884X232X2807CSA4", precision: 30, scale: 10
    t.decimal "815884X232X2807CSA5", precision: 30, scale: 10
    t.decimal "815884X232X2808", precision: 30, scale: 10
    t.decimal "815884X232X2809", precision: 30, scale: 10
    t.decimal "815884X232X2810Comp5a", precision: 30, scale: 10
    t.decimal "815884X232X2810Comp5b", precision: 30, scale: 10
    t.decimal "815884X232X2810Comp5c", precision: 30, scale: 10
    t.decimal "815884X232X2810Comp5d", precision: 30, scale: 10
    t.decimal "815884X232X2810Comp5e", precision: 30, scale: 10
    t.decimal "815884X232X2812Component1", precision: 30, scale: 10
    t.decimal "815884X232X2812Component2", precision: 30, scale: 10
    t.decimal "815884X232X2812Component3", precision: 30, scale: 10
    t.decimal "815884X232X2812Component4", precision: 30, scale: 10
    t.decimal "815884X232X2812Component5", precision: 30, scale: 10
    t.text "815884X232X2813"
    t.integer "815884X232X2813_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_815884_26662"
  end

  create_table "lime_survey_815996", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "815996X841X9461"
    t.text "815996X841X9462"
    t.text "815996X841X9463"
    t.string "815996X833X9453PatientCare1", limit: 5
    t.string "815996X833X9453PatientCare2", limit: 5
    t.string "815996X833X9453PatientCare3", limit: 5
    t.string "815996X833X9453PatientCare4", limit: 5
    t.string "815996X833X9453PatientCare5", limit: 5
    t.string "815996X833X9453PatientCare6", limit: 5
    t.string "815996X833X9453PatientCare7", limit: 5
    t.string "815996X833X9453PatientCare8", limit: 5
    t.string "815996X833X9453PatientCare9", limit: 5
    t.string "815996X834X9454KnowledgePractice1", limit: 5
    t.string "815996X834X9454KnowledgePractice2", limit: 5
    t.string "815996X835X9455PracticeBasedLM1", limit: 5
    t.string "815996X835X9455PracticeBasedLM2", limit: 5
    t.string "815996X835X9455PracticeBasedLM3", limit: 5
    t.string "815996X835X9455PracticeBasedLM4", limit: 5
    t.string "815996X836X9456InterpersonalComm1", limit: 5
    t.string "815996X837X9457Prof1", limit: 5
    t.string "815996X838X9458SystemsBasedPrac1", limit: 5
    t.string "815996X838X9458SystemsBasedPrac2", limit: 5
    t.string "815996X838X9458SystemsBasedPrac3", limit: 5
    t.string "815996X839X9459OverallRating1", limit: 5
    t.text "815996X840X9460"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_815996_17780"
  end

  create_table "lime_survey_822191", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "822191X1141X13308SQ001", limit: 5
    t.string "822191X1141X13308SQ002", limit: 5
    t.string "822191X1141X13308SQ005", limit: 5
    t.string "822191X1142X13309SQ001", limit: 5
    t.string "822191X1142X13309SQ004", limit: 5
    t.string "822191X1142X13309SQ003", limit: 5
    t.string "822191X1142X13309SQ002", limit: 5
    t.string "822191X1143X13310SQ001", limit: 5
    t.string "822191X1143X13310SQ004", limit: 5
    t.string "822191X1143X13310SQ003", limit: 5
    t.string "822191X1143X13310SQ002", limit: 5
    t.text "822191X1144X13311"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_822191_8015"
  end

  create_table "lime_survey_822697", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "822697X945X10531"
    t.text "822697X945X10534"
    t.string "822697X948X10535", limit: 5
    t.text "822697X948X10536"
    t.text "822697X948X14482StudentYear"
    t.text "822697X948X14482StudentEmail"
    t.text "822697X948X14482StudentName"
    t.text "822697X948X14482CoachEmail"
    t.text "822697X948X14482CoachName"
    t.string "822697X946X10532C1", limit: 5
    t.string "822697X946X10532C2", limit: 5
    t.string "822697X946X10532C3", limit: 5
    t.string "822697X946X10532C4", limit: 5
    t.string "822697X946X10532C5", limit: 5
    t.string "822697X946X10532C6", limit: 5
    t.string "822697X946X10532C7", limit: 5
    t.string "822697X946X10532C8", limit: 5
    t.string "822697X946X10532C9", limit: 5
    t.text "822697X947X10533"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_822697_12987"
  end

  create_table "lime_survey_832226", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "832226X322X3750StudentYear"
    t.text "832226X322X3750StudentEmail"
    t.text "832226X322X3750StudentName"
    t.text "832226X322X3750CoachEmail"
    t.text "832226X322X3750CoachName"
    t.text "832226X321X3748InterComp1"
    t.text "832226X321X3748InterComp2"
    t.text "832226X321X3748InterComp3"
    t.text "832226X321X3748InterComp4"
    t.text "832226X321X3748InterFinal"
    t.decimal "832226X321X3749", precision: 30, scale: 10
    t.text "832226X323X3751Level1"
    t.text "832226X323X3751Level2"
    t.text "832226X323X3751Level3"
    t.text "832226X323X3751Total"
    t.text "832226X323X3752ICS3"
    t.text "832226X323X3753SBPIC4"
    t.text "832226X323X3754MK1"
    t.text "832226X323X3754MK2"
    t.text "832226X323X3754MK3"
    t.text "832226X323X3754MK5"
    t.text "832226X323X3754PBLI1"
    t.text "832226X323X3754PBLI2"
    t.text "832226X323X3754PBLI4"
    t.text "832226X323X3754PPPD7"
    t.text "832226X323X3754PPPD8"
    t.text "832226X323X3754SBPIC2"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_832226_10039"
  end

  create_table "lime_survey_834556", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "834556X128X2020", limit: 255
    t.text "834556X126X2013"
    t.text "834556X126X2014"
    t.text "834556X126X2015"
    t.string "834556X126X2016", limit: 1
    t.text "834556X126X2017"
    t.text "834556X126X2018"
    t.string "834556X127X2019SQ001", limit: 5
    t.string "834556X127X2019SQ002", limit: 5
    t.string "834556X127X2019SQ003", limit: 5
    t.string "834556X127X2019SQ004", limit: 5
    t.string "834556X127X2019SQ005", limit: 5
    t.string "834556X127X2019SQ006", limit: 5
    t.string "834556X127X2019SQ007", limit: 5
    t.string "834556X127X2019SQ008", limit: 5
    t.string "834556X127X2019SQ009", limit: 5
    t.string "834556X127X2019SQ010", limit: 5
    t.string "834556X127X2019SQ011", limit: 5
    t.text "834556X129X2032StudentYear"
    t.text "834556X129X2032StudentEmail"
    t.text "834556X129X2032StudentName"
    t.text "834556X129X2032CoachEmail"
    t.text "834556X129X2032CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_834556_36271"
  end

  create_table "lime_survey_834556_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "834556X128time"
    t.float "834556X128X2020time"
    t.float "834556X126time"
    t.float "834556X126X2013time"
    t.float "834556X126X2014time"
    t.float "834556X126X2015time"
    t.float "834556X126X2016time"
    t.float "834556X126X2017time"
    t.float "834556X126X2018time"
    t.float "834556X127time"
    t.float "834556X127X2019time"
    t.float "834556X129time"
    t.float "834556X129X2032time"
  end

  create_table "lime_survey_835117", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "835117X1251X13795SQ001", limit: 5
    t.string "835117X1251X13795SQ004", limit: 5
    t.string "835117X1251X13795SQ003", limit: 5
    t.string "835117X1251X13795SQ002", limit: 5
    t.text "835117X1251X13800"
    t.string "835117X1252X13796SQ001", limit: 5
    t.string "835117X1252X13796SQ002", limit: 5
    t.string "835117X1252X13796SQ003", limit: 5
    t.string "835117X1252X13796SQ004", limit: 5
    t.text "835117X1252X13801"
    t.string "835117X1253X13797SQ001", limit: 5
    t.string "835117X1253X13797SQ002", limit: 5
    t.string "835117X1253X13797SQ003", limit: 5
    t.text "835117X1253X13802"
    t.string "835117X1253X14128SQ001", limit: 5
    t.text "835117X1254X13798"
    t.text "835117X1254X13799"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_835117_2603"
  end

  create_table "lime_survey_835844", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "835844X1203X13581SQ001", limit: 5
    t.string "835844X1203X13581SQ002", limit: 5
    t.string "835844X1203X13581SQ003", limit: 5
    t.string "835844X1203X13581SQ004", limit: 5
    t.text "835844X1203X13586"
    t.string "835844X1204X13582SQ001", limit: 5
    t.string "835844X1204X13582SQ002", limit: 5
    t.string "835844X1205X13583SQ001", limit: 5
    t.string "835844X1205X13583SQ002", limit: 5
    t.string "835844X1205X13583SQ003", limit: 5
    t.string "835844X1205X13583SQ004", limit: 5
    t.string "835844X1205X13583SQ005", limit: 5
    t.string "835844X1205X13583SQ006", limit: 5
    t.string "835844X1205X13583SQ007", limit: 5
    t.string "835844X1205X13583SQ008", limit: 5
    t.string "835844X1205X13583SQ009", limit: 5
    t.string "835844X1205X13583SQ010", limit: 5
    t.text "835844X1205X13587"
    t.string "835844X1206X13584SQ001", limit: 5
    t.text "835844X1207X13585"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_835844_1472"
  end

  create_table "lime_survey_838243", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "838243X81X1309StudentYear"
    t.text "838243X81X1309StudentEmail"
    t.text "838243X81X1309StudentName"
    t.text "838243X81X1309CoachEmail"
    t.text "838243X81X1309CoachName"
    t.text "838243X80X1310CourseYear"
    t.text "838243X80X1310CourseName"
    t.decimal "838243X80X1303Week1MCQ", precision: 30, scale: 10
    t.decimal "838243X80X1303Week2MCQ", precision: 30, scale: 10
    t.decimal "838243X80X1303Week3MCQ", precision: 30, scale: 10
    t.decimal "838243X80X1303Week4MCQ", precision: 30, scale: 10
    t.decimal "838243X80X1303Week5MCQ", precision: 30, scale: 10
    t.decimal "838243X80X1303Week6MCQ", precision: 30, scale: 10
    t.decimal "838243X80X1303Week7MCQ", precision: 30, scale: 10
    t.text "838243X80X1308DroppedQuiz"
    t.text "838243X80X1308DroppedScore"
    t.decimal "838243X80X1304CSA1", precision: 30, scale: 10
    t.decimal "838243X80X1304CSA2", precision: 30, scale: 10
    t.decimal "838243X80X1304CSA3", precision: 30, scale: 10
    t.decimal "838243X80X1304CSA4", precision: 30, scale: 10
    t.decimal "838243X80X1304CSA5", precision: 30, scale: 10
    t.decimal "838243X80X1305", precision: 30, scale: 10
    t.decimal "838243X80X1306", precision: 30, scale: 10
    t.decimal "838243X80X1307OSCE", precision: 30, scale: 10
    t.decimal "838243X80X1307Histology", precision: 30, scale: 10
    t.decimal "838243X80X1307Anatomy", precision: 30, scale: 10
    t.decimal "838243X80X1307Microbiology", precision: 30, scale: 10
    t.decimal "838243X80X1307MET", precision: 30, scale: 10
    t.decimal "838243X80X1311Component1", precision: 30, scale: 10
    t.decimal "838243X80X1311Component2", precision: 30, scale: 10
    t.decimal "838243X80X1311Component3", precision: 30, scale: 10
    t.decimal "838243X80X1311Component4", precision: 30, scale: 10
    t.decimal "838243X80X1311Component5", precision: 30, scale: 10
    t.text "838243X80X1312"
    t.integer "838243X80X1312_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_838243_9486"
  end

  create_table "lime_survey_839222", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "839222X721X8667StudentYear"
    t.text "839222X721X8667StudentEmail"
    t.text "839222X721X8667StudentName"
    t.text "839222X721X8667CoachEmail"
    t.text "839222X721X8667CoachName"
    t.text "839222X722X8668CourseYear"
    t.text "839222X722X8668CourseName"
    t.decimal "839222X722X8669Week1MCQ", precision: 30, scale: 10
    t.decimal "839222X722X8669Week2MCQ", precision: 30, scale: 10
    t.decimal "839222X722X8669Week3MCQ", precision: 30, scale: 10
    t.decimal "839222X722X8669Week4MCQ", precision: 30, scale: 10
    t.decimal "839222X722X8669Week5MCQ", precision: 30, scale: 10
    t.decimal "839222X722X8669Week6MCQ", precision: 30, scale: 10
    t.decimal "839222X722X8669Week7MCQ", precision: 30, scale: 10
    t.decimal "839222X722X8669Week8MCQ", precision: 30, scale: 10
    t.decimal "839222X722X8669Week9MCQ", precision: 30, scale: 10
    t.decimal "839222X722X8669Week10MCQ", precision: 30, scale: 10
    t.decimal "839222X722X8669Week11MCQ", precision: 30, scale: 10
    t.text "839222X722X8670DroppedQuiz"
    t.text "839222X722X8670DroppedScore"
    t.decimal "839222X722X8671CSA01", precision: 30, scale: 10
    t.decimal "839222X722X8671CSA02", precision: 30, scale: 10
    t.decimal "839222X722X8671CSA03", precision: 30, scale: 10
    t.decimal "839222X722X8671CSA04", precision: 30, scale: 10
    t.decimal "839222X722X8671CSA05", precision: 30, scale: 10
    t.decimal "839222X722X8671CSA06", precision: 30, scale: 10
    t.decimal "839222X722X8671CSA07", precision: 30, scale: 10
    t.decimal "839222X722X8671CSA08", precision: 30, scale: 10
    t.decimal "839222X722X8671CSA09", precision: 30, scale: 10
    t.decimal "839222X722X8671CSA10", precision: 30, scale: 10
    t.decimal "839222X722X8671CSA11", precision: 30, scale: 10
    t.decimal "839222X722X8672FinalBlockCardiac", precision: 30, scale: 10
    t.decimal "839222X722X8672FinalBlockRenal", precision: 30, scale: 10
    t.decimal "839222X722X8672FinalBlockPulmonary", precision: 30, scale: 10
    t.decimal "839222X722X8673NBME", precision: 30, scale: 10
    t.decimal "839222X722X8677sq001", precision: 30, scale: 10
    t.decimal "839222X722X8677sq002", precision: 30, scale: 10
    t.decimal "839222X722X8677sq003", precision: 30, scale: 10
    t.decimal "839222X722X8677sq004", precision: 30, scale: 10
    t.decimal "839222X722X8677sq005", precision: 30, scale: 10
    t.decimal "839222X722X8674OSCE", precision: 30, scale: 10
    t.decimal "839222X722X8674Histo", precision: 30, scale: 10
    t.decimal "839222X722X8674Path", precision: 30, scale: 10
    t.decimal "839222X722X8674Anat", precision: 30, scale: 10
    t.decimal "839222X722X8674Micro", precision: 30, scale: 10
    t.decimal "839222X722X8674BChem", precision: 30, scale: 10
    t.decimal "839222X722X8675Component1", precision: 30, scale: 10
    t.decimal "839222X722X8675Component2", precision: 30, scale: 10
    t.decimal "839222X722X8675Component3", precision: 30, scale: 10
    t.decimal "839222X722X8675Component4", precision: 30, scale: 10
    t.decimal "839222X722X8675Component5", precision: 30, scale: 10
    t.text "839222X722X8676"
    t.integer "839222X722X8676_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_839222_14554"
  end

  create_table "lime_survey_843428", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "843428X1345X14513SQ001", limit: 5
    t.string "843428X1345X14513SQ002", limit: 5
    t.string "843428X1345X14513SQ003", limit: 5
    t.text "843428X1345X14514"
    t.text "843428X1345X14515"
    t.text "843428X1345X14516"
    t.string "843428X1346X14517SQ001", limit: 5
    t.string "843428X1346X14517SQ002", limit: 5
    t.string "843428X1346X14517SQ003", limit: 5
    t.string "843428X1346X14517SQ004", limit: 5
    t.string "843428X1346X14517SQ005", limit: 5
    t.string "843428X1346X14517SQ006", limit: 5
    t.string "843428X1346X14517SQ007", limit: 5
    t.string "843428X1347X14518", limit: 5
    t.text "843428X1347X14519SQ001_SQ001"
    t.text "843428X1347X14519SQ001_SQ002"
    t.text "843428X1347X14519SQ002_SQ001"
    t.text "843428X1347X14519SQ002_SQ002"
    t.text "843428X1347X14519SQ003_SQ001"
    t.text "843428X1347X14519SQ003_SQ002"
    t.text "843428X1347X14520"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_843428_15640"
  end

  create_table "lime_survey_845373", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.decimal "845373X736X8831", precision: 30, scale: 10
    t.text "845373X736X8835"
    t.string "845373X736X8849", limit: 5
    t.text "845373X736X8849other"
    t.string "845373X736X8852SQ001", limit: 5
    t.string "845373X736X8852SQ002", limit: 5
    t.string "845373X736X8852SQ003", limit: 5
    t.string "845373X736X8852SQ004", limit: 5
    t.string "845373X736X8852SQ005", limit: 5
    t.text "845373X736X8852other"
    t.string "845373X743X8894SQ001", limit: 5
    t.string "845373X743X8894SQ002", limit: 5
    t.string "845373X743X8894SQ003", limit: 5
    t.string "845373X743X8894SQ004", limit: 5
    t.string "845373X753X8927SQ001", limit: 5
    t.string "845373X753X8927SQ002", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_845373_29883"
  end

  create_table "lime_survey_845943", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "845943X768X9045SQ001", limit: 5
    t.text "845943X768X9047"
    t.string "845943X769X9048SQ001", limit: 5
    t.text "845943X769X9052"
    t.string "845943X770X9050SQ001", limit: 5
    t.text "845943X770X9053"
    t.string "845943X771X9054SQ001", limit: 5
    t.text "845943X771X9056"
    t.string "845943X772X9057SQ001", limit: 5
    t.text "845943X772X9059"
    t.string "845943X773X9060SQ001", limit: 5
    t.text "845943X773X9062"
    t.string "845943X774X9063SQ001", limit: 5
    t.text "845943X774X9065"
    t.string "845943X775X9066SQ001", limit: 5
    t.text "845943X775X9068"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_845943_21741"
  end

  create_table "lime_survey_846349", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "846349X973X12085StudentYear"
    t.text "846349X973X12085StudentID"
    t.text "846349X973X12085MedhubID"
    t.text "846349X973X12085StudentEmail"
    t.text "846349X973X12085StudentName"
    t.text "846349X973X12085CoachEmail"
    t.text "846349X973X12085CoachName"
    t.text "846349X975X12087CourseName"
    t.text "846349X975X12087CourseID"
    t.text "846349X975X12087StartDt"
    t.text "846349X975X12087EndDt"
    t.text "846349X975X12087SubmitDt"
    t.text "846349X975X12087Eval"
    t.text "846349X975X12087FinalGrade"
    t.text "846349X975X12087Env"
    t.text "846349X976X12088ProfConcerns"
    t.text "846349X976X12088CommProfConcerns"
    t.text "846349X976X12088OverSummCommPerf"
    t.text "846349X976X12088AddCommOnPerform"
    t.text "846349X976X12088MSPE"
    t.text "846349X976X12088OptClinicExpComm"
    t.text "846349X976X12088Feedback"
    t.text "846349X974X12086ICS1"
    t.text "846349X974X12086ICS2"
    t.text "846349X974X12086ICS3"
    t.text "846349X974X12086ICS4"
    t.text "846349X974X12086ICS5"
    t.text "846349X974X12086ICS6"
    t.text "846349X974X12086ICS7"
    t.text "846349X974X12086ICS8"
    t.text "846349X974X12086MK1"
    t.text "846349X974X12086MK2"
    t.text "846349X974X12086MK3"
    t.text "846349X974X12086MK4"
    t.text "846349X974X12086MK5"
    t.text "846349X974X12086PBLI1"
    t.text "846349X974X12086PBLI2"
    t.text "846349X974X12086PBLI3"
    t.text "846349X974X12086PBLI4"
    t.text "846349X974X12086PBLI5"
    t.text "846349X974X12086PBLI6"
    t.text "846349X974X12086PBLI7"
    t.text "846349X974X12086PBLI8"
    t.text "846349X974X12086PCP1"
    t.text "846349X974X12086PCP2"
    t.text "846349X974X12086PCP3"
    t.text "846349X974X12086PCP4"
    t.text "846349X974X12086PCP5"
    t.text "846349X974X12086PCP6"
    t.text "846349X974X12086PPPD01"
    t.text "846349X974X12086PPPD02"
    t.text "846349X974X12086PPPD03"
    t.text "846349X974X12086PPPD04"
    t.text "846349X974X12086PPPD05"
    t.text "846349X974X12086PPPD06"
    t.text "846349X974X12086PPPD07"
    t.text "846349X974X12086PPPD08"
    t.text "846349X974X12086PPPD09"
    t.text "846349X974X12086PPPD10"
    t.text "846349X974X12086PPPD11"
    t.text "846349X974X12086SBPIC1"
    t.text "846349X974X12086SBPIC2"
    t.text "846349X974X12086SBPIC3"
    t.text "846349X974X12086SBPIC4"
    t.text "846349X974X12086SBPIC5"
    t.string "seed", limit: 31
    t.index ["846349X973X12085StudentEmail", "id"], name: "idx_lime_survey_846349_student_email"
    t.index ["token"], name: "idx_survey_token_846349_44466"
  end

  create_table "lime_survey_851468", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "851468X252X3098StudentYear"
    t.text "851468X252X3098StudentEmail"
    t.text "851468X252X3098StudentName"
    t.text "851468X252X3098CoachEmail"
    t.text "851468X252X3098CoachName"
    t.text "851468X252X3098Course"
    t.decimal "851468X252X3099FUND", precision: 30, scale: 10
    t.decimal "851468X252X3099BLHD", precision: 30, scale: 10
    t.decimal "851468X252X3099SBM", precision: 30, scale: 10
    t.decimal "851468X252X3099CARE", precision: 30, scale: 10
    t.decimal "851468X252X3099HODI", precision: 30, scale: 10
    t.decimal "851468X252X3099NSF", precision: 30, scale: 10
    t.decimal "851468X252X3099DEVH", precision: 30, scale: 10
    t.decimal "851468X252X3100FUND", precision: 30, scale: 10
    t.decimal "851468X252X3100BLHD", precision: 30, scale: 10
    t.decimal "851468X252X3100SBM", precision: 30, scale: 10
    t.decimal "851468X252X3100CARE", precision: 30, scale: 10
    t.decimal "851468X252X3100HODI", precision: 30, scale: 10
    t.decimal "851468X252X3100NSF", precision: 30, scale: 10
    t.decimal "851468X252X3100DEVH", precision: 30, scale: 10
    t.decimal "851468X252X3101FUND", precision: 30, scale: 10
    t.decimal "851468X252X3101BLHD", precision: 30, scale: 10
    t.decimal "851468X252X3101SBM", precision: 30, scale: 10
    t.decimal "851468X252X3101CARE", precision: 30, scale: 10
    t.decimal "851468X252X3101HODI", precision: 30, scale: 10
    t.decimal "851468X252X3101NSF", precision: 30, scale: 10
    t.decimal "851468X252X3101DEVH", precision: 30, scale: 10
    t.decimal "851468X252X3102FUND", precision: 30, scale: 10
    t.decimal "851468X252X3102BLHD", precision: 30, scale: 10
    t.decimal "851468X252X3102SBM", precision: 30, scale: 10
    t.decimal "851468X252X3102CARE", precision: 30, scale: 10
    t.decimal "851468X252X3102HODI", precision: 30, scale: 10
    t.decimal "851468X252X3102NSF", precision: 30, scale: 10
    t.decimal "851468X252X3102DEVH", precision: 30, scale: 10
    t.decimal "851468X252X3103FUND", precision: 30, scale: 10
    t.decimal "851468X252X3103BLHD", precision: 30, scale: 10
    t.decimal "851468X252X3103SBM", precision: 30, scale: 10
    t.decimal "851468X252X3103CARE", precision: 30, scale: 10
    t.decimal "851468X252X3103HODI", precision: 30, scale: 10
    t.decimal "851468X252X3103NSF", precision: 30, scale: 10
    t.decimal "851468X252X3103DEVH", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_851468_9564"
  end

  create_table "lime_survey_853179", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "853179X369X4121StudentYear"
    t.text "853179X369X4121StudentEmail"
    t.text "853179X369X4121StudentName"
    t.text "853179X369X4121CoachEmail"
    t.text "853179X369X4121CoachName"
    t.string "853179X342X3924SQ1", limit: 5
    t.string "853179X342X3924SQ2", limit: 5
    t.string "853179X342X3924SQ3", limit: 5
    t.string "853179X342X3924SQ4", limit: 5
    t.string "853179X342X3924SQ5", limit: 5
    t.string "853179X342X3924SQ6", limit: 5
    t.string "853179X342X3924SQ7", limit: 5
    t.string "853179X342X3924SQ8", limit: 5
    t.string "853179X342X3924SQ9", limit: 5
    t.string "853179X342X3924SQ10", limit: 5
    t.string "853179X343X3925sq1", limit: 5
    t.string "853179X343X3925sq2", limit: 5
    t.string "853179X344X3926sq1", limit: 5
    t.string "853179X344X3926sq2", limit: 5
    t.string "853179X344X3926sq3", limit: 5
    t.string "853179X345X3927sq1", limit: 5
    t.string "853179X345X3927sq2", limit: 5
    t.string "853179X345X3927sq3", limit: 5
    t.string "853179X346X3928sq1", limit: 5
    t.string "853179X346X3928sq2", limit: 5
    t.string "853179X347X39291", limit: 5
    t.string "853179X347X39292", limit: 5
    t.string "853179X347X39293", limit: 5
    t.text "853179X348X3930"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_853179_8195"
  end

  create_table "lime_survey_854737", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "854737X905X10292StudentYear"
    t.text "854737X905X10292StudentEmail"
    t.text "854737X905X10292StudentName"
    t.text "854737X905X10292CoachEmail"
    t.text "854737X905X10292CoachName"
    t.text "854737X906X10293SQ001"
    t.text "854737X906X10293SQ002"
    t.text "854737X906X10294"
    t.integer "854737X906X10294_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_854737_40967"
  end

  create_table "lime_survey_855879", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "855879X1440X15510StudentYear"
    t.text "855879X1440X15510StudentEmail"
    t.text "855879X1440X15510StudentName"
    t.text "855879X1440X15510CoachEmail"
    t.text "855879X1440X15510CoachName"
    t.text "855879X1436X15495"
    t.text "855879X1436X15498"
    t.text "855879X1438X15497"
    t.string "855879X1439X15499", limit: 5
    t.text "855879X1439X15500"
    t.string "855879X1437X15496C1", limit: 5
    t.string "855879X1437X15496C2", limit: 5
    t.string "855879X1437X15496C3", limit: 5
    t.string "855879X1437X15496C4", limit: 5
    t.string "855879X1437X15496C5", limit: 5
    t.string "855879X1437X15496C6", limit: 5
    t.string "855879X1437X15496C7", limit: 5
    t.string "855879X1437X15496C8", limit: 5
    t.string "855879X1437X15496C9", limit: 5
    t.index ["token"], name: "idx_survey_token_855879_24381"
  end

  create_table "lime_survey_856163", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "856163X158X2175", limit: 255
    t.string "856163X158X2176", limit: 255
    t.string "856163X158X2177", limit: 255
    t.string "856163X150X2167PatientCare1", limit: 5
    t.string "856163X150X2167PatientCare2", limit: 5
    t.string "856163X150X2167PatientCare3", limit: 5
    t.string "856163X150X2167PatientCare4", limit: 5
    t.string "856163X150X2167PatientCare5", limit: 5
    t.string "856163X150X2167PatientCare6", limit: 5
    t.string "856163X150X2167PatientCare7", limit: 5
    t.string "856163X150X2167PatientCare8", limit: 5
    t.string "856163X150X2167PatientCare9", limit: 5
    t.string "856163X151X2168KnowledgePractice1", limit: 5
    t.string "856163X151X2168KnowledgePractice2", limit: 5
    t.string "856163X152X2169PracticeBasedLM1", limit: 5
    t.string "856163X152X2169PracticeBasedLM2", limit: 5
    t.string "856163X152X2169PracticeBasedLM3", limit: 5
    t.string "856163X152X2169PracticeBasedLM4", limit: 5
    t.string "856163X153X2170InterpersonalComm1", limit: 5
    t.string "856163X154X2171Prof1", limit: 5
    t.string "856163X155X2172SystemsBasedPrac1", limit: 5
    t.string "856163X155X2172SystemsBasedPrac2", limit: 5
    t.string "856163X155X2172SystemsBasedPrac3", limit: 5
    t.string "856163X156X2173OverallRating1", limit: 5
    t.text "856163X157X2174"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_856163_36446"
  end

  create_table "lime_survey_856292", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "856292X133X2068StudentYear"
    t.text "856292X133X2068StudentEmail"
    t.text "856292X133X2068StudentName"
    t.text "856292X133X2068CoachEmail"
    t.text "856292X133X2068CoachName"
    t.text "856292X134X2069CourseYear"
    t.text "856292X134X2069CourseName"
    t.decimal "856292X134X2070Week1MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week2MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week3MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week4MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week5MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week6MCQ", precision: 30, scale: 10
    t.decimal "856292X134X2070Week7MCQ", precision: 30, scale: 10
    t.text "856292X134X2071DroppedQuiz"
    t.text "856292X134X2071DroppedScore"
    t.decimal "856292X134X2072CSA1", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA2", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA3", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA4", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA5", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA6", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA7", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA8", precision: 30, scale: 10
    t.decimal "856292X134X2072CSA9", precision: 30, scale: 10
    t.decimal "856292X134X2073FinalBlock", precision: 30, scale: 10
    t.decimal "856292X134X2074", precision: 30, scale: 10
    t.decimal "856292X134X2075OSCE", precision: 30, scale: 10
    t.decimal "856292X134X2075Genetics", precision: 30, scale: 10
    t.decimal "856292X134X2075CellBiology", precision: 30, scale: 10
    t.decimal "856292X134X2075Informatics", precision: 30, scale: 10
    t.decimal "856292X134X2076Component1", precision: 30, scale: 10
    t.decimal "856292X134X2076Component2", precision: 30, scale: 10
    t.decimal "856292X134X2076Component3", precision: 30, scale: 10
    t.decimal "856292X134X2076Component4", precision: 30, scale: 10
    t.decimal "856292X134X2076Component5", precision: 30, scale: 10
    t.text "856292X134X2077"
    t.integer "856292X134X2077_filecount"
    t.index ["token"], name: "idx_survey_token_856292_40604"
  end

  create_table "lime_survey_862455", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "862455X1261X13855SQ001", limit: 5
    t.string "862455X1261X13855SQ002", limit: 5
    t.string "862455X1261X13855SQ003", limit: 5
    t.string "862455X1261X13855SQ004", limit: 5
    t.string "862455X1261X13855SQ005", limit: 5
    t.string "862455X1261X13855SQ006", limit: 5
    t.string "862455X1261X13855SQ007", limit: 5
    t.string "862455X1261X13855SQ008", limit: 5
    t.string "862455X1261X13855SQ009", limit: 5
    t.string "862455X1261X13855SQ010", limit: 5
    t.string "862455X1261X13855SQ011", limit: 5
    t.string "862455X1261X13855SQ012", limit: 5
    t.string "862455X1261X13855SQ013", limit: 5
    t.string "862455X1261X13855SQ014", limit: 5
    t.string "862455X1262X13856SQ001", limit: 5
    t.string "862455X1262X13856SQ002", limit: 5
    t.string "862455X1262X13856SQ003", limit: 5
    t.string "862455X1262X13856SQ004", limit: 5
    t.text "862455X1263X13857"
    t.string "862455X1299X14134SQ001", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_862455_23743"
  end

  create_table "lime_survey_867378", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "867378X510X5923SQ001", limit: 5
    t.string "867378X510X5923SQ002", limit: 5
    t.string "867378X510X5923SQ003", limit: 5
    t.text "867378X510X5927"
    t.text "867378X510X5928"
    t.text "867378X510X5929"
    t.string "867378X511X5930SQ001", limit: 5
    t.string "867378X511X5930SQ002", limit: 5
    t.string "867378X511X5930SQ003", limit: 5
    t.string "867378X511X5930SQ004", limit: 5
    t.string "867378X511X5930SQ005", limit: 5
    t.string "867378X511X5930SQ006", limit: 5
    t.string "867378X511X5930SQ007", limit: 5
    t.string "867378X513X5938", limit: 5
    t.text "867378X513X5939SQ001_SQ001"
    t.text "867378X513X5939SQ001_SQ002"
    t.text "867378X513X5939SQ002_SQ001"
    t.text "867378X513X5939SQ002_SQ002"
    t.text "867378X513X5939SQ003_SQ001"
    t.text "867378X513X5939SQ003_SQ002"
    t.text "867378X513X5945"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_867378_31266"
  end

  create_table "lime_survey_868713", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "868713X542X6519"
    t.text "868713X542X6520"
    t.text "868713X542X6521"
    t.text "868713X542X6522"
    t.text "868713X542X6518"
    t.text "868713X542X6524"
    t.text "868713X542X6523"
    t.text "868713X541X6515SQ1"
    t.text "868713X541X6515SQ2"
    t.text "868713X541X6515SQ3"
    t.text "868713X541X6515SQ4"
    t.text "868713X541X6515SQ5"
    t.text "868713X541X6515SQ6"
    t.text "868713X541X6515SQ7"
    t.text "868713X541X6515SQ8"
    t.text "868713X541X6515SQ9"
    t.text "868713X541X6515SQ10"
    t.text "868713X541X6516SQ1"
    t.text "868713X541X6516SQ2"
    t.text "868713X541X6516SQ3"
    t.text "868713X541X6516SQ4"
    t.text "868713X541X6516SQ5"
    t.text "868713X541X6516SQ6"
    t.text "868713X541X6516SQ7"
    t.text "868713X541X6516SQ8"
    t.text "868713X541X6516SQ9"
    t.text "868713X541X6516SQ10"
    t.string "868713X541X6517SQ1", limit: 5
    t.string "868713X541X6517SQ2", limit: 5
    t.string "868713X541X6517SQ3", limit: 5
    t.string "868713X541X6517SQ4", limit: 5
    t.string "868713X541X6517SQ5", limit: 5
    t.string "868713X541X6517SQ6", limit: 5
    t.string "868713X541X6517SQ7", limit: 5
    t.string "868713X541X6517SQ8", limit: 5
    t.string "868713X541X6517SQ9", limit: 5
    t.string "868713X541X6517SQ10", limit: 5
    t.text "868713X541X6528SQ1"
    t.text "868713X541X6528SQ2"
    t.text "868713X541X6528SQ3"
    t.text "868713X541X6528SQ4"
    t.text "868713X541X6528SQ5"
    t.text "868713X541X6528SQ6"
    t.text "868713X541X6528SQ7"
    t.text "868713X541X6528SQ8"
    t.text "868713X541X6528SQ9"
    t.text "868713X541X6528SQ10"
    t.text "868713X543X6525SQ1"
    t.text "868713X543X6525SQ2"
    t.text "868713X543X6525SQ3"
    t.text "868713X543X6525SQ4"
    t.text "868713X543X6525SQ5"
    t.text "868713X543X6525SQ6"
    t.text "868713X543X6525SQ7"
    t.text "868713X543X6525SQ8"
    t.text "868713X543X6525SQ9"
    t.text "868713X543X6525SQ10"
    t.text "868713X543X6526SQ1"
    t.text "868713X543X6526SQ2"
    t.text "868713X543X6526SQ3"
    t.text "868713X543X6526SQ4"
    t.text "868713X543X6526SQ5"
    t.text "868713X543X6526SQ6"
    t.text "868713X543X6526SQ7"
    t.text "868713X543X6526SQ8"
    t.text "868713X543X6526SQ9"
    t.text "868713X543X6526SQ10"
    t.string "868713X543X6527SQ1", limit: 5
    t.string "868713X543X6527SQ2", limit: 5
    t.string "868713X543X6527SQ3", limit: 5
    t.string "868713X543X6527SQ4", limit: 5
    t.string "868713X543X6527SQ5", limit: 5
    t.string "868713X543X6527SQ6", limit: 5
    t.string "868713X543X6527SQ7", limit: 5
    t.string "868713X543X6527SQ8", limit: 5
    t.string "868713X543X6527SQ9", limit: 5
    t.string "868713X543X6527SQ10", limit: 5
    t.text "868713X543X6529SQ1"
    t.text "868713X543X6529SQ2"
    t.text "868713X543X6529SQ3"
    t.text "868713X543X6529SQ4"
    t.text "868713X543X6529SQ5"
    t.text "868713X543X6529SQ6"
    t.text "868713X543X6529SQ7"
    t.text "868713X543X6529SQ8"
    t.text "868713X543X6529SQ9"
    t.text "868713X543X6529SQ10"
    t.text "868713X544X6530SQ1"
    t.text "868713X544X6530SQ2"
    t.text "868713X544X6530SQ3"
    t.text "868713X544X6530SQ4"
    t.text "868713X544X6530SQ5"
    t.text "868713X544X6530SQ6"
    t.text "868713X544X6530SQ7"
    t.text "868713X544X6530SQ8"
    t.text "868713X544X6530SQ9"
    t.text "868713X544X6530SQ10"
    t.text "868713X544X6531SQ1"
    t.text "868713X544X6531SQ2"
    t.text "868713X544X6531SQ3"
    t.text "868713X544X6531SQ4"
    t.text "868713X544X6531SQ5"
    t.text "868713X544X6531SQ6"
    t.text "868713X544X6531SQ7"
    t.text "868713X544X6531SQ8"
    t.text "868713X544X6531SQ9"
    t.text "868713X544X6531SQ10"
    t.string "868713X544X6532SQ1", limit: 5
    t.string "868713X544X6532SQ2", limit: 5
    t.string "868713X544X6532SQ3", limit: 5
    t.string "868713X544X6532SQ4", limit: 5
    t.string "868713X544X6532SQ5", limit: 5
    t.string "868713X544X6532SQ6", limit: 5
    t.string "868713X544X6532SQ7", limit: 5
    t.string "868713X544X6532SQ8", limit: 5
    t.string "868713X544X6532SQ9", limit: 5
    t.string "868713X544X6532SQ10", limit: 5
    t.text "868713X544X6533SQ1"
    t.text "868713X544X6533SQ2"
    t.text "868713X544X6533SQ3"
    t.text "868713X544X6533SQ4"
    t.text "868713X544X6533SQ5"
    t.text "868713X544X6533SQ6"
    t.text "868713X544X6533SQ7"
    t.text "868713X544X6533SQ8"
    t.text "868713X544X6533SQ9"
    t.text "868713X544X6533SQ10"
    t.text "868713X545X6534SQ1"
    t.text "868713X545X6534SQ2"
    t.text "868713X545X6534SQ3"
    t.text "868713X545X6534SQ4"
    t.text "868713X545X6534SQ5"
    t.text "868713X545X6534SQ6"
    t.text "868713X545X6534SQ7"
    t.text "868713X545X6534SQ8"
    t.text "868713X545X6534SQ9"
    t.text "868713X545X6534SQ10"
    t.text "868713X545X6535SQ1"
    t.text "868713X545X6535SQ2"
    t.text "868713X545X6535SQ3"
    t.text "868713X545X6535SQ4"
    t.text "868713X545X6535SQ5"
    t.text "868713X545X6535SQ6"
    t.text "868713X545X6535SQ7"
    t.text "868713X545X6535SQ8"
    t.text "868713X545X6535SQ9"
    t.text "868713X545X6535SQ10"
    t.string "868713X545X6536SQ1", limit: 5
    t.string "868713X545X6536SQ2", limit: 5
    t.string "868713X545X6536SQ3", limit: 5
    t.string "868713X545X6536SQ4", limit: 5
    t.string "868713X545X6536SQ5", limit: 5
    t.string "868713X545X6536SQ6", limit: 5
    t.string "868713X545X6536SQ7", limit: 5
    t.string "868713X545X6536SQ8", limit: 5
    t.string "868713X545X6536SQ9", limit: 5
    t.string "868713X545X6536SQ10", limit: 5
    t.text "868713X545X6537SQ1"
    t.text "868713X545X6537SQ2"
    t.text "868713X545X6537SQ3"
    t.text "868713X545X6537SQ4"
    t.text "868713X545X6537SQ5"
    t.text "868713X545X6537SQ6"
    t.text "868713X545X6537SQ7"
    t.text "868713X545X6537SQ8"
    t.text "868713X545X6537SQ9"
    t.text "868713X545X6537SQ10"
    t.text "868713X546X6538SQ1"
    t.text "868713X546X6538SQ2"
    t.text "868713X546X6538SQ3"
    t.text "868713X546X6538SQ4"
    t.text "868713X546X6538SQ5"
    t.text "868713X546X6538SQ6"
    t.text "868713X546X6538SQ7"
    t.text "868713X546X6538SQ8"
    t.text "868713X546X6538SQ9"
    t.text "868713X546X6538SQ10"
    t.text "868713X546X6539SQ1"
    t.text "868713X546X6539SQ2"
    t.text "868713X546X6539SQ3"
    t.text "868713X546X6539SQ4"
    t.text "868713X546X6539SQ5"
    t.text "868713X546X6539SQ6"
    t.text "868713X546X6539SQ7"
    t.text "868713X546X6539SQ8"
    t.text "868713X546X6539SQ9"
    t.text "868713X546X6539SQ10"
    t.string "868713X546X6540SQ1", limit: 5
    t.string "868713X546X6540SQ2", limit: 5
    t.string "868713X546X6540SQ3", limit: 5
    t.string "868713X546X6540SQ4", limit: 5
    t.string "868713X546X6540SQ5", limit: 5
    t.string "868713X546X6540SQ6", limit: 5
    t.string "868713X546X6540SQ7", limit: 5
    t.string "868713X546X6540SQ8", limit: 5
    t.string "868713X546X6540SQ9", limit: 5
    t.string "868713X546X6540SQ10", limit: 5
    t.text "868713X546X6541SQ1"
    t.text "868713X546X6541SQ2"
    t.text "868713X546X6541SQ3"
    t.text "868713X546X6541SQ4"
    t.text "868713X546X6541SQ5"
    t.text "868713X546X6541SQ6"
    t.text "868713X546X6541SQ7"
    t.text "868713X546X6541SQ8"
    t.text "868713X546X6541SQ9"
    t.text "868713X546X6541SQ10"
    t.text "868713X547X6542SQ1"
    t.text "868713X547X6542SQ2"
    t.text "868713X547X6542SQ3"
    t.text "868713X547X6542SQ4"
    t.text "868713X547X6542SQ5"
    t.text "868713X547X6542SQ6"
    t.text "868713X547X6542SQ7"
    t.text "868713X547X6542SQ8"
    t.text "868713X547X6542SQ9"
    t.text "868713X547X6542SQ10"
    t.text "868713X547X6543SQ1"
    t.text "868713X547X6543SQ2"
    t.text "868713X547X6543SQ3"
    t.text "868713X547X6543SQ4"
    t.text "868713X547X6543SQ5"
    t.text "868713X547X6543SQ6"
    t.text "868713X547X6543SQ7"
    t.text "868713X547X6543SQ8"
    t.text "868713X547X6543SQ9"
    t.text "868713X547X6543SQ10"
    t.string "868713X547X6544SQ1", limit: 5
    t.string "868713X547X6544SQ2", limit: 5
    t.string "868713X547X6544SQ3", limit: 5
    t.string "868713X547X6544SQ4", limit: 5
    t.string "868713X547X6544SQ5", limit: 5
    t.string "868713X547X6544SQ6", limit: 5
    t.string "868713X547X6544SQ7", limit: 5
    t.string "868713X547X6544SQ8", limit: 5
    t.string "868713X547X6544SQ9", limit: 5
    t.string "868713X547X6544SQ10", limit: 5
    t.text "868713X547X6545SQ1"
    t.text "868713X547X6545SQ2"
    t.text "868713X547X6545SQ3"
    t.text "868713X547X6545SQ4"
    t.text "868713X547X6545SQ5"
    t.text "868713X547X6545SQ6"
    t.text "868713X547X6545SQ7"
    t.text "868713X547X6545SQ8"
    t.text "868713X547X6545SQ9"
    t.text "868713X547X6545SQ10"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_868713_47039"
  end

  create_table "lime_survey_869922", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "869922X199X2684StudentYear"
    t.text "869922X199X2684StudentEmail"
    t.text "869922X199X2684StudentName"
    t.text "869922X199X2684CoachEmail"
    t.text "869922X199X2684CoachName"
    t.datetime "869922X199X2427", precision: nil
    t.text "869922X199X2437"
    t.text "869922X199X2438"
    t.text "869922X199X2439"
    t.string "869922X214X2676SQ001", limit: 5
    t.string "869922X214X2676SQ002", limit: 5
    t.string "869922X214X2676SQ003", limit: 5
    t.string "869922X214X2676SQ004", limit: 5
    t.text "869922X214X2681"
    t.text "869922X214X2682"
    t.text "869922X214X2683"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_869922_42232"
  end

  create_table "lime_survey_871339", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "871339X780X9097"
    t.text "871339X780X9098"
    t.text "871339X780X9104"
    t.text "871339X780X9105"
    t.text "871339X780X9106"
    t.text "871339X780X9107"
    t.string "871339X781X9099Represents", limit: 5
    t.string "871339X781X9099Responsible", limit: 5
    t.string "871339X781X9099Determine", limit: 5
    t.string "871339X781X9099Active", limit: 5
    t.string "871339X782X9100LearnAbout", limit: 5
    t.string "871339X782X9100AcceptAny", limit: 5
    t.string "871339X782X9100DevelopAShared", limit: 5
    t.string "871339X782X9100SpecificMeasurable", limit: 5
    t.string "871339X782X9100WorkWithYourCoach", limit: 5
    t.string "871339X783X9101RecognizePersFeeling", limit: 5
    t.string "871339X783X9101AwareOfEmotions", limit: 5
    t.string "871339X783X9101InvestigateBehavior", limit: 5
    t.string "871339X783X9101MyThinkingHabits", limit: 5
    t.string "871339X783X9101SafeLearningEnv", limit: 5
    t.string "871339X783X9101Commitment", limit: 5
    t.string "871339X783X9101Affirms", limit: 5
    t.string "871339X783X9101esLearningPrStimulat", limit: 5
    t.string "871339X783X9101Encourages", limit: 5
    t.text "871339X784X9102"
    t.text "871339X784X9103"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_871339_41778"
  end

  create_table "lime_survey_871339_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "871339X780time"
    t.float "871339X780X9097time"
    t.float "871339X780X9098time"
    t.float "871339X780X9104time"
    t.float "871339X780X9105time"
    t.float "871339X780X9106time"
    t.float "871339X780X9107time"
    t.float "871339X781time"
    t.float "871339X781X9099time"
    t.float "871339X782time"
    t.float "871339X782X9100time"
    t.float "871339X783time"
    t.float "871339X783X9101time"
    t.float "871339X784time"
    t.float "871339X784X9102time"
    t.float "871339X784X9103time"
  end

  create_table "lime_survey_872832", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "872832X1482X16099StudentYear"
    t.text "872832X1482X16099StudentEmail"
    t.text "872832X1482X16099StudentName"
    t.text "872832X1482X16099CoachEmail"
    t.text "872832X1482X16099CoachName"
    t.decimal "872832X1483X16100Week1MCQ", precision: 30, scale: 10
    t.decimal "872832X1483X16100Week2MCQ", precision: 30, scale: 10
    t.decimal "872832X1483X16100Week3MCQ", precision: 30, scale: 10
    t.decimal "872832X1483X16100Week4MCQ", precision: 30, scale: 10
    t.decimal "872832X1483X16100Week5MCQ", precision: 30, scale: 10
    t.decimal "872832X1483X16100Week6MCQ", precision: 30, scale: 10
    t.decimal "872832X1483X16100MCQAve", precision: 30, scale: 10
    t.text "872832X1483X16101DroppedQuiz"
    t.text "872832X1483X16101DroppedScore"
    t.decimal "872832X1483X16102CSA1", precision: 30, scale: 10
    t.decimal "872832X1483X16102CSA2", precision: 30, scale: 10
    t.decimal "872832X1483X16102CSA3CSLAssign", precision: 30, scale: 10
    t.decimal "872832X1483X16102CSA4EHR", precision: 30, scale: 10
    t.decimal "872832X1483X16102CSA5Attend", precision: 30, scale: 10
    t.decimal "872832X1483X16102HSSAve", precision: 30, scale: 10
    t.decimal "872832X1483X16108BSS1AnatPB", precision: 30, scale: 10
    t.decimal "872832X1483X16108BSS2AnatPL1", precision: 30, scale: 10
    t.decimal "872832X1483X16108BSS3AnatPL2", precision: 30, scale: 10
    t.decimal "872832X1483X16108BSS4Histo", precision: 30, scale: 10
    t.decimal "872832X1483X16108BSS5AAnat", precision: 30, scale: 10
    t.decimal "872832X1483X16108BSS6Path", precision: 30, scale: 10
    t.decimal "872832X1483X16108BSSAvg", precision: 30, scale: 10
    t.decimal "872832X1483X16103Final1", precision: 30, scale: 10
    t.decimal "872832X1483X16104NBME", precision: 30, scale: 10
    t.decimal "872832X1483X16105OSCE", precision: 30, scale: 10
    t.decimal "872832X1483X16105EBM", precision: 30, scale: 10
    t.decimal "872832X1483X16105AnatLab", precision: 30, scale: 10
    t.decimal "872832X1483X16105Ultra", precision: 30, scale: 10
    t.decimal "872832X1483X16105HSSAvg", precision: 30, scale: 10
    t.decimal "872832X1483X16109AnatPract", precision: 30, scale: 10
    t.decimal "872832X1483X16109Reprobio", precision: 30, scale: 10
    t.decimal "872832X1483X16109HistoPath", precision: 30, scale: 10
    t.decimal "872832X1483X16109Micro", precision: 30, scale: 10
    t.decimal "872832X1483X16109BSSAvg", precision: 30, scale: 10
    t.decimal "872832X1483X16106Component1", precision: 30, scale: 10
    t.decimal "872832X1483X16106Component2A", precision: 30, scale: 10
    t.decimal "872832X1483X16106Component2B", precision: 30, scale: 10
    t.decimal "872832X1483X16106Component3", precision: 30, scale: 10
    t.decimal "872832X1483X16106Component4", precision: 30, scale: 10
    t.decimal "872832X1483X16106Component5A", precision: 30, scale: 10
    t.decimal "872832X1483X16106Component5B", precision: 30, scale: 10
    t.text "872832X1483X16107"
    t.integer "872832X1483X16107_filecount"
    t.index ["token"], name: "idx_survey_token_872832_4521"
  end

  create_table "lime_survey_874158", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "874158X652X7946", limit: 5
    t.text "874158X652X7947"
    t.string "874158X649X7940Clarify", limit: 5
    t.string "874158X649X7940Represents", limit: 5
    t.string "874158X649X7940Responsible", limit: 5
    t.string "874158X649X7940Inspire", limit: 5
    t.string "874158X649X7940Determine", limit: 5
    t.string "874158X649X7940Active", limit: 5
    t.string "874158X649X7940Honest", limit: 5
    t.string "874158X650X7941SeekAndHear", limit: 5
    t.string "874158X650X7941LearnAbout", limit: 5
    t.string "874158X650X7941ConveyAny", limit: 5
    t.string "874158X650X7941DevelopAShared", limit: 5
    t.string "874158X650X7941SpecificMeasurable", limit: 5
    t.string "874158X650X7941WorkWithYourStudent", limit: 5
    t.string "874158X650X7941OrganizeInterpret", limit: 5
    t.string "874158X650X7941DetermineTimelines", limit: 5
    t.string "874158X650X7941MonitorYourProgress", limit: 5
    t.string "874158X650X7941IdentifyProblems", limit: 5
    t.string "874158X650X7941SolveProblems", limit: 5
    t.string "874158X650X7941Characterize", limit: 5
    t.text "874158X651X7942"
    t.text "874158X651X7943"
    t.text "874158X648X7939"
    t.text "874158X648X7945"
    t.text "874158X648X7944"
    t.text "874158X648X7948"
    t.text "874158X648X7949"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_874158_25114"
  end

  create_table "lime_survey_875262", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "875262X631X7819", limit: 5
    t.text "875262X631X7820"
    t.string "875262X628X7813Clarify", limit: 5
    t.string "875262X628X7813Represents", limit: 5
    t.string "875262X628X7813Responsible", limit: 5
    t.string "875262X628X7813Inspire", limit: 5
    t.string "875262X628X7813Determine", limit: 5
    t.string "875262X628X7813Active", limit: 5
    t.string "875262X628X7813Honest", limit: 5
    t.string "875262X629X7814SeekAndHear", limit: 5
    t.string "875262X629X7814LearnAbout", limit: 5
    t.string "875262X629X7814ConveyAny", limit: 5
    t.string "875262X629X7814DevelopAShared", limit: 5
    t.string "875262X629X7814SpecificMeasurable", limit: 5
    t.string "875262X629X7814WorkWithYourStudent", limit: 5
    t.string "875262X629X7814OrganizeInterpret", limit: 5
    t.string "875262X629X7814DetermineTimelines", limit: 5
    t.string "875262X629X7814MonitorYourProgress", limit: 5
    t.string "875262X629X7814IdentifyProblems", limit: 5
    t.string "875262X629X7814SolveProblems", limit: 5
    t.string "875262X629X7814Characterize", limit: 5
    t.text "875262X630X7815"
    t.text "875262X630X7816"
    t.text "875262X627X7812"
    t.text "875262X627X7818"
    t.text "875262X627X7817"
    t.text "875262X627X7821"
    t.text "875262X627X7822"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_875262_31634"
  end

  create_table "lime_survey_876368", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "876368X882X9940StudentEmail"
    t.text "876368X882X9940StudentName"
    t.text "876368X882X9940StudentID"
    t.text "876368X882X9940CoachEmail"
    t.text "876368X882X9940CoachName"
    t.string "876368X883X9934RateYourHealth4Weeks", limit: 5
    t.string "876368X883X9935ProblemsWalking", limit: 5
    t.string "876368X883X9935DifficultDailyWork", limit: 5
    t.string "876368X883X9935EmotionsProb", limit: 5
    t.string "876368X883X9935PersonalProbUsualWor", limit: 5
    t.string "876368X883X9936BodilyPain", limit: 5
    t.string "876368X883X9937Past4WeekEnergyLevel", limit: 5
    t.string "876368X883X9938BotheredEmotionalPro", limit: 5
    t.string "876368X884X9939BennUpset", limit: 5
    t.string "876368X884X9939UnableControl", limit: 5
    t.string "876368X884X9939FeltNervous", limit: 5
    t.string "876368X884X9939FeltConfident", limit: 5
    t.string "876368X884X9939FeltGoingYourWay", limit: 5
    t.string "876368X884X9939CouldNotCope", limit: 5
    t.string "876368X884X9939AbleToControl", limit: 5
    t.string "876368X884X9939OnTopOfThings", limit: 5
    t.string "876368X884X9939BeenAngered", limit: 5
    t.string "876368X884X9939PilingUpHigh", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_876368_38913"
  end

  create_table "lime_survey_877165", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "877165X933X10451"
    t.text "877165X933X10459"
    t.text "877165X933X10460"
    t.text "877165X933X10461"
    t.text "877165X933X10462"
    t.string "877165X933X10452", limit: 5
    t.string "877165X933X10453", limit: 5
    t.text "877165X933X10454"
    t.decimal "877165X933X10455", precision: 30, scale: 10
    t.string "877165X933X10456", limit: 5
    t.decimal "877165X933X10457", precision: 30, scale: 10
    t.decimal "877165X933X10458", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_877165_23843"
  end

  create_table "lime_survey_878259", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "878259X1134X13281SQ001", limit: 5
    t.string "878259X1134X13281SQ002", limit: 5
    t.string "878259X1134X13281SQ005", limit: 5
    t.string "878259X1134X13281SQ004", limit: 5
    t.string "878259X1135X13282SQ001", limit: 5
    t.string "878259X1135X13282SQ004", limit: 5
    t.string "878259X1135X13282SQ003", limit: 5
    t.string "878259X1135X13282SQ002", limit: 5
    t.string "878259X1153X13352SQ001", limit: 5
    t.text "878259X1137X13284"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_878259_29175"
  end

  create_table "lime_survey_882568", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.decimal "882568X733X8827", precision: 30, scale: 10
    t.text "882568X733X8834"
    t.string "882568X733X8848", limit: 5
    t.text "882568X733X8848other"
    t.string "882568X733X8850SQ001", limit: 5
    t.string "882568X733X8850SQ002", limit: 5
    t.string "882568X733X8850SQ003", limit: 5
    t.string "882568X733X8850SQ004", limit: 5
    t.text "882568X733X8850other"
    t.string "882568X742X8890SQ001", limit: 5
    t.string "882568X742X8890SQ002", limit: 5
    t.string "882568X742X8890SQ003", limit: 5
    t.string "882568X742X8921SQ001", limit: 5
    t.string "882568X742X8921SQ002", limit: 5
    t.string "882568X749X8938SQ001", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_882568_11603"
  end

  create_table "lime_survey_885481", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "885481X560X6900StudentYear"
    t.text "885481X560X6900StudentEmail"
    t.text "885481X560X6900StudentName"
    t.text "885481X560X6900CoachEmail"
    t.text "885481X560X6900CoachName"
    t.text "885481X561X6901SQ001"
    t.text "885481X561X6901SQ002"
    t.text "885481X561X6902"
    t.integer "885481X561X6902_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_885481_32791"
  end

  create_table "lime_survey_886573", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "886573X245X2904", limit: 5
    t.string "886573X250X3071", limit: 5
    t.string "886573X251X3072", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_886573_21544"
  end

  create_table "lime_survey_887795", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "887795X58X888StudentYear"
    t.text "887795X58X888StudentEmail"
    t.text "887795X58X888StudentName"
    t.text "887795X58X888CoachEmail"
    t.text "887795X58X888CoachName"
    t.text "887795X59X895CourseYear"
    t.text "887795X59X895CourseName"
    t.decimal "887795X59X889Week1MCQ", precision: 30, scale: 10
    t.decimal "887795X59X889Week2MCQ", precision: 30, scale: 10
    t.decimal "887795X59X889Week3MCQ", precision: 30, scale: 10
    t.decimal "887795X59X889Week4MCQ", precision: 30, scale: 10
    t.decimal "887795X59X889Week5MCQ", precision: 30, scale: 10
    t.text "887795X59X890DroppedQuiz"
    t.text "887795X59X890DroppedScore"
    t.decimal "887795X59X891Week2", precision: 30, scale: 10
    t.decimal "887795X59X891Week3", precision: 30, scale: 10
    t.decimal "887795X59X892", precision: 30, scale: 10
    t.decimal "887795X59X893", precision: 30, scale: 10
    t.decimal "887795X59X894HistologySkills", precision: 30, scale: 10
    t.decimal "887795X59X894Microbiology", precision: 30, scale: 10
    t.decimal "887795X59X894OSCE", precision: 30, scale: 10
    t.decimal "887795X59X894Pathlogy", precision: 30, scale: 10
    t.decimal "887795X59X896Component1", precision: 30, scale: 10
    t.decimal "887795X59X896Component2", precision: 30, scale: 10
    t.decimal "887795X59X896Component3", precision: 30, scale: 10
    t.decimal "887795X59X896Component4", precision: 30, scale: 10
    t.decimal "887795X59X896Component5", precision: 30, scale: 10
    t.text "887795X59X1447"
    t.integer "887795X59X1447_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_887795_37480"
  end

  create_table "lime_survey_893188", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "893188X187X2385InstructorKnowledge", limit: 5
    t.string "893188X187X2385InstructorWellPrep", limit: 5
    t.string "893188X187X2385InstructorRate", limit: 5
    t.text "893188X187X2386"
    t.text "893188X187X2387"
    t.text "893188X187X2388"
    t.string "893188X187X2389", limit: 255
    t.string "893188X187X2390", limit: 255
    t.string "893188X187X2391", limit: 255
    t.string "893188X187X2392ClickerQ", limit: 5
    t.string "893188X187X2392Brief", limit: 5
    t.string "893188X187X2392Pair", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_893188_15797"
  end

  create_table "lime_survey_893785", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "893785X1233X14155SQ001", limit: 5
    t.string "893785X1233X13713SQ001", limit: 5
    t.string "893785X1233X13713SQ003", limit: 5
    t.string "893785X1233X13713SQ002", limit: 5
    t.string "893785X1234X13714SQ001", limit: 5
    t.string "893785X1234X13714SQ002", limit: 5
    t.string "893785X1234X13714SQ003", limit: 5
    t.string "893785X1234X13714SQ004", limit: 5
    t.string "893785X1234X13714SQ005", limit: 5
    t.string "893785X1234X13714SQ006", limit: 5
    t.string "893785X1234X13714SQ007", limit: 5
    t.string "893785X1235X13715SQ001", limit: 5
    t.text "893785X1236X13716"
    t.text "893785X1236X13717"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_893785_48130"
  end

  create_table "lime_survey_895586", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.decimal "895586X734X8828", precision: 30, scale: 10
    t.text "895586X734X8839"
    t.string "895586X734X8842", limit: 5
    t.text "895586X734X8842other"
    t.string "895586X734X8853SQ001", limit: 5
    t.string "895586X734X8853SQ002", limit: 5
    t.string "895586X734X8853SQ003", limit: 5
    t.string "895586X734X8853SQ004", limit: 5
    t.string "895586X734X8853SQ005", limit: 5
    t.text "895586X734X8853other"
    t.string "895586X741X8892SQ001", limit: 5
    t.string "895586X741X8892SQ002", limit: 5
    t.string "895586X741X8892SQ003", limit: 5
    t.string "895586X750X8926SQ001", limit: 5
    t.string "895586X750X8926SQ002", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_895586_5495"
  end

  create_table "lime_survey_895675", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "895675X1208X14151SQ001", limit: 5
    t.string "895675X1208X13605SQ001", limit: 5
    t.string "895675X1208X13605SQ003", limit: 5
    t.string "895675X1208X13605SQ002", limit: 5
    t.string "895675X1209X13606SQ001", limit: 5
    t.string "895675X1209X13606SQ002", limit: 5
    t.string "895675X1209X13606SQ003", limit: 5
    t.string "895675X1209X13606SQ004", limit: 5
    t.string "895675X1209X13606SQ005", limit: 5
    t.string "895675X1209X13606SQ006", limit: 5
    t.string "895675X1209X13606SQ007", limit: 5
    t.string "895675X1210X13607SQ001", limit: 5
    t.text "895675X1211X13608"
    t.text "895675X1211X13609"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_895675_40937"
  end

  create_table "lime_survey_898357", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "898357X851X9548StudentYear"
    t.text "898357X851X9548StudentEmail"
    t.text "898357X851X9548StudentName"
    t.text "898357X851X9548CoachEmail"
    t.text "898357X851X9548CoachName"
    t.text "898357X850X9493"
    t.integer "898357X850X9493_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_898357_27121"
  end

  create_table "lime_survey_911612", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "911612X963X10615StudentYear"
    t.text "911612X963X10615StudentEmail"
    t.text "911612X963X10615StudentName"
    t.text "911612X963X10615CoachEmail"
    t.text "911612X963X10615CoachName"
    t.text "911612X964X10616CourseYear"
    t.text "911612X964X10616CourseName"
    t.decimal "911612X964X10617Week1MCQ", precision: 30, scale: 10
    t.decimal "911612X964X10617Week2MCQ", precision: 30, scale: 10
    t.decimal "911612X964X10617Week3MCQ", precision: 30, scale: 10
    t.decimal "911612X964X10617Week4MCQ", precision: 30, scale: 10
    t.decimal "911612X964X10617Week5MCQ", precision: 30, scale: 10
    t.text "911612X964X10618DroppedQuiz"
    t.text "911612X964X10618DroppedScore"
    t.decimal "911612X964X10619CSA01", precision: 30, scale: 10
    t.decimal "911612X964X10619CSA02", precision: 30, scale: 10
    t.decimal "911612X964X10619CSA03", precision: 30, scale: 10
    t.decimal "911612X964X10619CSA04", precision: 30, scale: 10
    t.decimal "911612X964X10619CSA05", precision: 30, scale: 10
    t.decimal "911612X964X10619CSA06", precision: 30, scale: 10
    t.decimal "911612X964X10619CSA07", precision: 30, scale: 10
    t.decimal "911612X964X10619CSA08", precision: 30, scale: 10
    t.decimal "911612X964X10619CSA09", precision: 30, scale: 10
    t.decimal "911612X964X10619CSA10", precision: 30, scale: 10
    t.decimal "911612X964X10619CSA11", precision: 30, scale: 10
    t.decimal "911612X964X10620FinalBLHD", precision: 30, scale: 10
    t.decimal "911612X964X10621NBME", precision: 30, scale: 10
    t.decimal "911612X964X10622OSCE", precision: 30, scale: 10
    t.decimal "911612X964X10622Histo", precision: 30, scale: 10
    t.decimal "911612X964X10622VisualDiag", precision: 30, scale: 10
    t.decimal "911612X964X10622CellBio", precision: 30, scale: 10
    t.decimal "911612X964X10622Micro", precision: 30, scale: 10
    t.decimal "911612X964X10622Anatomy", precision: 30, scale: 10
    t.decimal "911612X964X10623Component1", precision: 30, scale: 10
    t.decimal "911612X964X10623Component2", precision: 30, scale: 10
    t.decimal "911612X964X10623Component3", precision: 30, scale: 10
    t.decimal "911612X964X10623Component4", precision: 30, scale: 10
    t.decimal "911612X964X10623Component5", precision: 30, scale: 10
    t.text "911612X964X10624"
    t.integer "911612X964X10624_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_911612_12080"
  end

  create_table "lime_survey_914672", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "914672X318X3708StudentYear"
    t.text "914672X318X3708StudentEmail"
    t.text "914672X318X3708StudentName"
    t.text "914672X318X3708CoachEmail"
    t.text "914672X318X3708CoachName"
    t.text "914672X311X3653PCP1"
    t.text "914672X311X3653PCP2"
    t.text "914672X311X3653PCP3"
    t.text "914672X311X3653PCP4"
    t.text "914672X311X3653PCP5"
    t.text "914672X311X3653PCP6"
    t.text "914672X312X3660MK1"
    t.text "914672X312X3660MK2"
    t.text "914672X312X3660MK3"
    t.text "914672X312X3660MK4"
    t.text "914672X312X3660MK5"
    t.text "914672X313X3666PBLI1"
    t.text "914672X313X3666PBLI2"
    t.text "914672X313X3666PBLI3"
    t.text "914672X313X3666PBLI4"
    t.text "914672X313X3666PBLI5"
    t.text "914672X313X3666PBLI6"
    t.text "914672X313X3666PBLI7"
    t.text "914672X313X3666PBLI8"
    t.text "914672X314X3674ICS1"
    t.text "914672X314X3674ICS2"
    t.text "914672X314X3674ICS3"
    t.text "914672X314X3674ICS4"
    t.text "914672X314X3674ICS5"
    t.text "914672X314X3674ICS6"
    t.text "914672X314X3674ICS7"
    t.text "914672X314X3674ICS8"
    t.text "914672X315X3683PPPD1"
    t.text "914672X315X3683PPPD2"
    t.text "914672X315X3683PPPD3"
    t.text "914672X315X3683PPPD4"
    t.text "914672X315X3683PPPD5"
    t.text "914672X315X3683PPPD6"
    t.text "914672X315X3683PPPD7"
    t.text "914672X315X3683PPPD8"
    t.text "914672X315X3683PPPD9"
    t.text "914672X315X3683PPPD10"
    t.text "914672X315X3683PPPD11"
    t.text "914672X316X3696SBPIC1"
    t.text "914672X316X3696SBPIC2"
    t.text "914672X316X3696SBPIC3"
    t.text "914672X316X3696SBPIC4"
    t.text "914672X316X3696SBPIC5"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_914672_1605"
  end

  create_table "lime_survey_915499", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "915499X474X5301SQ001", limit: 5
    t.datetime "915499X471X5281", precision: nil
    t.string "915499X471X5282", limit: 5
    t.text "915499X471X5282other"
    t.string "915499X471X5283", limit: 5
    t.text "915499X471X5283other"
    t.string "915499X471X5284", limit: 5
    t.decimal "915499X471X5285", precision: 30, scale: 10
    t.string "915499X471X5286", limit: 5
    t.text "915499X471X5287Row1_Institution"
    t.text "915499X471X5287Row1_DegAttained"
    t.text "915499X471X5287Row1_MajorArea"
    t.text "915499X471X5287Row1_MinorArea"
    t.text "915499X471X5287Row1_YrOfGrad"
    t.text "915499X471X5287Row1_ScienceGPA"
    t.text "915499X471X5287Row1_OverallGPA"
    t.text "915499X471X5287Row2_Institution"
    t.text "915499X471X5287Row2_DegAttained"
    t.text "915499X471X5287Row2_MajorArea"
    t.text "915499X471X5287Row2_MinorArea"
    t.text "915499X471X5287Row2_YrOfGrad"
    t.text "915499X471X5287Row2_ScienceGPA"
    t.text "915499X471X5287Row2_OverallGPA"
    t.text "915499X471X5287Row3_Institution"
    t.text "915499X471X5287Row3_DegAttained"
    t.text "915499X471X5287Row3_MajorArea"
    t.text "915499X471X5287Row3_MinorArea"
    t.text "915499X471X5287Row3_YrOfGrad"
    t.text "915499X471X5287Row3_ScienceGPA"
    t.text "915499X471X5287Row3_OverallGPA"
    t.text "915499X471X5287Row4_Institution"
    t.text "915499X471X5287Row4_DegAttained"
    t.text "915499X471X5287Row4_MajorArea"
    t.text "915499X471X5287Row4_MinorArea"
    t.text "915499X471X5287Row4_YrOfGrad"
    t.text "915499X471X5287Row4_ScienceGPA"
    t.text "915499X471X5287Row4_OverallGPA"
    t.text "915499X471X5288Row1_YrMCAT"
    t.text "915499X471X5288Row1_PhySciences"
    t.text "915499X471X5288Row1_VerbalRea"
    t.text "915499X471X5288Row1_BioSciences"
    t.text "915499X471X5288Row1_MCATtolScore"
    t.text "915499X471X5288Row2_YrMCAT"
    t.text "915499X471X5288Row2_PhySciences"
    t.text "915499X471X5288Row2_VerbalRea"
    t.text "915499X471X5288Row2_BioSciences"
    t.text "915499X471X5288Row2_MCATtolScore"
    t.text "915499X471X5288Row3_YrMCAT"
    t.text "915499X471X5288Row3_PhySciences"
    t.text "915499X471X5288Row3_VerbalRea"
    t.text "915499X471X5288Row3_BioSciences"
    t.text "915499X471X5288Row3_MCATtolScore"
    t.string "915499X472X5289SQ1", limit: 5
    t.string "915499X472X5289SQ2", limit: 5
    t.string "915499X472X5289SQ3", limit: 5
    t.string "915499X472X5290SQ1", limit: 5
    t.string "915499X472X5290SQ2", limit: 5
    t.string "915499X472X5290SQ3", limit: 5
    t.string "915499X472X5291SQ1", limit: 5
    t.string "915499X472X5291SQ2", limit: 5
    t.string "915499X472X5291SQ3", limit: 5
    t.string "915499X472X5291SQ4", limit: 5
    t.string "915499X472X5292SQ1", limit: 5
    t.string "915499X472X5292SQ2", limit: 5
    t.string "915499X472X5292SQ3", limit: 5
    t.string "915499X472X5292SQ4", limit: 5
    t.string "915499X472X5293SQ1", limit: 5
    t.string "915499X472X5293SQ2", limit: 5
    t.string "915499X472X5293SQ3", limit: 5
    t.string "915499X472X5293SQ4", limit: 5
    t.string "915499X472X5294SQ1", limit: 5
    t.string "915499X472X5294SQ2", limit: 5
    t.string "915499X472X5294SQ3", limit: 5
    t.string "915499X472X5294SQ4", limit: 5
    t.string "915499X472X5295SQ1", limit: 5
    t.string "915499X472X5295SQ2", limit: 5
    t.string "915499X472X5295SQ3", limit: 5
    t.string "915499X472X5295SQ4", limit: 5
    t.string "915499X472X5296sq1", limit: 5
    t.string "915499X472X5296sq2", limit: 5
    t.string "915499X472X5296sq3", limit: 5
    t.text "915499X472X5296other"
    t.string "915499X472X5297sq1", limit: 5
    t.string "915499X472X5297sq2", limit: 5
    t.string "915499X472X5297sq3", limit: 5
    t.text "915499X472X5297other"
    t.text "915499X473X5298SQ1_OSHU"
    t.text "915499X473X5298SQ1_Ideal"
    t.text "915499X473X5298SQ2_OSHU"
    t.text "915499X473X5298SQ2_Ideal"
    t.text "915499X473X5298SQ3_OSHU"
    t.text "915499X473X5298SQ3_Ideal"
    t.string "915499X475X5299sq1", limit: 5
    t.string "915499X475X5299sq2", limit: 5
    t.string "915499X475X5299sq3", limit: 5
    t.string "915499X475X5299sq4", limit: 5
    t.string "915499X475X5300SQ1", limit: 5
    t.decimal "915499X476X5364SQ001", precision: 30, scale: 10
    t.decimal "915499X476X5364SQ002", precision: 30, scale: 10
    t.decimal "915499X476X5364SQ003", precision: 30, scale: 10
    t.decimal "915499X476X5364SQ004", precision: 30, scale: 10
    t.decimal "915499X476X5364SQ005", precision: 30, scale: 10
    t.decimal "915499X476X5370SQ001", precision: 30, scale: 10
    t.decimal "915499X476X5370SQ002", precision: 30, scale: 10
    t.decimal "915499X476X5370SQ003", precision: 30, scale: 10
    t.decimal "915499X476X5370SQ004", precision: 30, scale: 10
    t.decimal "915499X476X5370SQ005", precision: 30, scale: 10
    t.decimal "915499X476X5376SQ001", precision: 30, scale: 10
    t.decimal "915499X476X5376SQ002", precision: 30, scale: 10
    t.decimal "915499X476X5376SQ003", precision: 30, scale: 10
    t.decimal "915499X476X5376SQ004", precision: 30, scale: 10
    t.decimal "915499X476X5376SQ005", precision: 30, scale: 10
    t.decimal "915499X476X5382SQ001", precision: 30, scale: 10
    t.decimal "915499X476X5382SQ002", precision: 30, scale: 10
    t.decimal "915499X476X5382SQ003", precision: 30, scale: 10
    t.decimal "915499X476X5382SQ004", precision: 30, scale: 10
    t.decimal "915499X476X5382SQ005", precision: 30, scale: 10
    t.decimal "915499X476X5388SQ001", precision: 30, scale: 10
    t.decimal "915499X476X5388SQ002", precision: 30, scale: 10
    t.decimal "915499X476X5388SQ003", precision: 30, scale: 10
    t.decimal "915499X476X5388SQ004", precision: 30, scale: 10
    t.decimal "915499X476X5388SQ005", precision: 30, scale: 10
    t.decimal "915499X476X5394SQ001", precision: 30, scale: 10
    t.decimal "915499X476X5394SQ002", precision: 30, scale: 10
    t.decimal "915499X476X5394SQ003", precision: 30, scale: 10
    t.decimal "915499X476X5394SQ004", precision: 30, scale: 10
    t.decimal "915499X476X5394SQ005", precision: 30, scale: 10
    t.decimal "915499X476X5400SQ001", precision: 30, scale: 10
    t.decimal "915499X476X5400SQ002", precision: 30, scale: 10
    t.decimal "915499X476X5400SQ003", precision: 30, scale: 10
    t.decimal "915499X476X5400SQ004", precision: 30, scale: 10
    t.decimal "915499X476X5400SQ005", precision: 30, scale: 10
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_915499_49000"
  end

  create_table "lime_survey_916752", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "916752X2X30SQ001", limit: 5
    t.string "916752X2X31", limit: 5
    t.string "916752X2X32", limit: 1
    t.string "916752X2X33", limit: 5
    t.text "916752X2X33other"
    t.string "916752X2X34", limit: 1
    t.string "916752X2X35", limit: 5
    t.text "916752X2X35other"
    t.string "916752X2X36", limit: 1
    t.string "916752X2X37", limit: 5
    t.text "916752X2X37other"
    t.string "916752X2X381", limit: 5
    t.string "916752X2X382", limit: 5
    t.string "916752X2X383", limit: 5
    t.string "916752X2X384", limit: 5
    t.string "916752X2X385", limit: 5
    t.string "916752X2X386", limit: 5
    t.string "916752X2X387", limit: 5
    t.string "916752X2X388", limit: 5
    t.text "916752X2X38other"
    t.string "916752X2X39SQ001", limit: 5
    t.string "916752X2X40SQ001", limit: 5
    t.string "916752X2X40SQ002", limit: 5
    t.string "916752X2X40SQ003", limit: 5
    t.string "916752X2X40SQ004", limit: 5
    t.string "916752X2X40SQ005", limit: 5
    t.string "916752X2X40SQ006", limit: 5
    t.string "916752X2X41SQ001", limit: 5
    t.string "916752X2X41SQ002", limit: 5
    t.string "916752X2X41SQ003", limit: 5
    t.string "916752X2X41SQ004", limit: 5
    t.string "916752X2X41SQ005", limit: 5
    t.string "916752X2X41SQ006", limit: 5
    t.text "916752X2X42"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_916752_28174"
  end

  create_table "lime_survey_916752_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "916752X2time"
    t.float "916752X2X30time"
    t.float "916752X2X31time"
    t.float "916752X2X32time"
    t.float "916752X2X33time"
    t.float "916752X2X34time"
    t.float "916752X2X35time"
    t.float "916752X2X36time"
    t.float "916752X2X37time"
    t.float "916752X2X38time"
    t.float "916752X2X39time"
    t.float "916752X2X40time"
    t.float "916752X2X41time"
    t.float "916752X2X42time"
  end

  create_table "lime_survey_917581", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "917581X668X8100StudentYear"
    t.text "917581X668X8100StudentID"
    t.text "917581X668X8100MedhubID"
    t.text "917581X668X8100StudentEmail"
    t.text "917581X668X8100StudentName"
    t.text "917581X668X8100CoachEmail"
    t.text "917581X668X8100CoachName"
    t.text "917581X670X8102CourseName"
    t.text "917581X670X8102CourseID"
    t.text "917581X670X8102StartDt"
    t.text "917581X670X8102EndDt"
    t.text "917581X670X8102SubmitDt"
    t.text "917581X670X8102Eval"
    t.text "917581X670X8102FinalGrade"
    t.text "917581X671X8103ProfConcerns"
    t.text "917581X671X8103CommProfConcerns"
    t.text "917581X671X8103OverSummCommPerf"
    t.text "917581X671X8103AddCommOnPerform"
    t.text "917581X671X8103MSPE"
    t.text "917581X671X8103OptClinicExpComm"
    t.text "917581X671X8103Feedback"
    t.text "917581X669X8101ICS1"
    t.text "917581X669X8101ICS2"
    t.text "917581X669X8101ICS3"
    t.text "917581X669X8101ICS4"
    t.text "917581X669X8101ICS5"
    t.text "917581X669X8101ICS6"
    t.text "917581X669X8101ICS7"
    t.text "917581X669X8101ICS8"
    t.text "917581X669X8101MK1"
    t.text "917581X669X8101MK2"
    t.text "917581X669X8101MK3"
    t.text "917581X669X8101MK4"
    t.text "917581X669X8101MK5"
    t.text "917581X669X8101PBLI1"
    t.text "917581X669X8101PBLI2"
    t.text "917581X669X8101PBLI3"
    t.text "917581X669X8101PBLI4"
    t.text "917581X669X8101PBLI5"
    t.text "917581X669X8101PBLI6"
    t.text "917581X669X8101PBLI7"
    t.text "917581X669X8101PBLI8"
    t.text "917581X669X8101PCP1"
    t.text "917581X669X8101PCP2"
    t.text "917581X669X8101PCP3"
    t.text "917581X669X8101PCP4"
    t.text "917581X669X8101PCP5"
    t.text "917581X669X8101PCP6"
    t.text "917581X669X8101PPPD01"
    t.text "917581X669X8101PPPD02"
    t.text "917581X669X8101PPPD03"
    t.text "917581X669X8101PPPD04"
    t.text "917581X669X8101PPPD05"
    t.text "917581X669X8101PPPD06"
    t.text "917581X669X8101PPPD07"
    t.text "917581X669X8101PPPD08"
    t.text "917581X669X8101PPPD09"
    t.text "917581X669X8101PPPD10"
    t.text "917581X669X8101PPPD11"
    t.text "917581X669X8101SBPIC1"
    t.text "917581X669X8101SBPIC2"
    t.text "917581X669X8101SBPIC3"
    t.text "917581X669X8101SBPIC4"
    t.text "917581X669X8101SBPIC5"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_917581_38329"
  end

  create_table "lime_survey_919367", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "919367X1194X13539SQ001", limit: 5
    t.string "919367X1194X13539SQ002", limit: 5
    t.string "919367X1194X13539SQ003", limit: 5
    t.string "919367X1194X13539SQ004", limit: 5
    t.text "919367X1194X13544"
    t.string "919367X1195X13540SQ001", limit: 5
    t.string "919367X1195X13540SQ002", limit: 5
    t.string "919367X1196X13541SQ001", limit: 5
    t.string "919367X1196X13541SQ002", limit: 5
    t.string "919367X1196X13541SQ003", limit: 5
    t.string "919367X1196X13541SQ004", limit: 5
    t.string "919367X1196X13541SQ005", limit: 5
    t.string "919367X1196X13541SQ006", limit: 5
    t.string "919367X1196X13541SQ007", limit: 5
    t.string "919367X1196X13541SQ008", limit: 5
    t.string "919367X1196X13541SQ009", limit: 5
    t.string "919367X1196X13541SQ010", limit: 5
    t.text "919367X1196X13545"
    t.string "919367X1197X13542SQ001", limit: 5
    t.text "919367X1198X13543"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_919367_24951"
  end

  create_table "lime_survey_923271", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "923271X1402X15112"
    t.text "923271X1402X15115"
    t.string "923271X1405X15116", limit: 5
    t.text "923271X1405X15117"
    t.string "923271X1403X15113C1", limit: 5
    t.string "923271X1403X15113C2", limit: 5
    t.string "923271X1403X15113C3", limit: 5
    t.string "923271X1403X15113C4", limit: 5
    t.string "923271X1403X15113C5", limit: 5
    t.string "923271X1403X15113C6", limit: 5
    t.string "923271X1403X15113C7", limit: 5
    t.string "923271X1403X15113C8", limit: 5
    t.string "923271X1403X15113C9", limit: 5
    t.text "923271X1404X15114"
    t.text "923271X1417X15231StudentYear"
    t.text "923271X1417X15231StudentEmail"
    t.text "923271X1417X15231StudentName"
    t.text "923271X1417X15231CoachEmail"
    t.text "923271X1417X15231CoachName"
    t.index ["token"], name: "idx_survey_token_923271_2337"
  end

  create_table "lime_survey_923512", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "923512X608X7413", limit: 5
    t.string "923512X609X74141", limit: 5
    t.string "923512X609X74142", limit: 5
    t.string "923512X609X74143", limit: 5
    t.string "923512X609X74144", limit: 5
    t.string "923512X609X74145", limit: 5
    t.string "923512X609X74146", limit: 5
    t.string "923512X609X74147", limit: 5
    t.string "923512X609X74148", limit: 5
    t.string "923512X609X74149", limit: 5
    t.string "923512X609X741410", limit: 5
    t.text "923512X609X7416"
    t.string "923512X610X74151", limit: 5
    t.string "923512X610X74152", limit: 5
    t.string "923512X610X74153", limit: 5
    t.string "923512X610X74154", limit: 5
    t.string "923512X610X74155", limit: 5
    t.string "923512X610X74156", limit: 5
    t.string "923512X610X74157", limit: 5
    t.string "923512X610X74158", limit: 5
    t.string "923512X610X74159", limit: 5
    t.string "923512X610X741510", limit: 5
    t.string "923512X610X741511", limit: 5
    t.string "923512X610X741512", limit: 5
    t.string "923512X610X741513", limit: 5
    t.string "923512X610X741514", limit: 5
    t.string "923512X610X741515", limit: 5
    t.string "923512X610X741516", limit: 5
    t.string "923512X610X741517", limit: 5
    t.string "923512X610X741518", limit: 5
    t.string "923512X610X741519", limit: 5
    t.string "923512X610X741520", limit: 5
    t.string "923512X610X741521", limit: 5
    t.string "923512X610X741522", limit: 5
    t.string "923512X610X741523", limit: 5
    t.string "923512X610X741524", limit: 5
    t.text "923512X610X7417"
    t.text "923512X611X7418"
    t.text "923512X611X7419"
    t.text "923512X611X7420"
    t.text "923512X611X7421"
    t.text "923512X611X7422"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_923512_37818"
  end

  create_table "lime_survey_925715", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "925715X410X4454"
    t.string "925715X408X4472", limit: 5
    t.text "925715X408X4472other"
    t.string "925715X408X4473", limit: 5
    t.text "925715X408X4473other"
    t.text "925715X408X4448"
    t.text "925715X408X4447"
    t.text "925715X408X4449"
    t.string "925715X408X4450", limit: 1
    t.text "925715X408X4451"
    t.text "925715X408X4474"
    t.text "925715X408X4452"
    t.string "925715X409X4453SQ001", limit: 5
    t.string "925715X409X4453SQ002", limit: 5
    t.string "925715X409X4453SQ003", limit: 5
    t.string "925715X409X4453SQ004", limit: 5
    t.string "925715X409X4453SQ005", limit: 5
    t.string "925715X409X4453SQ006", limit: 5
    t.string "925715X409X4453SQ007", limit: 5
    t.string "925715X409X4453SQ008", limit: 5
    t.string "925715X409X4453SQ009", limit: 5
    t.string "925715X409X4453SQ010", limit: 5
    t.string "925715X409X4453SQ011", limit: 5
    t.text "925715X411X4455StudentYear"
    t.text "925715X411X4455StudentEmail"
    t.text "925715X411X4455StudentName"
    t.text "925715X411X4455CoachEmail"
    t.text "925715X411X4455CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_925715_28227"
  end

  create_table "lime_survey_925715_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "925715X410time"
    t.float "925715X410X4454time"
    t.float "925715X408time"
    t.float "925715X408X4472time"
    t.float "925715X408X4473time"
    t.float "925715X408X4448time"
    t.float "925715X408X4447time"
    t.float "925715X408X4449time"
    t.float "925715X408X4450time"
    t.float "925715X408X4451time"
    t.float "925715X408X4474time"
    t.float "925715X408X4452time"
    t.float "925715X409time"
    t.float "925715X409X4453time"
    t.float "925715X411time"
    t.float "925715X411X4455time"
  end

  create_table "lime_survey_927695", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "927695X83X1357"
    t.string "927695X83X1358", limit: 255
    t.text "927695X83X1364"
    t.text "927695X83X1365"
    t.text "927695X83X1366"
    t.text "927695X83X1367"
    t.string "927695X84X1359Clarify", limit: 5
    t.string "927695X84X1359Represents", limit: 5
    t.string "927695X84X1359Responsible", limit: 5
    t.string "927695X84X1359Inspire", limit: 5
    t.string "927695X84X1359Determine", limit: 5
    t.string "927695X84X1359Active", limit: 5
    t.string "927695X84X1359Honest", limit: 5
    t.string "927695X85X1360SeekAndHear", limit: 5
    t.string "927695X85X1360LearnAbout", limit: 5
    t.string "927695X85X1360AcceptAny", limit: 5
    t.string "927695X85X1360DevelopAShared", limit: 5
    t.string "927695X85X1360SpecificMeasurable", limit: 5
    t.string "927695X85X1360WorkWithYourCoach", limit: 5
    t.string "927695X85X1360DetermineTimelines", limit: 5
    t.string "927695X85X1360MonitorYourProgress", limit: 5
    t.string "927695X85X1360IdentifyProblems", limit: 5
    t.string "927695X85X1360SolveProblems", limit: 5
    t.string "927695X85X1360Characterize", limit: 5
    t.string "927695X86X1361RecognizePersFeeling", limit: 5
    t.string "927695X86X1361AwareOfEmotions", limit: 5
    t.string "927695X86X1361InvestigateBehavior", limit: 5
    t.string "927695X86X1361PayAttention", limit: 5
    t.string "927695X86X1361MyThinkingHabits", limit: 5
    t.string "927695X86X1361TrustingRelationship", limit: 5
    t.string "927695X86X1361SafeLearningEnv", limit: 5
    t.string "927695X86X1361Commitment", limit: 5
    t.string "927695X86X1361Affirms", limit: 5
    t.string "927695X86X1361WillingToAcceptFeedb", limit: 5
    t.string "927695X86X1361esLearningPrStimulat", limit: 5
    t.string "927695X86X1361Encourages", limit: 5
    t.string "927695X86X1361StimulatesProfDevelo", limit: 5
    t.string "927695X86X1361StimulatesConstFeedb", limit: 5
    t.text "927695X87X1362"
    t.text "927695X87X1363"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_927695_12443"
  end

  create_table "lime_survey_927695_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "927695X83time"
    t.float "927695X83X1357time"
    t.float "927695X83X1358time"
    t.float "927695X83X1364time"
    t.float "927695X83X1365time"
    t.float "927695X83X1366time"
    t.float "927695X83X1367time"
    t.float "927695X84time"
    t.float "927695X84X1359time"
    t.float "927695X85time"
    t.float "927695X85X1360time"
    t.float "927695X86time"
    t.float "927695X86X1361time"
    t.float "927695X87time"
    t.float "927695X87X1362time"
    t.float "927695X87X1363time"
  end

  create_table "lime_survey_928898", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "928898X186X2371InstructorKnowledge", limit: 5
    t.string "928898X186X2371InstructorWellPrep", limit: 5
    t.string "928898X186X2371InstructorRate", limit: 5
    t.text "928898X186X2372"
    t.text "928898X186X2373"
    t.text "928898X186X2374"
    t.string "928898X186X2375", limit: 255
    t.string "928898X186X2376", limit: 255
    t.string "928898X186X2377", limit: 255
    t.string "928898X186X2378ClickerQ", limit: 5
    t.string "928898X186X2378Brief", limit: 5
    t.string "928898X186X2378Pair", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_928898_21326"
  end

  create_table "lime_survey_929272", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "929272X1008X12318", limit: 5
    t.text "929272X1009X12319"
    t.text "929272X1010X12323"
    t.text "929272X1011X12326"
    t.text "929272X1012X12330"
    t.text "929272X1013X12333"
    t.text "929272X1014X12338"
    t.text "929272X1015X12342"
    t.text "929272X1016X12345"
    t.text "929272X1017X12348"
    t.text "929272X1018X12351"
    t.text "929272X1019X12354"
    t.text "929272X1020X12357"
    t.text "929272X1021X12360"
    t.text "929272X1022X12364"
    t.text "929272X1023X12368"
    t.text "929272X1024X12372"
    t.text "929272X1025X12375"
    t.text "929272X1026X12378"
    t.text "929272X1027X12380"
    t.text "929272X1028X12382"
    t.text "929272X1029X12385"
    t.text "929272X1030X12387"
    t.text "929272X1031X12392"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_929272_24871"
  end

  create_table "lime_survey_931453", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "931453X74X1263InstructorKnowledge", limit: 5
    t.string "931453X74X1263InstructorWellPrep", limit: 5
    t.string "931453X74X1263InstructorRate", limit: 5
    t.text "931453X74X1264"
    t.text "931453X74X1265"
    t.text "931453X74X1269"
    t.string "931453X74X1266", limit: 255
    t.string "931453X74X1267", limit: 255
    t.string "931453X74X1268", limit: 255
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_931453_37424"
  end

  create_table "lime_survey_933729", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "933729X1155X14147SQ001", limit: 5
    t.string "933729X1155X13355SQ001", limit: 5
    t.string "933729X1155X13355SQ003", limit: 5
    t.string "933729X1155X13355SQ002", limit: 5
    t.string "933729X1156X13359SQ001", limit: 5
    t.string "933729X1156X13359SQ002", limit: 5
    t.string "933729X1156X13359SQ003", limit: 5
    t.string "933729X1156X13359SQ004", limit: 5
    t.string "933729X1156X13359SQ005", limit: 5
    t.string "933729X1156X13359SQ006", limit: 5
    t.string "933729X1156X13359SQ007", limit: 5
    t.string "933729X1157X13367SQ001", limit: 5
    t.text "933729X1158X13369"
    t.text "933729X1158X13370"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_933729_49728"
  end

  create_table "lime_survey_937831", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "937831X962X10595", limit: 5
    t.text "937831X962X10596"
    t.string "937831X959X10589Commit", limit: 5
    t.string "937831X959X10589Responsible", limit: 5
    t.string "937831X959X10589Inspire", limit: 5
    t.string "937831X959X10589Active", limit: 5
    t.string "937831X959X10589Honest", limit: 5
    t.string "937831X960X10590LearnAbout", limit: 5
    t.string "937831X960X10590ConveyAny", limit: 5
    t.string "937831X960X10590DevelopAShared", limit: 5
    t.string "937831X960X10590SpecificMeasurable", limit: 5
    t.string "937831X960X10590WorkWithYourStudent", limit: 5
    t.string "937831X960X10590OrganizeInterpret", limit: 5
    t.string "937831X960X10590MonitorYourProgress", limit: 5
    t.string "937831X960X10590IdentifyProblems", limit: 5
    t.string "937831X960X10590SolveProblems", limit: 5
    t.string "937831X960X10590Characterize", limit: 5
    t.text "937831X961X10591"
    t.text "937831X961X10592"
    t.text "937831X958X10588"
    t.text "937831X958X10594"
    t.text "937831X958X10593"
    t.text "937831X958X10597"
    t.text "937831X958X10598"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_937831_35363"
  end

  create_table "lime_survey_941869", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "941869X1220X13655SQ001", limit: 5
    t.string "941869X1220X13655SQ002", limit: 5
    t.string "941869X1220X13655SQ003", limit: 5
    t.string "941869X1220X13655SQ004", limit: 5
    t.text "941869X1220X13660"
    t.string "941869X1221X13656SQ001", limit: 5
    t.string "941869X1221X13656SQ002", limit: 5
    t.string "941869X1222X13657SQ001", limit: 5
    t.string "941869X1222X13657SQ002", limit: 5
    t.string "941869X1222X13657SQ003", limit: 5
    t.string "941869X1222X13657SQ004", limit: 5
    t.string "941869X1222X13657SQ005", limit: 5
    t.string "941869X1222X13657SQ006", limit: 5
    t.string "941869X1222X13657SQ007", limit: 5
    t.string "941869X1222X13657SQ008", limit: 5
    t.string "941869X1222X13657SQ009", limit: 5
    t.string "941869X1222X13657SQ010", limit: 5
    t.text "941869X1222X13661"
    t.string "941869X1223X13658SQ001", limit: 5
    t.text "941869X1224X13659"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_941869_46305"
  end

  create_table "lime_survey_942554", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "942554X1551X16874SQ001"
    t.text "942554X1551X16874SQ002"
    t.text "942554X1551X16874SQ004"
    t.text "942554X1551X16874SQ005"
    t.string "942554X1552X16878", limit: 5
    t.string "942554X1552X16875", limit: 5
    t.string "942554X1552X16877", limit: 5
    t.string "942554X1552X16876", limit: 5
    t.string "942554X1553X16879SQ001", limit: 5
    t.string "942554X1553X16879SQ002", limit: 5
    t.string "942554X1553X16879SQ003", limit: 5
    t.string "942554X1553X16879SQ004", limit: 5
    t.string "942554X1553X16879SQ005", limit: 5
    t.string "942554X1553X16879SQ006", limit: 5
    t.string "942554X1553X16879SQ007", limit: 5
    t.string "942554X1553X16879SQ008", limit: 5
    t.string "942554X1553X16879SQ009", limit: 5
    t.text "942554X1553X16880"
    t.text "942554X1554X16881"
    t.text "942554X1554X16882"
    t.string "942554X1555X16883", limit: 5
    t.index ["token"], name: "idx_survey_token_942554_20335"
  end

  create_table "lime_survey_945182", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.decimal "945182X738X8830", precision: 30, scale: 10
    t.text "945182X738X8840"
    t.string "945182X738X8844", limit: 5
    t.text "945182X738X8844other"
    t.string "945182X738X8854SQ001", limit: 5
    t.string "945182X738X8854SQ002", limit: 5
    t.string "945182X738X8854SQ003", limit: 5
    t.string "945182X738X8854SQ004", limit: 5
    t.string "945182X738X8854SQ005", limit: 5
    t.text "945182X738X8854other"
    t.string "945182X745X8900SQ001", limit: 5
    t.string "945182X745X8900SQ002", limit: 5
    t.string "945182X745X8900SQ003", limit: 5
    t.string "945182X757X8948SQ001", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_945182_16503"
  end

  create_table "lime_survey_949341", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "949341X597X7322"
    t.text "949341X597X7323"
    t.text "949341X597X7329"
    t.text "949341X597X7330"
    t.text "949341X597X7331"
    t.text "949341X597X7332"
    t.string "949341X598X7324Clarify", limit: 5
    t.string "949341X598X7324Represents", limit: 5
    t.string "949341X598X7324Responsible", limit: 5
    t.string "949341X598X7324Inspire", limit: 5
    t.string "949341X598X7324Determine", limit: 5
    t.string "949341X598X7324Active", limit: 5
    t.string "949341X598X7324Honest", limit: 5
    t.string "949341X599X7325SeekAndHear", limit: 5
    t.string "949341X599X7325LearnAbout", limit: 5
    t.string "949341X599X7325AcceptAny", limit: 5
    t.string "949341X599X7325DevelopAShared", limit: 5
    t.string "949341X599X7325SpecificMeasurable", limit: 5
    t.string "949341X599X7325WorkWithYourCoach", limit: 5
    t.string "949341X599X7325DetermineTimelines", limit: 5
    t.string "949341X599X7325MonitorYourProgress", limit: 5
    t.string "949341X599X7325IdentifyProblems", limit: 5
    t.string "949341X599X7325SolveProblems", limit: 5
    t.string "949341X599X7325Characterize", limit: 5
    t.string "949341X600X7326RecognizePersFeeling", limit: 5
    t.string "949341X600X7326AwareOfEmotions", limit: 5
    t.string "949341X600X7326InvestigateBehavior", limit: 5
    t.string "949341X600X7326PayAttention", limit: 5
    t.string "949341X600X7326MyThinkingHabits", limit: 5
    t.string "949341X600X7326TrustingRelationship", limit: 5
    t.string "949341X600X7326SafeLearningEnv", limit: 5
    t.string "949341X600X7326Commitment", limit: 5
    t.string "949341X600X7326Affirms", limit: 5
    t.string "949341X600X7326WillingToAcceptFeedb", limit: 5
    t.string "949341X600X7326esLearningPrStimulat", limit: 5
    t.string "949341X600X7326Encourages", limit: 5
    t.string "949341X600X7326StimulatesProfDevelo", limit: 5
    t.string "949341X600X7326StimulatesConstFeedb", limit: 5
    t.text "949341X601X7327"
    t.text "949341X601X7328"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_949341_25167"
  end

  create_table "lime_survey_949341_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "949341X597time"
    t.float "949341X597X7322time"
    t.float "949341X597X7323time"
    t.float "949341X597X7329time"
    t.float "949341X597X7330time"
    t.float "949341X597X7331time"
    t.float "949341X597X7332time"
    t.float "949341X598time"
    t.float "949341X598X7324time"
    t.float "949341X599time"
    t.float "949341X599X7325time"
    t.float "949341X600time"
    t.float "949341X600X7326time"
    t.float "949341X601time"
    t.float "949341X601X7327time"
    t.float "949341X601X7328time"
  end

  create_table "lime_survey_961225", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "961225X1407X15128StudentYear"
    t.text "961225X1407X15128StudentEmail"
    t.text "961225X1407X15128StudentName"
    t.text "961225X1407X15128CoachEmail"
    t.text "961225X1407X15128CoachName"
    t.text "961225X1406X15127"
    t.integer "961225X1406X15127_filecount"
    t.decimal "961225X1408X15129ICS1", precision: 30, scale: 10
    t.decimal "961225X1408X15129ICS2", precision: 30, scale: 10
    t.decimal "961225X1408X15129ICS3", precision: 30, scale: 10
    t.decimal "961225X1408X15129ICS4", precision: 30, scale: 10
    t.decimal "961225X1408X15129ICS5", precision: 30, scale: 10
    t.decimal "961225X1409X15130CIS1", precision: 30, scale: 10
    t.decimal "961225X1409X15130CIS2", precision: 30, scale: 10
    t.decimal "961225X1409X15130CIS3", precision: 30, scale: 10
    t.decimal "961225X1409X15130CIS4", precision: 30, scale: 10
    t.decimal "961225X1409X15130CIS5", precision: 30, scale: 10
    t.decimal "961225X1409X15130CIS6", precision: 30, scale: 10
    t.text "961225X1410X15131SEP1"
    t.text "961225X1410X15131SEP2"
    t.text "961225X1411X15132PEE1"
    t.text "961225X1411X15132PEE2"
    t.index ["token"], name: "idx_survey_token_961225_26190"
  end

  create_table "lime_survey_965969", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "965969X370X4127"
    t.text "965969X370X4128"
    t.text "965969X370X4134"
    t.text "965969X370X4135"
    t.text "965969X370X4136"
    t.text "965969X370X4137"
    t.string "965969X371X4129Clarify", limit: 5
    t.string "965969X371X4129Represents", limit: 5
    t.string "965969X371X4129Responsible", limit: 5
    t.string "965969X371X4129Inspire", limit: 5
    t.string "965969X371X4129Determine", limit: 5
    t.string "965969X371X4129Active", limit: 5
    t.string "965969X371X4129Honest", limit: 5
    t.string "965969X372X4130SeekAndHear", limit: 5
    t.string "965969X372X4130LearnAbout", limit: 5
    t.string "965969X372X4130AcceptAny", limit: 5
    t.string "965969X372X4130DevelopAShared", limit: 5
    t.string "965969X372X4130SpecificMeasurable", limit: 5
    t.string "965969X372X4130WorkWithYourCoach", limit: 5
    t.string "965969X372X4130DetermineTimelines", limit: 5
    t.string "965969X372X4130MonitorYourProgress", limit: 5
    t.string "965969X372X4130IdentifyProblems", limit: 5
    t.string "965969X372X4130SolveProblems", limit: 5
    t.string "965969X372X4130Characterize", limit: 5
    t.string "965969X373X4131RecognizePersFeeling", limit: 5
    t.string "965969X373X4131AwareOfEmotions", limit: 5
    t.string "965969X373X4131InvestigateBehavior", limit: 5
    t.string "965969X373X4131PayAttention", limit: 5
    t.string "965969X373X4131MyThinkingHabits", limit: 5
    t.string "965969X373X4131TrustingRelationship", limit: 5
    t.string "965969X373X4131SafeLearningEnv", limit: 5
    t.string "965969X373X4131Commitment", limit: 5
    t.string "965969X373X4131Affirms", limit: 5
    t.string "965969X373X4131WillingToAcceptFeedb", limit: 5
    t.string "965969X373X4131esLearningPrStimulat", limit: 5
    t.string "965969X373X4131Encourages", limit: 5
    t.string "965969X373X4131StimulatesProfDevelo", limit: 5
    t.string "965969X373X4131StimulatesConstFeedb", limit: 5
    t.text "965969X374X4132"
    t.text "965969X374X4133"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_965969_32496"
  end

  create_table "lime_survey_965969_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "965969X370time"
    t.float "965969X370X4127time"
    t.float "965969X370X4128time"
    t.float "965969X370X4134time"
    t.float "965969X370X4135time"
    t.float "965969X370X4136time"
    t.float "965969X370X4137time"
    t.float "965969X371time"
    t.float "965969X371X4129time"
    t.float "965969X372time"
    t.float "965969X372X4130time"
    t.float "965969X373time"
    t.float "965969X373X4131time"
    t.float "965969X374time"
    t.float "965969X374X4132time"
    t.float "965969X374X4133time"
  end

  create_table "lime_survey_966338", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "966338X1475X15865StudentYear"
    t.text "966338X1475X15865StudentEmail"
    t.text "966338X1475X15865StudentName"
    t.text "966338X1475X15865CoachEmail"
    t.text "966338X1475X15865CoachName"
    t.text "966338X1476X15866CourseYear"
    t.text "966338X1476X15866CourseName"
    t.decimal "966338X1476X15867Week1MCQ", precision: 30, scale: 10
    t.decimal "966338X1476X15867Week2MCQ", precision: 30, scale: 10
    t.decimal "966338X1476X15867Week3MCQ", precision: 30, scale: 10
    t.decimal "966338X1476X15867Week4MCQ", precision: 30, scale: 10
    t.decimal "966338X1476X15867Week5MCQ", precision: 30, scale: 10
    t.decimal "966338X1476X15867Week6MCQ", precision: 30, scale: 10
    t.decimal "966338X1476X15867Week7MCQ", precision: 30, scale: 10
    t.decimal "966338X1476X15867Week8MCQ", precision: 30, scale: 10
    t.decimal "966338X1476X15867Week9MCQAve", precision: 30, scale: 10
    t.text "966338X1476X15868DroppedQuiz"
    t.text "966338X1476X15868DroppedScore"
    t.decimal "966338X1476X15869CSA01", precision: 30, scale: 10
    t.decimal "966338X1476X15869CSA02", precision: 30, scale: 10
    t.decimal "966338X1476X15869CSA03", precision: 30, scale: 10
    t.decimal "966338X1476X15869CSL1", precision: 30, scale: 10
    t.decimal "966338X1476X15869HSS1", precision: 30, scale: 10
    t.decimal "966338X1476X15869HSS2Ave", precision: 30, scale: 10
    t.decimal "966338X1476X15875BSS1Anat1", precision: 30, scale: 10
    t.decimal "966338X1476X15875BSS2Histo1", precision: 30, scale: 10
    t.decimal "966338X1476X15875BSS4Histo2", precision: 30, scale: 10
    t.decimal "966338X1476X15875BSS3Anat2", precision: 30, scale: 10
    t.decimal "966338X1476X15875BSS5Histo3", precision: 30, scale: 10
    t.decimal "966338X1476X15875BSS6Anat3", precision: 30, scale: 10
    t.decimal "966338X1476X15875BSS7Ave", precision: 30, scale: 10
    t.decimal "966338X1476X15870FinalFund", precision: 30, scale: 10
    t.decimal "966338X1476X15871NBME", precision: 30, scale: 10
    t.decimal "966338X1476X15872CSAOSCE", precision: 30, scale: 10
    t.decimal "966338X1476X15872HSSInfor", precision: 30, scale: 10
    t.decimal "966338X1476X15872HSSInfAve", precision: 30, scale: 10
    t.decimal "966338X1476X15876BSSAnat", precision: 30, scale: 10
    t.decimal "966338X1476X15876BSSHisto", precision: 30, scale: 10
    t.decimal "966338X1476X15876BSSGenetics", precision: 30, scale: 10
    t.decimal "966338X1476X15876BSSCellBio", precision: 30, scale: 10
    t.decimal "966338X1476X15876BSSMicro", precision: 30, scale: 10
    t.decimal "966338X1476X15876BSSAve", precision: 30, scale: 10
    t.decimal "966338X1476X15873Component1", precision: 30, scale: 10
    t.decimal "966338X1476X15873Component2A", precision: 30, scale: 10
    t.decimal "966338X1476X15873Component2B", precision: 30, scale: 10
    t.decimal "966338X1476X15873Component3", precision: 30, scale: 10
    t.decimal "966338X1476X15873Component4", precision: 30, scale: 10
    t.decimal "966338X1476X15873Component5A", precision: 30, scale: 10
    t.decimal "966338X1476X15873Component5B", precision: 30, scale: 10
    t.text "966338X1476X15874"
    t.integer "966338X1476X15874_filecount"
    t.index ["token"], name: "idx_survey_token_966338_41780"
  end

  create_table "lime_survey_967443", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "seed", limit: 31
    t.text "967443X1472X15797StudentYear"
    t.text "967443X1472X15797StudentEmail"
    t.text "967443X1472X15797StudentName"
    t.text "967443X1472X15797CoachEmail"
    t.text "967443X1472X15797CoachName"
    t.decimal "967443X1473X15798Week1MCQ", precision: 30, scale: 10
    t.decimal "967443X1473X15798Week2MCQ", precision: 30, scale: 10
    t.decimal "967443X1473X15798Week3MCQ", precision: 30, scale: 10
    t.decimal "967443X1473X15798Week4MCQ", precision: 30, scale: 10
    t.decimal "967443X1473X15798Week5MCQ", precision: 30, scale: 10
    t.decimal "967443X1473X15798Week6MCQ", precision: 30, scale: 10
    t.decimal "967443X1473X15798Week7MCQ", precision: 30, scale: 10
    t.decimal "967443X1473X15798MCQAve", precision: 30, scale: 10
    t.text "967443X1473X15799DroppedQuiz"
    t.text "967443X1473X15799DroppedScore"
    t.decimal "967443X1473X15800CSA1", precision: 30, scale: 10
    t.decimal "967443X1473X15800HSS1Infor", precision: 30, scale: 10
    t.decimal "967443X1473X15800CSA2", precision: 30, scale: 10
    t.decimal "967443X1473X15800HSS2EPI", precision: 30, scale: 10
    t.decimal "967443X1473X15800HSS3EHR", precision: 30, scale: 10
    t.decimal "967443X1473X15800HSSAve", precision: 30, scale: 10
    t.decimal "967443X1473X15806BSS1AnatPB", precision: 30, scale: 10
    t.decimal "967443X1473X15806BSS2AnatPL1", precision: 30, scale: 10
    t.decimal "967443X1473X15806BSS3AnatPL21", precision: 30, scale: 10
    t.decimal "967443X1473X15806BBSS4Histo1", precision: 30, scale: 10
    t.decimal "967443X1473X15806BSS5AnatLab1", precision: 30, scale: 10
    t.decimal "967443X1473X15806BSS6AnatPL3", precision: 30, scale: 10
    t.decimal "967443X1473X15806BSS7AnatLab2", precision: 30, scale: 10
    t.decimal "967443X1473X15806BSS8Histo2", precision: 30, scale: 10
    t.decimal "967443X1473X15806BSSAvg", precision: 30, scale: 10
    t.decimal "967443X1473X15801FinalGastro", precision: 30, scale: 10
    t.decimal "967443X1473X15801FinalEndo", precision: 30, scale: 10
    t.decimal "967443X1473X15802NBME", precision: 30, scale: 10
    t.decimal "967443X1473X15803HSSOSCE", precision: 30, scale: 10
    t.decimal "967443X1473X15803HSSAvg", precision: 30, scale: 10
    t.decimal "967443X1473X15807BSSHisto", precision: 30, scale: 10
    t.decimal "967443X1473X15807BSSPath", precision: 30, scale: 10
    t.decimal "967443X1473X15807BSSMicro", precision: 30, scale: 10
    t.decimal "967443X1473X15807BSSMeta", precision: 30, scale: 10
    t.decimal "967443X1473X15807BSSAnat", precision: 30, scale: 10
    t.decimal "967443X1473X15807BSSAvg", precision: 30, scale: 10
    t.decimal "967443X1473X15804Component1", precision: 30, scale: 10
    t.decimal "967443X1473X15804Component2A", precision: 30, scale: 10
    t.decimal "967443X1473X15804Component2B", precision: 30, scale: 10
    t.decimal "967443X1473X15804Component3", precision: 30, scale: 10
    t.decimal "967443X1473X15804Component4", precision: 30, scale: 10
    t.decimal "967443X1473X15804Component5A", precision: 30, scale: 10
    t.decimal "967443X1473X15804Component5B", precision: 30, scale: 10
    t.text "967443X1473X15805"
    t.integer "967443X1473X15805_filecount"
    t.index ["token"], name: "idx_survey_token_967443_42100"
  end

  create_table "lime_survey_974861", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "974861X1066X12953"
    t.text "974861X1066X12956"
    t.string "974861X1069X12957", limit: 5
    t.text "974861X1069X12958"
    t.text "974861X1069X14494StudentYear"
    t.text "974861X1069X14494StudentEmail"
    t.text "974861X1069X14494StudentName"
    t.text "974861X1069X14494CoachEmail"
    t.text "974861X1069X14494CoachName"
    t.string "974861X1067X12954C1", limit: 5
    t.string "974861X1067X12954C2", limit: 5
    t.string "974861X1067X12954C3", limit: 5
    t.string "974861X1067X12954C4", limit: 5
    t.string "974861X1067X12954C5", limit: 5
    t.string "974861X1067X12954C6", limit: 5
    t.string "974861X1067X12954C7", limit: 5
    t.string "974861X1067X12954C8", limit: 5
    t.string "974861X1067X12954C9", limit: 5
    t.text "974861X1068X12955"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_974861_9965"
  end

  create_table "lime_survey_975859", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "975859X907X10302"
    t.text "975859X907X10303"
    t.text "975859X907X10309"
    t.text "975859X907X10310"
    t.text "975859X907X10311"
    t.text "975859X907X10312"
    t.string "975859X908X10304Represents", limit: 5
    t.string "975859X908X10304Responsible", limit: 5
    t.string "975859X908X10304Determine", limit: 5
    t.string "975859X908X10304Active", limit: 5
    t.string "975859X909X10305LearnAbout", limit: 5
    t.string "975859X909X10305AcceptAny", limit: 5
    t.string "975859X909X10305DevelopAShared", limit: 5
    t.string "975859X909X10305SpecificMeasurable", limit: 5
    t.string "975859X909X10305WorkWithYourCoach", limit: 5
    t.string "975859X910X10306RecognizePersFeeling", limit: 5
    t.string "975859X910X10306AwareOfEmotions", limit: 5
    t.string "975859X910X10306InvestigateBehavior", limit: 5
    t.string "975859X910X10306MyThinkingHabits", limit: 5
    t.string "975859X910X10306SafeLearningEnv", limit: 5
    t.string "975859X910X10306Commitment", limit: 5
    t.string "975859X910X10306Affirms", limit: 5
    t.string "975859X910X10306esLearningPrStimulat", limit: 5
    t.string "975859X910X10306Encourages", limit: 5
    t.text "975859X911X10307"
    t.text "975859X911X10308"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_975859_13829"
  end

  create_table "lime_survey_975859_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "975859X907time"
    t.float "975859X907X10302time"
    t.float "975859X907X10303time"
    t.float "975859X907X10309time"
    t.float "975859X907X10310time"
    t.float "975859X907X10311time"
    t.float "975859X907X10312time"
    t.float "975859X908time"
    t.float "975859X908X10304time"
    t.float "975859X909time"
    t.float "975859X909X10305time"
    t.float "975859X910time"
    t.float "975859X910X10306time"
    t.float "975859X911time"
    t.float "975859X911X10307time"
    t.float "975859X911X10308time"
  end

  create_table "lime_survey_976265", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "976265X514X5946StudentYear"
    t.text "976265X514X5946StudentEmail"
    t.text "976265X514X5946StudentName"
    t.text "976265X514X5946CoachEmail"
    t.text "976265X514X5946CoachName"
    t.text "976265X515X5947CourseYear"
    t.text "976265X515X5947CourseName"
    t.decimal "976265X515X5948Week1MCQ", precision: 30, scale: 10
    t.decimal "976265X515X5948Week2MCQ", precision: 30, scale: 10
    t.decimal "976265X515X5948Week3MCQ", precision: 30, scale: 10
    t.decimal "976265X515X5948Week5MCQ", precision: 30, scale: 10
    t.decimal "976265X515X5948Week6MCQ", precision: 30, scale: 10
    t.decimal "976265X515X5948Week7MCQ", precision: 30, scale: 10
    t.decimal "976265X515X5948Week8MCQ", precision: 30, scale: 10
    t.text "976265X515X5949DroppedQuiz"
    t.text "976265X515X5949DroppedScore"
    t.decimal "976265X515X5950CSA1", precision: 30, scale: 10
    t.decimal "976265X515X5950CSA2", precision: 30, scale: 10
    t.decimal "976265X515X5950CSA3", precision: 30, scale: 10
    t.decimal "976265X515X5950CSA4", precision: 30, scale: 10
    t.decimal "976265X515X5950CSA5", precision: 30, scale: 10
    t.decimal "976265X515X5950CSA6", precision: 30, scale: 10
    t.decimal "976265X515X5950CSA7", precision: 30, scale: 10
    t.decimal "976265X515X5950CSA8", precision: 30, scale: 10
    t.decimal "976265X515X5951FinalBlock1", precision: 30, scale: 10
    t.decimal "976265X515X5951FinalBlock2", precision: 30, scale: 10
    t.decimal "976265X515X5952", precision: 30, scale: 10
    t.decimal "976265X515X5956OSCE", precision: 30, scale: 10
    t.decimal "976265X515X5956Anatomy", precision: 30, scale: 10
    t.decimal "976265X515X5956Histology", precision: 30, scale: 10
    t.decimal "976265X515X5954Component1", precision: 30, scale: 10
    t.decimal "976265X515X5954Component2", precision: 30, scale: 10
    t.decimal "976265X515X5954Component3", precision: 30, scale: 10
    t.decimal "976265X515X5954Component4", precision: 30, scale: 10
    t.decimal "976265X515X5954Component5", precision: 30, scale: 10
    t.text "976265X515X5955"
    t.integer "976265X515X5955_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_976265_28151"
  end

  create_table "lime_survey_977261", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.string "977261X386X4223", limit: 5
    t.text "977261X386X4224"
    t.string "977261X382X4216Clarify", limit: 5
    t.string "977261X382X4216Represents", limit: 5
    t.string "977261X382X4216Responsible", limit: 5
    t.string "977261X382X4216Inspire", limit: 5
    t.string "977261X382X4216Determine", limit: 5
    t.string "977261X382X4216Active", limit: 5
    t.string "977261X382X4216Honest", limit: 5
    t.string "977261X383X4217SeekAndHear", limit: 5
    t.string "977261X383X4217LearnAbout", limit: 5
    t.string "977261X383X4217ConveyAny", limit: 5
    t.string "977261X383X4217DevelopAShared", limit: 5
    t.string "977261X383X4217SpecificMeasurable", limit: 5
    t.string "977261X383X4217WorkWithYourStudent", limit: 5
    t.string "977261X383X4217OrganizeInterpret", limit: 5
    t.string "977261X383X4217DetermineTimelines", limit: 5
    t.string "977261X383X4217MonitorYourProgress", limit: 5
    t.string "977261X383X4217IdentifyProblems", limit: 5
    t.string "977261X383X4217SolveProblems", limit: 5
    t.string "977261X383X4217Characterize", limit: 5
    t.text "977261X385X4219"
    t.text "977261X385X4220"
    t.text "977261X381X4215"
    t.text "977261X381X4222"
    t.text "977261X381X4221"
    t.text "977261X381X4225"
    t.text "977261X381X4226"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_977261_28361"
  end

  create_table "lime_survey_979663", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "979663X297X3589StudentYear"
    t.text "979663X297X3589StudentEmail"
    t.text "979663X297X3589StudentName"
    t.text "979663X297X3589CoachEmail"
    t.text "979663X297X3589CoachName"
    t.text "979663X302X3594PreceptorName"
    t.text "979663X302X3594SubmitDate"
    t.text "979663X302X3594Grade"
    t.text "979663X302X3594Term"
    t.string "979663X298X3590SBP1", limit: 5
    t.string "979663X298X3590SBP2", limit: 5
    t.string "979663X298X3590SBP3", limit: 5
    t.string "979663X298X3590SBP4", limit: 5
    t.string "979663X299X3591PBL1", limit: 5
    t.string "979663X299X3591PBL2", limit: 5
    t.string "979663X299X3591PBL3", limit: 5
    t.string "979663X299X3591PBL4", limit: 5
    t.string "979663X300X3592PROF1", limit: 5
    t.string "979663X300X3592PROF2", limit: 5
    t.string "979663X300X3592PROF3", limit: 5
    t.string "979663X300X3592PROF4", limit: 5
    t.string "979663X301X3593ICS1", limit: 5
    t.string "979663X301X3593ICS2", limit: 5
    t.string "979663X301X3593ICS3", limit: 5
    t.string "979663X301X3593ICS4", limit: 5
    t.text "979663X303X3595"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_979663_37184"
  end

  create_table "lime_survey_982113", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "982113X305X3621StudentYear"
    t.text "982113X305X3621StudentEmail"
    t.text "982113X305X3621StudentName"
    t.text "982113X305X3621CoachEmail"
    t.text "982113X305X3621CoachName"
    t.text "982113X319X3719Comp1"
    t.text "982113X319X3719Comp2"
    t.text "982113X319X3719Comp3"
    t.text "982113X319X3719OverallGr"
    t.text "982113X400X4353Level1"
    t.text "982113X400X4353Level2"
    t.text "982113X400X4353Level3"
    t.text "982113X400X4353Total"
    t.text "982113X400X4354PPPD7"
    t.text "982113X400X4354PPPD9"
    t.text "982113X400X4354PPPD10"
    t.text "982113X400X4355PPPD9"
    t.text "982113X400X4356PCP2"
    t.text "982113X400X4356PCP6"
    t.text "982113X400X4356MK1"
    t.text "982113X400X4356MK2"
    t.text "982113X400X4356PBLI1"
    t.text "982113X400X4356PBLI4"
    t.text "982113X400X4356PBLI8"
    t.text "982113X400X4356ICS1"
    t.text "982113X400X4356ICS5"
    t.text "982113X400X4356ICS6"
    t.text "982113X400X4356ICS7"
    t.text "982113X400X4356PPPD3"
    t.text "982113X400X4356PPPD4"
    t.text "982113X400X4356PPPD7"
    t.text "982113X400X4356PPPD9"
    t.text "982113X400X4356PPPD10"
    t.text "982113X400X4356PPPD11"
    t.text "982113X400X4356SPIC1"
    t.text "982113X400X4356SPIC3"
    t.text "982113X400X4356SPIC4"
    t.text "982113X400X4356SPIC5"
    t.text "982113X306X3627"
    t.integer "982113X306X3627_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_982113_4688"
  end

  create_table "lime_survey_983399", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.string "983399X1186X13505SQ001", limit: 5
    t.string "983399X1186X13505SQ004", limit: 5
    t.string "983399X1186X13505SQ003", limit: 5
    t.string "983399X1186X13505SQ002", limit: 5
    t.text "983399X1186X13510"
    t.string "983399X1187X13506SQ001", limit: 5
    t.string "983399X1187X13506SQ002", limit: 5
    t.string "983399X1187X13506SQ003", limit: 5
    t.string "983399X1187X13506SQ004", limit: 5
    t.text "983399X1187X13511"
    t.string "983399X1188X13507SQ001", limit: 5
    t.string "983399X1188X13507SQ002", limit: 5
    t.text "983399X1188X13512"
    t.string "983399X1188X14120SQ001", limit: 5
    t.text "983399X1189X13508"
    t.text "983399X1189X13509"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_983399_38373"
  end

  create_table "lime_survey_987322", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "987322X414X4482"
    t.string "987322X412X4484", limit: 5
    t.text "987322X412X4484other"
    t.string "987322X412X4485", limit: 5
    t.text "987322X412X4485other"
    t.text "987322X412X4476"
    t.text "987322X412X4475"
    t.text "987322X412X4477"
    t.string "987322X412X4478", limit: 1
    t.text "987322X412X4479"
    t.text "987322X412X4486"
    t.text "987322X412X4480"
    t.string "987322X413X4481SQ001", limit: 5
    t.string "987322X413X4481SQ002", limit: 5
    t.string "987322X413X4481SQ003", limit: 5
    t.string "987322X413X4481SQ004", limit: 5
    t.string "987322X413X4481SQ005", limit: 5
    t.string "987322X413X4481SQ006", limit: 5
    t.string "987322X413X4481SQ007", limit: 5
    t.string "987322X413X4481SQ008", limit: 5
    t.string "987322X413X4481SQ009", limit: 5
    t.string "987322X413X4481SQ010", limit: 5
    t.string "987322X413X4481SQ011", limit: 5
    t.text "987322X415X4483StudentYear"
    t.text "987322X415X4483StudentEmail"
    t.text "987322X415X4483StudentName"
    t.text "987322X415X4483CoachEmail"
    t.text "987322X415X4483CoachName"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_987322_23638"
  end

  create_table "lime_survey_987322_timings", id: :integer, default: nil, force: :cascade do |t|
    t.float "interviewtime"
    t.float "987322X414time"
    t.float "987322X414X4482time"
    t.float "987322X412time"
    t.float "987322X412X4484time"
    t.float "987322X412X4485time"
    t.float "987322X412X4476time"
    t.float "987322X412X4475time"
    t.float "987322X412X4477time"
    t.float "987322X412X4478time"
    t.float "987322X412X4479time"
    t.float "987322X412X4486time"
    t.float "987322X412X4480time"
    t.float "987322X413time"
    t.float "987322X413X4481time"
    t.float "987322X415time"
    t.float "987322X415X4483time"
  end

  create_table "lime_survey_988354", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "988354X895X10161"
    t.text "988354X895X10164"
    t.string "988354X898X10165", limit: 5
    t.text "988354X898X10166"
    t.text "988354X898X10160StudentYear"
    t.text "988354X898X10160StudentEmail"
    t.text "988354X898X10160StudentName"
    t.text "988354X898X10160CoachEmail"
    t.text "988354X898X10160CoachName"
    t.string "988354X896X10162C1", limit: 5
    t.string "988354X896X10162C2", limit: 5
    t.string "988354X896X10162C3", limit: 5
    t.string "988354X896X10162C4", limit: 5
    t.string "988354X896X10162C5", limit: 5
    t.string "988354X896X10162C6", limit: 5
    t.string "988354X896X10162C7", limit: 5
    t.string "988354X896X10162C8", limit: 5
    t.string "988354X896X10162C9", limit: 5
    t.text "988354X897X10163"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_988354_24059"
  end

  create_table "lime_survey_991545", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.datetime "startdate", precision: nil, null: false
    t.datetime "datestamp", precision: nil, null: false
    t.text "991545X1324X14316StudentEmail"
    t.text "991545X1324X14316StudentName"
    t.text "991545X1324X14316StudentID"
    t.text "991545X1324X14316CoachEmail"
    t.text "991545X1324X14316CoachName"
    t.string "991545X1325X14310RateYourHealth4Weeks", limit: 5
    t.string "991545X1325X14311ProblemsWalking", limit: 5
    t.string "991545X1325X14311DifficultDailyWork", limit: 5
    t.string "991545X1325X14311EmotionsProb", limit: 5
    t.string "991545X1325X14311PersonalProbUsualWor", limit: 5
    t.string "991545X1325X14312BodilyPain", limit: 5
    t.string "991545X1325X14313Past4WeekEnergyLevel", limit: 5
    t.string "991545X1325X14314BotheredEmotionalPro", limit: 5
    t.string "991545X1326X14315BennUpset", limit: 5
    t.string "991545X1326X14315UnableControl", limit: 5
    t.string "991545X1326X14315FeltNervous", limit: 5
    t.string "991545X1326X14315FeltConfident", limit: 5
    t.string "991545X1326X14315FeltGoingYourWay", limit: 5
    t.string "991545X1326X14315CouldNotCope", limit: 5
    t.string "991545X1326X14315AbleToControl", limit: 5
    t.string "991545X1326X14315OnTopOfThings", limit: 5
    t.string "991545X1326X14315BeenAngered", limit: 5
    t.string "991545X1326X14315PilingUpHigh", limit: 5
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_991545_38234"
  end

  create_table "lime_survey_996971", id: :serial, force: :cascade do |t|
    t.string "token", limit: 36
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "996971X331X3847StudentYear"
    t.text "996971X331X3847StudentEmail"
    t.text "996971X331X3847StudentName"
    t.text "996971X331X3847CoachEmail"
    t.text "996971X331X3847CoachName"
    t.text "996971X330X3845InterComp1"
    t.text "996971X330X3845InterComp2"
    t.text "996971X330X3845InterComp3"
    t.text "996971X330X3845InterComp4"
    t.text "996971X330X3845InterFinal"
    t.decimal "996971X330X3846", precision: 30, scale: 10
    t.text "996971X332X3848Level1"
    t.text "996971X332X3848Level2"
    t.text "996971X332X3848Level3"
    t.text "996971X332X3848Total"
    t.text "996971X332X3849ICS3"
    t.text "996971X332X3850SBPIC4"
    t.text "996971X332X3851MK1"
    t.text "996971X332X3851MK2"
    t.text "996971X332X3851MK3"
    t.text "996971X332X3851MK5"
    t.text "996971X332X3851PBLI1"
    t.text "996971X332X3851PBLI2"
    t.text "996971X332X3851PBLI4"
    t.text "996971X332X3851PPPD7"
    t.text "996971X332X3851PPPD8"
    t.text "996971X332X3851SBPIC2"
    t.text "996971X332X3851SBPIC4"
    t.text "996971X332X3851ICS3"
    t.text "996971X333X3852"
    t.integer "996971X333X3852_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_996971_17717"
  end

  create_table "lime_survey_998484", id: :serial, force: :cascade do |t|
    t.string "token", limit: 35
    t.datetime "submitdate", precision: nil
    t.integer "lastpage"
    t.string "startlanguage", limit: 20, null: false
    t.text "998484X672X8168StudentYear"
    t.text "998484X672X8168StudentEmail"
    t.text "998484X672X8168StudentName"
    t.text "998484X672X8168CoachEmail"
    t.text "998484X672X8168CoachName"
    t.text "998484X673X8169CourseYear"
    t.text "998484X673X8169CourseName"
    t.decimal "998484X673X8170Week1MCQ", precision: 30, scale: 10
    t.decimal "998484X673X8170Week2MCQ", precision: 30, scale: 10
    t.decimal "998484X673X8170Week3MCQ", precision: 30, scale: 10
    t.decimal "998484X673X8170Week4MCQ", precision: 30, scale: 10
    t.decimal "998484X673X8170Week5MCQ", precision: 30, scale: 10
    t.text "998484X673X8171DroppedQuiz"
    t.text "998484X673X8171DroppedScore"
    t.decimal "998484X673X8177CSA1", precision: 30, scale: 10
    t.decimal "998484X673X8177CSA2", precision: 30, scale: 10
    t.decimal "998484X673X8177CSA3", precision: 30, scale: 10
    t.decimal "998484X673X8177CSA4", precision: 30, scale: 10
    t.decimal "998484X673X8177CSA5", precision: 30, scale: 10
    t.decimal "998484X673X8177CSA6", precision: 30, scale: 10
    t.decimal "998484X673X8177CSA7", precision: 30, scale: 10
    t.decimal "998484X673X8177CSA8", precision: 30, scale: 10
    t.decimal "998484X673X8177CSA9", precision: 30, scale: 10
    t.decimal "998484X673X8177CSAA", precision: 30, scale: 10
    t.decimal "998484X673X8172FinalBlock", precision: 30, scale: 10
    t.decimal "998484X673X8173", precision: 30, scale: 10
    t.decimal "998484X673X8174OSCE", precision: 30, scale: 10
    t.decimal "998484X673X8174Histo", precision: 30, scale: 10
    t.decimal "998484X673X8174VisualDiag", precision: 30, scale: 10
    t.decimal "998484X673X8174CellBio", precision: 30, scale: 10
    t.decimal "998484X673X8174Anatomy", precision: 30, scale: 10
    t.decimal "998484X673X8175Component1", precision: 30, scale: 10
    t.decimal "998484X673X8175Component2", precision: 30, scale: 10
    t.decimal "998484X673X8175Component3", precision: 30, scale: 10
    t.decimal "998484X673X8175Component4", precision: 30, scale: 10
    t.decimal "998484X673X8175Component5", precision: 30, scale: 10
    t.text "998484X673X8176"
    t.integer "998484X673X8176_filecount"
    t.string "seed", limit: 31
    t.index ["token"], name: "idx_survey_token_998484_656"
  end

  create_table "lime_survey_links", primary_key: ["participant_id", "token_id", "survey_id"], force: :cascade do |t|
    t.string "participant_id", limit: 50, null: false
    t.integer "token_id", null: false
    t.integer "survey_id", null: false
    t.datetime "date_created", precision: nil
    t.datetime "date_invited", precision: nil
    t.datetime "date_completed", precision: nil
  end

  create_table "lime_survey_url_parameters", id: :serial, force: :cascade do |t|
    t.integer "sid", null: false
    t.string "parameter", limit: 50, null: false
    t.integer "targetqid"
    t.integer "targetsqid"
  end

  create_table "lime_surveymenu", id: :serial, force: :cascade do |t|
    t.integer "parent_id"
    t.integer "survey_id"
    t.integer "user_id"
    t.string "name", limit: 128
    t.integer "ordering", default: 0
    t.integer "level", default: 0
    t.string "title", limit: 168, default: "", null: false
    t.string "position", limit: 192, default: "side", null: false
    t.text "description"
    t.boolean "active", default: false, null: false
    t.boolean "showincollapse", default: false
    t.datetime "changed_at", precision: nil
    t.integer "changed_by", default: 0, null: false
    t.datetime "created_at", precision: nil
    t.integer "created_by", default: 0, null: false
    t.index ["name"], name: "lime_surveymenu_name", unique: true
    t.index ["title"], name: "lime_idx2_surveymenu"
  end

  create_table "lime_surveymenu_entries", id: :serial, force: :cascade do |t|
    t.integer "menu_id"
    t.integer "user_id"
    t.integer "ordering", default: 0
    t.string "name", limit: 168, default: ""
    t.string "title", limit: 168, default: "", null: false
    t.string "menu_title", limit: 168, default: "", null: false
    t.text "menu_description"
    t.string "menu_icon", limit: 192, default: "", null: false
    t.string "menu_icon_type", limit: 192, default: "", null: false
    t.string "menu_class", limit: 192, default: "", null: false
    t.string "menu_link", limit: 192, default: "", null: false
    t.string "action", limit: 192, default: "", null: false
    t.string "template", limit: 192, default: "", null: false
    t.string "partial", limit: 192, default: "", null: false
    t.string "classes", limit: 192, default: "", null: false
    t.string "permission", limit: 192, default: "", null: false
    t.string "permission_grade", limit: 192
    t.text "data"
    t.string "getdatamethod", limit: 192, default: "", null: false
    t.string "language", limit: 32, default: "en-GB", null: false
    t.boolean "active", default: false, null: false
    t.boolean "showincollapse", default: false
    t.datetime "changed_at", precision: nil
    t.integer "changed_by", default: 0, null: false
    t.datetime "created_at", precision: nil
    t.integer "created_by", default: 0, null: false
    t.index ["menu_id"], name: "lime_idx1_surveymenu_entries"
    t.index ["menu_title"], name: "lime_idx5_surveymenu_entries"
    t.index ["name"], name: "lime_surveymenu_entries_name", unique: true
  end

  create_table "lime_surveys", primary_key: "sid", id: :integer, default: nil, force: :cascade do |t|
    t.integer "owner_id", null: false
    t.string "admin", limit: 50
    t.string "active", limit: 1, default: "N", null: false
    t.datetime "expires", precision: nil
    t.datetime "startdate", precision: nil
    t.string "adminemail", limit: 254
    t.string "anonymized", limit: 1, default: "N", null: false
    t.string "faxto", limit: 20
    t.string "format", limit: 1
    t.string "savetimings", limit: 1, default: "N", null: false
    t.string "template", limit: 100, default: "default"
    t.string "language", limit: 50
    t.text "additional_languages"
    t.string "datestamp", limit: 1, default: "N", null: false
    t.string "usecookie", limit: 1, default: "N", null: false
    t.string "allowregister", limit: 1, default: "N", null: false
    t.string "allowsave", limit: 1, default: "Y", null: false
    t.integer "autonumber_start", default: 0, null: false
    t.string "autoredirect", limit: 1, default: "N", null: false
    t.string "allowprev", limit: 1, default: "N", null: false
    t.string "printanswers", limit: 1, default: "N", null: false
    t.string "ipaddr", limit: 1, default: "N", null: false
    t.string "refurl", limit: 1, default: "N", null: false
    t.datetime "datecreated", precision: nil
    t.string "publicstatistics", limit: 1, default: "N", null: false
    t.string "publicgraphs", limit: 1, default: "N", null: false
    t.string "listpublic", limit: 1, default: "N", null: false
    t.string "htmlemail", limit: 1, default: "Y", null: false
    t.string "sendconfirmation", limit: 1, default: "Y", null: false
    t.string "tokenanswerspersistence", limit: 1, default: "N", null: false
    t.string "assessments", limit: 1, default: "N", null: false
    t.string "usecaptcha", limit: 1, default: "N", null: false
    t.string "usetokens", limit: 1, default: "N", null: false
    t.string "bounce_email", limit: 254
    t.text "attributedescriptions"
    t.text "emailresponseto"
    t.text "emailnotificationto"
    t.integer "tokenlength", default: 15, null: false
    t.string "showxquestions", limit: 1, default: "Y"
    t.string "showgroupinfo", limit: 1, default: "B"
    t.string "shownoanswer", limit: 1, default: "Y"
    t.string "showqnumcode", limit: 1, default: "X"
    t.integer "bouncetime"
    t.string "bounceprocessing", limit: 1, default: "N"
    t.string "bounceaccounttype", limit: 4
    t.string "bounceaccounthost", limit: 200
    t.text "bounceaccountpass"
    t.string "bounceaccountencryption", limit: 3
    t.string "bounceaccountuser", limit: 200
    t.string "showwelcome", limit: 1, default: "Y"
    t.string "showprogress", limit: 1, default: "Y"
    t.integer "questionindex", default: 0, null: false
    t.integer "navigationdelay", default: 0, null: false
    t.string "nokeyboard", limit: 1, default: "N"
    t.string "alloweditaftercompletion", limit: 1, default: "N"
    t.string "googleanalyticsstyle", limit: 1
    t.string "googleanalyticsapikey", limit: 25
    t.integer "gsid", default: 1
    t.integer "showsurveypolicynotice", default: 0
    t.text "tokenencryptionoptions"
    t.string "ipanonymize", limit: 1, default: "N", null: false
  end

  create_table "lime_surveys_groups", primary_key: "gsid", id: :serial, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.string "title", limit: 100
    t.text "description"
    t.integer "sortorder", null: false
    t.integer "owner_id"
    t.integer "parent_id"
    t.datetime "created", precision: nil
    t.datetime "modified", precision: nil
    t.integer "created_by", null: false
    t.string "template", limit: 128, default: "default"
    t.boolean "alwaysavailable"
  end

  create_table "lime_surveys_groupsettings", primary_key: "gsid", id: :integer, default: nil, force: :cascade do |t|
    t.integer "owner_id"
    t.string "admin", limit: 50
    t.string "adminemail", limit: 254
    t.string "anonymized", limit: 1, default: "N", null: false
    t.string "format", limit: 1
    t.string "savetimings", limit: 1, default: "N", null: false
    t.string "template", limit: 100, default: "default"
    t.string "datestamp", limit: 1, default: "N", null: false
    t.string "usecookie", limit: 1, default: "N", null: false
    t.string "allowregister", limit: 1, default: "N", null: false
    t.string "allowsave", limit: 1, default: "Y", null: false
    t.integer "autonumber_start", default: 0
    t.string "autoredirect", limit: 1, default: "N", null: false
    t.string "allowprev", limit: 1, default: "N", null: false
    t.string "printanswers", limit: 1, default: "N", null: false
    t.string "ipaddr", limit: 1, default: "N", null: false
    t.string "refurl", limit: 1, default: "N", null: false
    t.integer "showsurveypolicynotice", default: 0
    t.string "publicstatistics", limit: 1, default: "N", null: false
    t.string "publicgraphs", limit: 1, default: "N", null: false
    t.string "listpublic", limit: 1, default: "N", null: false
    t.string "htmlemail", limit: 1, default: "Y", null: false
    t.string "sendconfirmation", limit: 1, default: "Y", null: false
    t.string "tokenanswerspersistence", limit: 1, default: "N", null: false
    t.string "assessments", limit: 1, default: "N", null: false
    t.string "usecaptcha", limit: 1, default: "N", null: false
    t.string "bounce_email", limit: 254
    t.text "attributedescriptions"
    t.text "emailresponseto"
    t.text "emailnotificationto"
    t.integer "tokenlength", default: 15
    t.string "showxquestions", limit: 1, default: "Y"
    t.string "showgroupinfo", limit: 1, default: "B"
    t.string "shownoanswer", limit: 1, default: "Y"
    t.string "showqnumcode", limit: 1, default: "X"
    t.string "showwelcome", limit: 1, default: "Y"
    t.string "showprogress", limit: 1, default: "Y"
    t.integer "questionindex", default: 0
    t.integer "navigationdelay", default: 0
    t.string "nokeyboard", limit: 1, default: "N"
    t.string "alloweditaftercompletion", limit: 1, default: "N"
    t.string "ipanonymize", limit: 1, default: "N", null: false
  end

  create_table "lime_surveys_languagesettings", primary_key: ["surveyls_survey_id", "surveyls_language"], force: :cascade do |t|
    t.integer "surveyls_survey_id", null: false
    t.string "surveyls_language", limit: 45, default: "en", null: false
    t.string "surveyls_title", limit: 200, null: false
    t.text "surveyls_description"
    t.text "surveyls_welcometext"
    t.text "surveyls_endtext"
    t.text "surveyls_url"
    t.string "surveyls_urldescription", limit: 255
    t.string "surveyls_email_invite_subj", limit: 255
    t.text "surveyls_email_invite"
    t.string "surveyls_email_remind_subj", limit: 255
    t.text "surveyls_email_remind"
    t.string "surveyls_email_register_subj", limit: 255
    t.text "surveyls_email_register"
    t.string "surveyls_email_confirm_subj", limit: 255
    t.text "surveyls_email_confirm"
    t.integer "surveyls_dateformat", default: 1, null: false
    t.text "surveyls_attributecaptions"
    t.string "email_admin_notification_subj", limit: 255
    t.text "email_admin_notification"
    t.string "email_admin_responses_subj", limit: 255
    t.text "email_admin_responses"
    t.integer "surveyls_numberformat", default: 0, null: false
    t.text "attachments"
    t.text "surveyls_policy_notice"
    t.text "surveyls_policy_error"
    t.string "surveyls_policy_notice_label", limit: 192
  end

  create_table "lime_template_configuration", id: :serial, force: :cascade do |t|
    t.string "template_name", limit: 150, null: false
    t.integer "sid"
    t.integer "gsid"
    t.integer "uid"
    t.text "files_css"
    t.text "files_js"
    t.text "files_print_css"
    t.text "options"
    t.string "cssframework_name", limit: 45
    t.text "cssframework_css"
    t.text "cssframework_js"
    t.text "packages_to_load"
    t.text "packages_ltr"
    t.text "packages_rtl"
    t.index ["gsid"], name: "lime_idx3_template_configuration"
    t.index ["sid"], name: "lime_idx2_template_configuration"
    t.index ["template_name"], name: "lime_idx1_template_configuration"
    t.index ["uid"], name: "lime_idx4_template_configuration"
  end

  create_table "lime_templates", id: :serial, force: :cascade do |t|
    t.string "name", limit: 150, null: false
    t.string "folder", limit: 45
    t.string "title", limit: 100, null: false
    t.datetime "creation_date", precision: nil
    t.string "author", limit: 150
    t.string "author_email", limit: 255
    t.string "author_url", limit: 255
    t.text "copyright"
    t.text "license"
    t.string "version", limit: 45
    t.string "api_version", limit: 45, null: false
    t.string "view_folder", limit: 45, null: false
    t.string "files_folder", limit: 45, null: false
    t.text "description"
    t.datetime "last_update", precision: nil
    t.integer "owner_id"
    t.string "extends", limit: 150
    t.index ["extends"], name: "lime_idx4_templates"
    t.index ["name"], name: "lime_idx1_templates"
    t.index ["owner_id"], name: "lime_idx3_templates"
    t.index ["title"], name: "lime_idx2_templates"
  end

  create_table "lime_tokens_115743", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email"
    t.index ["email"], name: "idx_email_kens_115743_41355"
    t.index ["token"], name: "idx_token_token_115743_40921"
  end

  create_table "lime_tokens_117798", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.index ["email"], name: "idx_email_kens_117798_41714"
    t.index ["token"], name: "idx_token_token_117798_10364"
  end

  create_table "lime_tokens_127551", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.string "attribute_6", limit: 255
    t.string "attribute_7", limit: 255
    t.string "attribute_8", limit: 255
    t.string "attribute_9", limit: 255
    t.string "attribute_10", limit: 255
    t.string "attribute_11", limit: 255
    t.index ["email"], name: "idx_email_kens_127551_22743"
    t.index ["token"], name: "idx_token_token_127551_11160"
  end

  create_table "lime_tokens_128963", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_128963_23818"
    t.index ["token"], name: "idx_token_token_128963_12689"
  end

  create_table "lime_tokens_133379", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_133379_25516"
    t.index ["token"], name: "idx_token_token_133379_34041"
  end

  create_table "lime_tokens_135694", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.text "attribute_11"
    t.text "attribute_12"
    t.index ["email"], name: "idx_email_kens_135694_40034"
    t.index ["token"], name: "idx_token_token_135694_39641"
  end

  create_table "lime_tokens_135887", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.text "attribute_11"
    t.index ["email"], name: "idx_email_kens_135887_6139"
    t.index ["token"], name: "idx_token_token_135887_41412"
  end

  create_table "lime_tokens_137847", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.string "attribute_6", limit: 255
    t.string "attribute_7", limit: 255
    t.string "attribute_8", limit: 255
    t.string "attribute_9", limit: 255
    t.string "attribute_10", limit: 255
    t.string "attribute_11", limit: 255
    t.string "attribute_12", limit: 255
    t.string "attribute_13", limit: 255
    t.string "attribute_14", limit: 255
    t.string "attribute_15", limit: 255
    t.string "attribute_16", limit: 255
    t.index ["email"], name: "idx_email_kens_137847_5818"
    t.index ["token"], name: "idx_token_token_137847_38280"
  end

  create_table "lime_tokens_144697", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.string "attribute_6", limit: 255
    t.string "attribute_7", limit: 255
    t.index ["email"], name: "idx_email_kens_144697_6914"
    t.index ["token"], name: "idx_token_token_144697_19725"
  end

  create_table "lime_tokens_146548", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_146548_35672"
    t.index ["token"], name: "idx_token_token_146548_20294"
  end

  create_table "lime_tokens_147694", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_147694_48686"
    t.index ["token"], name: "idx_token_token_147694_25420"
  end

  create_table "lime_tokens_153794", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_153794_11111"
    t.index ["token"], name: "idx_token_token_153794_47851"
  end

  create_table "lime_tokens_154741", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_154741_4446"
    t.index ["token"], name: "idx_token_token_154741_35709"
  end

  create_table "lime_tokens_155954", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_155954_9348"
    t.index ["token"], name: "idx_token_token_155954_27556"
  end

  create_table "lime_tokens_156227", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_156227_6095"
    t.index ["token"], name: "idx_token_token_156227_2089"
  end

  create_table "lime_tokens_166929", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.index ["email"], name: "idx_email_kens_166929_42137"
    t.index ["token"], name: "idx_token_token_166929_7605"
  end

  create_table "lime_tokens_171898", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_171898_22780"
    t.index ["token"], name: "idx_token_token_171898_41202"
  end

  create_table "lime_tokens_174335", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.text "attribute_11"
    t.index ["email"], name: "idx_email_kens_174335_38904"
    t.index ["token"], name: "idx_token_token_174335_1664"
  end

  create_table "lime_tokens_174547", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.index ["email"], name: "idx_email_kens_174547_48286"
    t.index ["token"], name: "idx_token_token_174547_42762"
  end

  create_table "lime_tokens_179962", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_179962_15883"
    t.index ["token"], name: "idx_token_token_179962_13717"
  end

  create_table "lime_tokens_181695", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_181695_27632"
    t.index ["token"], name: "idx_token_token_181695_31032"
  end

  create_table "lime_tokens_186962", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_186962_25789"
    t.index ["token"], name: "idx_token_token_186962_14443"
  end

  create_table "lime_tokens_196377", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_196377_9768"
    t.index ["token"], name: "idx_token_token_196377_25212"
  end

  create_table "lime_tokens_196476", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_196476_17538"
    t.index ["token"], name: "idx_token_token_196476_3130"
  end

  create_table "lime_tokens_212442", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_212442_34277"
    t.index ["token"], name: "idx_token_token_212442_6588"
  end

  create_table "lime_tokens_213273", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_213273_36118"
    t.index ["token"], name: "idx_token_token_213273_29426"
  end

  create_table "lime_tokens_216744", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_216744_10845"
    t.index ["token"], name: "idx_token_token_216744_22193"
  end

  create_table "lime_tokens_218865", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.index ["email"], name: "idx_email_kens_218865_5117"
    t.index ["token"], name: "idx_token_token_218865_37010"
  end

  create_table "lime_tokens_218935", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_218935_30869"
    t.index ["token"], name: "idx_token_token_218935_19265"
  end

  create_table "lime_tokens_219315", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.index ["email"], name: "idx_email_kens_219315_16432"
    t.index ["token"], name: "idx_token_token_219315_32725"
  end

  create_table "lime_tokens_221971", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_221971_41675"
    t.index ["token"], name: "idx_token_token_221971_31448"
  end

  create_table "lime_tokens_222865", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_222865_15714"
    t.index ["token"], name: "idx_token_token_222865_5353"
  end

  create_table "lime_tokens_223338", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_223338_31302"
    t.index ["token"], name: "idx_token_token_223338_32816"
  end

  create_table "lime_tokens_224436", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_224436_34025"
    t.index ["token"], name: "idx_token_token_224436_14084"
  end

  create_table "lime_tokens_225663", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_225663_23692"
    t.index ["token"], name: "idx_token_token_225663_15675"
  end

  create_table "lime_tokens_226843", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_226843_13484"
    t.index ["token"], name: "idx_token_token_226843_12451"
  end

  create_table "lime_tokens_231599", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.string "attribute_11", limit: 255
    t.string "attribute_12", limit: 255
    t.index ["email"], name: "idx_email_kens_231599_4352"
    t.index ["token"], name: "idx_token_token_231599_31656"
  end

  create_table "lime_tokens_233128", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_233128_20759"
    t.index ["token"], name: "idx_token_token_233128_39718"
  end

  create_table "lime_tokens_233677", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_233677_36101"
    t.index ["token"], name: "idx_token_token_233677_18380"
  end

  create_table "lime_tokens_234282", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_234282_14785"
    t.index ["token"], name: "idx_token_token_234282_47963"
  end

  create_table "lime_tokens_237826", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_237826_21268"
    t.index ["token"], name: "idx_token_token_237826_2965"
  end

  create_table "lime_tokens_244784", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_244784_8056"
    t.index ["token"], name: "idx_token_token_244784_22852"
  end

  create_table "lime_tokens_251129", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_251129_41189"
    t.index ["token"], name: "idx_token_token_251129_34645"
  end

  create_table "lime_tokens_262858", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_262858_19143"
    t.index ["token"], name: "idx_token_token_262858_16068"
  end

  create_table "lime_tokens_263331", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_263331_10327"
    t.index ["token"], name: "idx_token_token_263331_29478"
  end

  create_table "lime_tokens_264391", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_264391_27046"
    t.index ["token"], name: "idx_token_token_264391_20520"
  end

  create_table "lime_tokens_266127", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.text "attribute_14"
    t.index ["email"], name: "idx_email_kens_266127_24098"
    t.index ["token"], name: "idx_token_token_266127_21044"
  end

  create_table "lime_tokens_273679", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_273679_2755"
    t.index ["token"], name: "idx_token_token_273679_22631"
  end

  create_table "lime_tokens_279267", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_279267_28234"
    t.index ["token"], name: "idx_token_token_279267_28594"
  end

  create_table "lime_tokens_279376", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.index ["email"], name: "idx_email_kens_279376_38987"
    t.index ["token"], name: "idx_token_token_279376_30926"
  end

  create_table "lime_tokens_283462", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_283462_14807"
    t.index ["token"], name: "idx_token_token_283462_24784"
  end

  create_table "lime_tokens_285498", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.string "attribute_6", limit: 255
    t.string "attribute_7", limit: 255
    t.index ["email"], name: "idx_email_kens_285498_32371"
    t.index ["token"], name: "idx_token_token_285498_23308"
  end

  create_table "lime_tokens_286313", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.index ["email"], name: "idx_email_kens_286313_40292"
    t.index ["token"], name: "idx_token_token_286313_34289"
  end

  create_table "lime_tokens_289191", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_289191_48957"
    t.index ["token"], name: "idx_token_token_289191_27274"
  end

  create_table "lime_tokens_297591", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_297591_41448"
    t.index ["token"], name: "idx_token_token_297591_37152"
  end

  create_table "lime_tokens_297723", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.string "attribute_6", limit: 255
    t.string "attribute_7", limit: 255
    t.string "attribute_8", limit: 255
    t.string "attribute_9", limit: 255
    t.index ["email"], name: "idx_email_kens_297723_44822"
    t.index ["token"], name: "idx_token_token_297723_48210"
  end

  create_table "lime_tokens_315995", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_315995_15239"
    t.index ["token"], name: "idx_token_token_315995_49389"
  end

  create_table "lime_tokens_325846", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.index ["email"], name: "idx_email_kens_325846_27371"
    t.index ["token"], name: "idx_token_token_325846_45021"
  end

  create_table "lime_tokens_332979", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_332979_46281"
    t.index ["token"], name: "idx_token_token_332979_36377"
  end

  create_table "lime_tokens_333341", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_333341_36442"
    t.index ["token"], name: "idx_token_token_333341_6267"
  end

  create_table "lime_tokens_337222", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.index ["email"], name: "idx_email_kens_337222_27101"
    t.index ["token"], name: "idx_token_token_337222_18959"
  end

  create_table "lime_tokens_339266", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.index ["email"], name: "idx_email_kens_339266_40249"
    t.index ["token"], name: "idx_token_token_339266_43859"
  end

  create_table "lime_tokens_339853", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.text "attribute_11"
    t.string "attribute_12", limit: 255
    t.string "attribute_13", limit: 255
    t.string "attribute_14", limit: 255
    t.index ["email"], name: "idx_email_kens_339853_39332"
    t.index ["token"], name: "idx_token_token_339853_23492"
  end

  create_table "lime_tokens_346978", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_346978_28619"
    t.index ["token"], name: "idx_token_token_346978_39221"
  end

  create_table "lime_tokens_347561", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.string "attribute_6", limit: 255
    t.string "attribute_7", limit: 255
    t.string "attribute_8", limit: 255
    t.index ["email"], name: "idx_email_kens_347561_32904"
    t.index ["token"], name: "idx_token_token_347561_27227"
  end

  create_table "lime_tokens_352355", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_352355_29737"
    t.index ["token"], name: "idx_token_token_352355_19909"
  end

  create_table "lime_tokens_354858", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.index ["email"], name: "idx_email_kens_354858_6660"
    t.index ["token"], name: "idx_token_token_354858_18226"
  end

  create_table "lime_tokens_355818", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.index ["email"], name: "idx_email_kens_355818_18846"
    t.index ["token"], name: "idx_token_token_355818_46990"
  end

  create_table "lime_tokens_356148", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_356148_6042"
    t.index ["token"], name: "idx_token_token_356148_9013"
  end

  create_table "lime_tokens_356167", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.index ["email"], name: "idx_email_kens_356167_28949"
    t.index ["token"], name: "idx_token_token_356167_13428"
  end

  create_table "lime_tokens_361445", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.string "attribute_6", limit: 255
    t.string "attribute_7", limit: 255
    t.string "attribute_8", limit: 255
    t.string "attribute_9", limit: 255
    t.string "attribute_10", limit: 255
    t.string "attribute_11", limit: 255
    t.index ["email"], name: "idx_email_kens_361445_11825"
    t.index ["token"], name: "idx_token_token_361445_1487"
  end

  create_table "lime_tokens_364732", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_364732_12399"
    t.index ["token"], name: "idx_token_token_364732_48954"
  end

  create_table "lime_tokens_364877", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_364877_27939"
    t.index ["token"], name: "idx_token_token_364877_6080"
  end

  create_table "lime_tokens_365272", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_365272_34349"
    t.index ["token"], name: "idx_token_token_365272_18347"
  end

  create_table "lime_tokens_365933", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_365933_39867"
    t.index ["token"], name: "idx_token_token_365933_34017"
  end

  create_table "lime_tokens_371212", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.string "attribute_6", limit: 255
    t.string "attribute_7", limit: 255
    t.string "attribute_8", limit: 255
    t.index ["email"], name: "idx_email_kens_371212_31908"
    t.index ["token"], name: "idx_token_token_371212_46113"
  end

  create_table "lime_tokens_374554", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_374554_9072"
    t.index ["token"], name: "idx_token_token_374554_14614"
  end

  create_table "lime_tokens_376199", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_376199_41614"
    t.index ["token"], name: "idx_token_token_376199_26384"
  end

  create_table "lime_tokens_377251", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_377251_39922"
    t.index ["token"], name: "idx_token_token_377251_44986"
  end

  create_table "lime_tokens_377817", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_377817_36701"
    t.index ["token"], name: "idx_token_token_377817_19462"
  end

  create_table "lime_tokens_387311", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_387311_7465"
    t.index ["token"], name: "idx_token_token_387311_38628"
  end

  create_table "lime_tokens_387554", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_387554_15101"
    t.index ["token"], name: "idx_token_token_387554_48669"
  end

  create_table "lime_tokens_388285", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_388285_15213"
    t.index ["token"], name: "idx_token_token_388285_42914"
  end

  create_table "lime_tokens_394338", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_394338_45995"
    t.index ["token"], name: "idx_token_token_394338_22035"
  end

  create_table "lime_tokens_394961", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.index ["email"], name: "idx_email_kens_394961_6424"
    t.index ["token"], name: "idx_token_token_394961_23258"
  end

  create_table "lime_tokens_395824", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_395824_12692"
    t.index ["token"], name: "idx_token_token_395824_10013"
  end

  create_table "lime_tokens_397638", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_397638_33252"
    t.index ["token"], name: "idx_token_token_397638_23521"
  end

  create_table "lime_tokens_397785", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.text "attribute_11"
    t.index ["email"], name: "idx_email_kens_397785_36183"
    t.index ["token"], name: "idx_token_token_397785_39864"
  end

  create_table "lime_tokens_398373", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_398373_36427"
    t.index ["token"], name: "idx_token_token_398373_20644"
  end

  create_table "lime_tokens_398458", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_398458_29786"
    t.index ["token"], name: "idx_token_token_398458_25137"
  end

  create_table "lime_tokens_425411", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.string "attribute_11", limit: 255
    t.string "attribute_12", limit: 255
    t.string "attribute_13", limit: 255
    t.string "attribute_14", limit: 255
    t.index ["email"], name: "idx_email_kens_425411_16036"
    t.index ["token"], name: "idx_token_token_425411_45435"
  end

  create_table "lime_tokens_427934", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.index ["email"], name: "idx_email_kens_427934_14364"
    t.index ["token"], name: "idx_token_token_427934_2056"
  end

  create_table "lime_tokens_429836", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_429836_21054"
    t.index ["token"], name: "idx_token_token_429836_3777"
  end

  create_table "lime_tokens_435562", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_435562_21311"
    t.index ["token"], name: "idx_token_token_435562_8527"
  end

  create_table "lime_tokens_435624", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.text "attribute_11"
    t.index ["email"], name: "idx_email_kens_435624_30889"
    t.index ["token"], name: "idx_token_token_435624_1443"
  end

  create_table "lime_tokens_437763", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.index ["email"], name: "idx_email_kens_437763_28903"
    t.index ["token"], name: "idx_token_token_437763_18677"
  end

  create_table "lime_tokens_444625", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_444625_16304"
    t.index ["token"], name: "idx_token_token_444625_3626"
  end

  create_table "lime_tokens_445212", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.index ["email"], name: "idx_email_kens_445212_12550"
    t.index ["token"], name: "idx_token_token_445212_36560"
  end

  create_table "lime_tokens_451531", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_451531_12340"
    t.index ["token"], name: "idx_token_token_451531_39408"
  end

  create_table "lime_tokens_454475", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.text "attribute_11"
    t.text "attribute_12"
    t.text "attribute_13"
    t.text "attribute_14"
    t.text "attribute_15"
    t.text "attribute_16"
    t.index ["email"], name: "idx_email_kens_454475_10974"
    t.index ["token"], name: "idx_token_token_454475_9368"
  end

  create_table "lime_tokens_457387", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_457387_43511"
    t.index ["token"], name: "idx_token_token_457387_28421"
  end

  create_table "lime_tokens_462858", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_462858_44901"
    t.index ["token"], name: "idx_token_token_462858_19719"
  end

  create_table "lime_tokens_466694", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_466694_1061"
    t.index ["token"], name: "idx_token_token_466694_7376"
  end

  create_table "lime_tokens_467179", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_467179_4233"
    t.index ["token"], name: "idx_token_token_467179_41885"
  end

  create_table "lime_tokens_467574", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_467574_3153"
    t.index ["token"], name: "idx_token_token_467574_18738"
  end

  create_table "lime_tokens_469168", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_469168_44876"
    t.index ["token"], name: "idx_token_token_469168_7032"
  end

  create_table "lime_tokens_474646", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.string "attribute_8", limit: 255
    t.string "attribute_9", limit: 255
    t.index ["email"], name: "idx_email_kens_474646_10136"
    t.index ["token"], name: "idx_token_token_474646_49095"
  end

  create_table "lime_tokens_476665", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_476665_9066"
    t.index ["token"], name: "idx_token_token_476665_49863"
  end

  create_table "lime_tokens_486269", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.index ["email"], name: "idx_email_kens_486269_42171"
    t.index ["token"], name: "idx_token_token_486269_27525"
  end

  create_table "lime_tokens_486571", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_486571_30378"
    t.index ["token"], name: "idx_token_token_486571_46146"
  end

  create_table "lime_tokens_491682", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_491682_38080"
    t.index ["token"], name: "idx_token_token_491682_36038"
  end

  create_table "lime_tokens_495231", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.string "attribute_6", limit: 255
    t.string "attribute_7", limit: 255
    t.index ["email"], name: "idx_email_kens_495231_27106"
    t.index ["token"], name: "idx_token_token_495231_40018"
  end

  create_table "lime_tokens_497227", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_497227_26443"
    t.index ["token"], name: "idx_token_token_497227_15517"
  end

  create_table "lime_tokens_499971", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_499971_32867"
    t.index ["token"], name: "idx_token_token_499971_32544"
  end

  create_table "lime_tokens_511677", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_511677_6503"
    t.index ["token"], name: "idx_token_token_511677_26256"
  end

  create_table "lime_tokens_515521", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.index ["email"], name: "idx_email_kens_515521_21803"
    t.index ["token"], name: "idx_token_token_515521_47184"
  end

  create_table "lime_tokens_515866", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.index ["email"], name: "idx_email_kens_515866_47751"
    t.index ["token"], name: "idx_token_token_515866_30762"
  end

  create_table "lime_tokens_523595", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_523595_34030"
    t.index ["token"], name: "idx_token_token_523595_1987"
  end

  create_table "lime_tokens_533935", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_533935_34946"
    t.index ["token"], name: "idx_token_token_533935_32676"
  end

  create_table "lime_tokens_539178", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_539178_34593"
    t.index ["token"], name: "idx_token_token_539178_44108"
  end

  create_table "lime_tokens_541377", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.index ["email"], name: "idx_email_kens_541377_7672"
    t.index ["token"], name: "idx_token_token_541377_32274"
  end

  create_table "lime_tokens_543187", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.index ["email"], name: "idx_email_kens_543187_44131"
    t.index ["token"], name: "idx_token_token_543187_14112"
  end

  create_table "lime_tokens_546189", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_546189_31413"
    t.index ["token"], name: "idx_token_token_546189_14601"
  end

  create_table "lime_tokens_555987", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_555987_6381"
    t.index ["token"], name: "idx_token_token_555987_33426"
  end

  create_table "lime_tokens_558829", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.string "attribute_6", limit: 255
    t.index ["email"], name: "idx_email_kens_558829_16918"
    t.index ["token"], name: "idx_token_token_558829_36473"
  end

  create_table "lime_tokens_563811", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_563811_45493"
    t.index ["token"], name: "idx_token_token_563811_11715"
  end

  create_table "lime_tokens_564857", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_564857_31298"
    t.index ["token"], name: "idx_token_token_564857_29965"
  end

  create_table "lime_tokens_565251", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_565251_39574"
    t.index ["token"], name: "idx_token_token_565251_44091"
  end

  create_table "lime_tokens_573344", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_573344_19782"
    t.index ["token"], name: "idx_token_token_573344_40258"
  end

  create_table "lime_tokens_586629", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.index ["email"], name: "idx_email_kens_586629_42669"
    t.index ["token"], name: "idx_token_token_586629_9573"
  end

  create_table "lime_tokens_587195", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_587195_26796"
    t.index ["token"], name: "idx_token_token_587195_23926"
  end

  create_table "lime_tokens_588433", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_588433_4696"
    t.index ["token"], name: "idx_token_token_588433_2939"
  end

  create_table "lime_tokens_588566", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.text "attribute_11"
    t.index ["email"], name: "idx_email_kens_588566_39416"
    t.index ["token"], name: "idx_token_token_588566_1686"
  end

  create_table "lime_tokens_595124", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_595124_30342"
    t.index ["token"], name: "idx_token_token_595124_8076"
  end

  create_table "lime_tokens_596212", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_596212_1877"
    t.index ["token"], name: "idx_token_token_596212_21718"
  end

  create_table "lime_tokens_597816", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_597816_49938"
    t.index ["token"], name: "idx_token_token_597816_41282"
  end

  create_table "lime_tokens_598842", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_598842_25083"
    t.index ["token"], name: "idx_token_token_598842_3035"
  end

  create_table "lime_tokens_612253", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.index ["email"], name: "idx_email_kens_612253_28363"
    t.index ["token"], name: "idx_token_token_612253_13487"
  end

  create_table "lime_tokens_613333", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_613333_16102"
    t.index ["token"], name: "idx_token_token_613333_31967"
  end

  create_table "lime_tokens_615493", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_615493_22864"
    t.index ["token"], name: "idx_token_token_615493_20926"
  end

  create_table "lime_tokens_619823", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_619823_34980"
    t.index ["token"], name: "idx_token_token_619823_6870"
  end

  create_table "lime_tokens_621988", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_621988_46560"
    t.index ["token"], name: "idx_token_token_621988_19656"
  end

  create_table "lime_tokens_624522", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_624522_11890"
    t.index ["token"], name: "idx_token_token_624522_1833"
  end

  create_table "lime_tokens_632996", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.index ["email"], name: "idx_email_kens_632996_1046"
    t.index ["token"], name: "idx_token_token_632996_38978"
  end

  create_table "lime_tokens_641121", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_641121_36639"
    t.index ["token"], name: "idx_token_token_641121_32385"
  end

  create_table "lime_tokens_642132", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_642132_38088"
    t.index ["token"], name: "idx_token_token_642132_13206"
  end

  create_table "lime_tokens_646543", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.index ["email"], name: "idx_email_kens_646543_15264"
    t.index ["token"], name: "idx_token_token_646543_12080"
  end

  create_table "lime_tokens_647365", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_647365_7632"
    t.index ["token"], name: "idx_token_token_647365_44798"
  end

  create_table "lime_tokens_648667", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_648667_20024"
    t.index ["token"], name: "idx_token_token_648667_43246"
  end

  create_table "lime_tokens_649133", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.string "attribute_6", limit: 255
    t.string "attribute_7", limit: 255
    t.index ["email"], name: "idx_email_kens_649133_27799"
    t.index ["token"], name: "idx_token_token_649133_22290"
  end

  create_table "lime_tokens_662352", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_662352_11583"
    t.index ["token"], name: "idx_token_token_662352_31406"
  end

  create_table "lime_tokens_665268", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.index ["email"], name: "idx_email_kens_665268_17731"
    t.index ["token"], name: "idx_token_token_665268_27218"
  end

  create_table "lime_tokens_665981", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_665981_22425"
    t.index ["token"], name: "idx_token_token_665981_49310"
  end

  create_table "lime_tokens_666796", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.index ["email"], name: "idx_email_kens_666796_1806"
    t.index ["token"], name: "idx_token_token_666796_8653"
  end

  create_table "lime_tokens_668697", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.text "attribute_11"
    t.index ["email"], name: "idx_email_kens_668697_13146"
    t.index ["token"], name: "idx_token_token_668697_36803"
  end

  create_table "lime_tokens_677249", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_677249_22480"
    t.index ["token"], name: "idx_token_token_677249_29344"
  end

  create_table "lime_tokens_683612", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_683612_39516"
    t.index ["token"], name: "idx_token_token_683612_5056"
  end

  create_table "lime_tokens_692188", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_692188_30823"
    t.index ["token"], name: "idx_token_token_692188_37609"
  end

  create_table "lime_tokens_692745", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_692745_19516"
    t.index ["token"], name: "idx_token_token_692745_29290"
  end

  create_table "lime_tokens_693131", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_693131_6211"
    t.index ["token"], name: "idx_token_token_693131_28620"
  end

  create_table "lime_tokens_696695", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_696695_7355"
    t.index ["token"], name: "idx_token_token_696695_13713"
  end

  create_table "lime_tokens_698673", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.index ["email"], name: "idx_email_kens_698673_34104"
    t.index ["token"], name: "idx_token_token_698673_11855"
  end

  create_table "lime_tokens_699643", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.index ["email"], name: "idx_email_kens_699643_15028"
    t.index ["token"], name: "idx_token_token_699643_4561"
  end

  create_table "lime_tokens_719849", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_719849_1902"
    t.index ["token"], name: "idx_token_token_719849_29346"
  end

  create_table "lime_tokens_721872", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_721872_38762"
    t.index ["token"], name: "idx_token_token_721872_18415"
  end

  create_table "lime_tokens_723278", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_723278_12742"
    t.index ["token"], name: "idx_token_token_723278_3624"
  end

  create_table "lime_tokens_723478", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.index ["email"], name: "idx_email_kens_723478_36012"
    t.index ["token"], name: "idx_token_token_723478_19975"
  end

  create_table "lime_tokens_731241", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_731241_12034"
    t.index ["token"], name: "idx_token_token_731241_37719"
  end

  create_table "lime_tokens_732242", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_732242_23774"
    t.index ["token"], name: "idx_token_token_732242_12205"
  end

  create_table "lime_tokens_732933", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_732933_14526"
    t.index ["token"], name: "idx_token_token_732933_36670"
  end

  create_table "lime_tokens_735127", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_735127_19613"
    t.index ["token"], name: "idx_token_token_735127_44342"
  end

  create_table "lime_tokens_735426", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.text "attribute_11"
    t.index ["email"], name: "idx_email_kens_735426_46210"
    t.index ["token"], name: "idx_token_token_735426_47187"
  end

  create_table "lime_tokens_737564", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.index ["email"], name: "idx_email_kens_737564_26761"
    t.index ["token"], name: "idx_token_token_737564_25682"
  end

  create_table "lime_tokens_737849", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.index ["email"], name: "idx_email_kens_737849_22507"
    t.index ["token"], name: "idx_token_token_737849_40688"
  end

  create_table "lime_tokens_751219", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_751219_10335"
    t.index ["token"], name: "idx_token_token_751219_46711"
  end

  create_table "lime_tokens_756815", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_756815_41655"
    t.index ["token"], name: "idx_token_token_756815_22229"
  end

  create_table "lime_tokens_763739", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_763739_9820"
    t.index ["token"], name: "idx_token_token_763739_18570"
  end

  create_table "lime_tokens_766876", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.text "attribute_11"
    t.index ["email"], name: "idx_email_kens_766876_10693"
    t.index ["token"], name: "idx_token_token_766876_10047"
  end

  create_table "lime_tokens_767155", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_767155_38097"
    t.index ["token"], name: "idx_token_token_767155_318"
  end

  create_table "lime_tokens_771162", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_771162_41757"
    t.index ["token"], name: "idx_token_token_771162_39237"
  end

  create_table "lime_tokens_771525", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.index ["email"], name: "idx_email_kens_771525_618"
    t.index ["token"], name: "idx_token_token_771525_32156"
  end

  create_table "lime_tokens_775361", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_775361_25312"
    t.index ["token"], name: "idx_token_token_775361_37085"
  end

  create_table "lime_tokens_777581", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_777581_14649"
    t.index ["token"], name: "idx_token_token_777581_4012"
  end

  create_table "lime_tokens_777632", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_777632_48860"
    t.index ["token"], name: "idx_token_token_777632_47135"
  end

  create_table "lime_tokens_777786", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.index ["email"], name: "idx_email_kens_777786_41940"
    t.index ["token"], name: "idx_token_token_777786_34631"
  end

  create_table "lime_tokens_783623", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_783623_18100"
    t.index ["token"], name: "idx_token_token_783623_14366"
  end

  create_table "lime_tokens_784264", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_784264_17480"
    t.index ["token"], name: "idx_token_token_784264_19861"
  end

  create_table "lime_tokens_784488", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_784488_23624"
    t.index ["token"], name: "idx_token_token_784488_12385"
  end

  create_table "lime_tokens_786237", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_786237_45986"
    t.index ["token"], name: "idx_token_token_786237_24306"
  end

  create_table "lime_tokens_789651", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.index ["email"], name: "idx_email_kens_789651_12354"
    t.index ["token"], name: "idx_token_token_789651_38546"
  end

  create_table "lime_tokens_791695", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_791695_15325"
    t.index ["token"], name: "idx_token_token_791695_8237"
  end

  create_table "lime_tokens_794391", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_794391_31766"
    t.index ["token"], name: "idx_token_token_794391_4009"
  end

  create_table "lime_tokens_795622", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.string "attribute_6", limit: 255
    t.string "attribute_7", limit: 255
    t.index ["email"], name: "idx_email_kens_795622_32981"
    t.index ["token"], name: "idx_token_token_795622_31650"
  end

  create_table "lime_tokens_795667", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_795667_13032"
    t.index ["token"], name: "idx_token_token_795667_16239"
  end

  create_table "lime_tokens_796478", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_796478_5347"
    t.index ["token"], name: "idx_token_token_796478_1892"
  end

  create_table "lime_tokens_799577", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.string "attribute_6", limit: 255
    t.string "attribute_7", limit: 255
    t.index ["email"], name: "idx_email_kens_799577_10517"
    t.index ["token"], name: "idx_token_token_799577_29836"
  end

  create_table "lime_tokens_814276", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.index ["email"], name: "idx_email_kens_814276_43664"
    t.index ["token"], name: "idx_token_token_814276_4536"
  end

  create_table "lime_tokens_815996", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.index ["email"], name: "idx_email_kens_815996_28045"
    t.index ["token"], name: "idx_token_token_815996_24473"
  end

  create_table "lime_tokens_822191", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_822191_24169"
    t.index ["token"], name: "idx_token_token_822191_13168"
  end

  create_table "lime_tokens_822697", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.text "attribute_11"
    t.string "attribute_12", limit: 255
    t.string "attribute_13", limit: 255
    t.string "attribute_14", limit: 255
    t.index ["email"], name: "idx_email_kens_822697_31"
    t.index ["token"], name: "idx_token_token_822697_28568"
  end

  create_table "lime_tokens_834556", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_834556_17508"
    t.index ["token"], name: "idx_token_token_834556_15726"
  end

  create_table "lime_tokens_835117", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_835117_5261"
    t.index ["token"], name: "idx_token_token_835117_5093"
  end

  create_table "lime_tokens_835844", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_835844_5540"
    t.index ["token"], name: "idx_token_token_835844_36979"
  end

  create_table "lime_tokens_839222", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_839222_14614"
    t.index ["token"], name: "idx_token_token_839222_8698"
  end

  create_table "lime_tokens_843428", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_843428_49872"
    t.index ["token"], name: "idx_token_token_843428_31649"
  end

  create_table "lime_tokens_845373", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_845373_14125"
    t.index ["token"], name: "idx_token_token_845373_42890"
  end

  create_table "lime_tokens_845943", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_845943_37659"
    t.index ["token"], name: "idx_token_token_845943_18445"
  end

  create_table "lime_tokens_854737", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_854737_28453"
    t.index ["token"], name: "idx_token_token_854737_22634"
  end

  create_table "lime_tokens_862455", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_862455_10515"
    t.index ["token"], name: "idx_token_token_862455_17148"
  end

  create_table "lime_tokens_867378", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_867378_46656"
    t.index ["token"], name: "idx_token_token_867378_34350"
  end

  create_table "lime_tokens_868713", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.index ["email"], name: "idx_email_kens_868713_32175"
    t.index ["token"], name: "idx_token_token_868713_13187"
  end

  create_table "lime_tokens_869922", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.index ["email"], name: "idx_email_kens_869922_35240"
    t.index ["token"], name: "idx_token_token_869922_46275"
  end

  create_table "lime_tokens_871339", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_871339_18860"
    t.index ["token"], name: "idx_token_token_871339_23660"
  end

  create_table "lime_tokens_872832", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_872832_22686"
    t.index ["token"], name: "idx_token_token_872832_9032"
  end

  create_table "lime_tokens_874158", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.index ["email"], name: "idx_email_kens_874158_37614"
    t.index ["token"], name: "idx_token_token_874158_17553"
  end

  create_table "lime_tokens_875262", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.index ["email"], name: "idx_email_kens_875262_22"
    t.index ["token"], name: "idx_token_token_875262_9762"
  end

  create_table "lime_tokens_876368", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_876368_17719"
    t.index ["token"], name: "idx_token_token_876368_45631"
  end

  create_table "lime_tokens_878259", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_878259_44321"
    t.index ["token"], name: "idx_token_token_878259_7812"
  end

  create_table "lime_tokens_882568", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_882568_13810"
    t.index ["token"], name: "idx_token_token_882568_3878"
  end

  create_table "lime_tokens_885481", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_885481_8265"
    t.index ["token"], name: "idx_token_token_885481_24951"
  end

  create_table "lime_tokens_886573", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_886573_16102"
    t.index ["token"], name: "idx_token_token_886573_40191"
  end

  create_table "lime_tokens_887795", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_887795_13587"
    t.index ["token"], name: "idx_token_token_887795_3404"
  end

  create_table "lime_tokens_893785", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_893785_48077"
    t.index ["token"], name: "idx_token_token_893785_33142"
  end

  create_table "lime_tokens_895586", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_895586_30067"
    t.index ["token"], name: "idx_token_token_895586_34562"
  end

  create_table "lime_tokens_895675", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_895675_49714"
    t.index ["token"], name: "idx_token_token_895675_37122"
  end

  create_table "lime_tokens_898357", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_898357_38065"
    t.index ["token"], name: "idx_token_token_898357_17836"
  end

  create_table "lime_tokens_911612", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_911612_13570"
    t.index ["token"], name: "idx_token_token_911612_44766"
  end

  create_table "lime_tokens_915499", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_915499_43211"
    t.index ["token"], name: "idx_token_token_915499_48904"
  end

  create_table "lime_tokens_916752", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.index ["email"], name: "idx_email_kens_916752_41738"
    t.index ["token"], name: "idx_token_token_916752_8848"
  end

  create_table "lime_tokens_917581", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_917581_15397"
    t.index ["token"], name: "idx_token_token_917581_30643"
  end

  create_table "lime_tokens_919367", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_919367_22751"
    t.index ["token"], name: "idx_token_token_919367_15192"
  end

  create_table "lime_tokens_923271", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.text "attribute_11"
    t.text "attribute_12"
    t.index ["email"], name: "idx_email_kens_923271_15126"
    t.index ["token"], name: "idx_token_token_923271_33802"
  end

  create_table "lime_tokens_923512", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.index ["email"], name: "idx_email_kens_923512_11830"
    t.index ["token"], name: "idx_token_token_923512_6795"
  end

  create_table "lime_tokens_925715", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.index ["email"], name: "idx_email_kens_925715_48834"
    t.index ["token"], name: "idx_token_token_925715_11945"
  end

  create_table "lime_tokens_927695", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.index ["email"], name: "idx_email_kens_927695_20874"
    t.index ["token"], name: "idx_token_token_927695_21724"
  end

  create_table "lime_tokens_929272", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_929272_17334"
    t.index ["token"], name: "idx_token_token_929272_34891"
  end

  create_table "lime_tokens_931453", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_931453_20273"
    t.index ["token"], name: "idx_token_token_931453_12274"
  end

  create_table "lime_tokens_933729", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_933729_34194"
    t.index ["token"], name: "idx_token_token_933729_28332"
  end

  create_table "lime_tokens_937831", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.index ["email"], name: "idx_email_kens_937831_43024"
    t.index ["token"], name: "idx_token_token_937831_33890"
  end

  create_table "lime_tokens_941869", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_941869_1936"
    t.index ["token"], name: "idx_token_token_941869_7888"
  end

  create_table "lime_tokens_942554", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_942554_13476"
    t.index ["token"], name: "idx_token_token_942554_21185"
  end

  create_table "lime_tokens_945182", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_945182_15972"
    t.index ["token"], name: "idx_token_token_945182_26052"
  end

  create_table "lime_tokens_949341", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.index ["email"], name: "idx_email_kens_949341_15818"
    t.index ["token"], name: "idx_token_token_949341_36888"
  end

  create_table "lime_tokens_965969", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.index ["email"], name: "idx_email_kens_965969_48819"
    t.index ["token"], name: "idx_token_token_965969_30910"
  end

  create_table "lime_tokens_966338", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_966338_48749"
    t.index ["token"], name: "idx_token_token_966338_39502"
  end

  create_table "lime_tokens_967443", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_967443_19867"
    t.index ["token"], name: "idx_token_token_967443_23384"
  end

  create_table "lime_tokens_974861", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.text "attribute_14"
    t.index ["email"], name: "idx_email_kens_974861_29647"
    t.index ["token"], name: "idx_token_token_974861_11818"
  end

  create_table "lime_tokens_975859", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.index ["email"], name: "idx_email_kens_975859_10778"
    t.index ["token"], name: "idx_token_token_975859_17657"
  end

  create_table "lime_tokens_976265", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_976265_24687"
    t.index ["token"], name: "idx_token_token_976265_40069"
  end

  create_table "lime_tokens_977261", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.string "attribute_4", limit: 255
    t.string "attribute_5", limit: 255
    t.string "attribute_6", limit: 255
    t.string "attribute_7", limit: 255
    t.index ["email"], name: "idx_email_kens_977261_6724"
    t.index ["token"], name: "idx_token_token_977261_34386"
  end

  create_table "lime_tokens_982113", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_982113_62"
    t.index ["token"], name: "idx_token_token_982113_45316"
  end

  create_table "lime_tokens_983399", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_983399_2095"
    t.index ["token"], name: "idx_token_token_983399_47456"
  end

  create_table "lime_tokens_987322", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.string "attribute_1", limit: 255
    t.string "attribute_2", limit: 255
    t.string "attribute_3", limit: 255
    t.index ["email"], name: "idx_email_kens_987322_10862"
    t.index ["token"], name: "idx_token_token_987322_44935"
  end

  create_table "lime_tokens_988354", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.text "attribute_1"
    t.text "attribute_2"
    t.text "attribute_3"
    t.text "attribute_4"
    t.text "attribute_5"
    t.text "attribute_6"
    t.text "attribute_7"
    t.text "attribute_8"
    t.text "attribute_9"
    t.text "attribute_10"
    t.text "attribute_11"
    t.text "attribute_12"
    t.text "attribute_13"
    t.text "attribute_14"
    t.index ["email"], name: "idx_email_kens_988354_35313"
    t.index ["token"], name: "idx_token_token_988354_22837"
  end

  create_table "lime_tokens_991545", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_991545_2508"
    t.index ["token"], name: "idx_token_token_991545_9755"
  end

  create_table "lime_tokens_996971", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_996971_27653"
    t.index ["token"], name: "idx_token_token_996971_27367"
  end

  create_table "lime_tokens_998484", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "participant_id", limit: 50
    t.string "firstname", limit: 150
    t.string "lastname", limit: 150
    t.text "email"
    t.text "emailstatus"
    t.string "token", limit: 35
    t.string "language", limit: 25
    t.string "blacklisted", limit: 17
    t.string "sent", limit: 17, default: "N"
    t.string "remindersent", limit: 17, default: "N"
    t.integer "remindercount", default: 0
    t.string "completed", limit: 17, default: "N"
    t.integer "usesleft", default: 1
    t.datetime "validfrom", precision: nil
    t.datetime "validuntil", precision: nil
    t.integer "mpid"
    t.index ["email"], name: "idx_email_kens_998484_48371"
    t.index ["token"], name: "idx_token_token_998484_13403"
  end

  create_table "lime_tutorial_entries", primary_key: "teid", id: :serial, force: :cascade do |t|
    t.text "title"
    t.text "content"
    t.text "settings"
    t.integer "ordering"
  end

  create_table "lime_tutorial_entry_relation", primary_key: ["teid", "tid"], force: :cascade do |t|
    t.integer "teid", null: false
    t.integer "tid", null: false
    t.integer "uid"
    t.integer "sid"
    t.index ["sid"], name: "lime_idx2_tutorial_entry_relation"
    t.index ["uid"], name: "lime_idx1_tutorial_entry_relation"
  end

  create_table "lime_tutorials", primary_key: "tid", id: :serial, force: :cascade do |t|
    t.string "name", limit: 128
    t.text "description"
    t.integer "active", default: 0
    t.text "settings"
    t.string "permission", limit: 128, null: false
    t.string "permission_grade", limit: 128, null: false
    t.string "title", limit: 192
    t.string "icon", limit: 64
    t.index ["name"], name: "lime_idx1_tutorials", unique: true
  end

  create_table "lime_user_groups", primary_key: "ugid", id: :serial, force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.text "description", null: false
    t.integer "owner_id", null: false
  end

  create_table "lime_user_in_groups", primary_key: ["ugid", "uid"], force: :cascade do |t|
    t.integer "ugid", null: false
    t.integer "uid", null: false
  end

  create_table "lime_user_in_permissionrole", primary_key: ["ptid", "uid"], force: :cascade do |t|
    t.integer "ptid", null: false
    t.integer "uid", null: false
  end

  create_table "lime_users", primary_key: "uid", id: :serial, force: :cascade do |t|
    t.string "users_name", limit: 64, default: "", null: false
    t.string "full_name", limit: 50, null: false
    t.integer "parent_id", null: false
    t.string "lang", limit: 20
    t.string "email", limit: 254
    t.string "htmleditormode", limit: 7, default: "default"
    t.string "templateeditormode", limit: 7, default: "default", null: false
    t.string "questionselectormode", limit: 7, default: "default", null: false
    t.integer "dateformat", default: 1, null: false
    t.datetime "created", precision: nil
    t.datetime "modified", precision: nil
    t.text "password", default: "nopw", null: false
    t.text "one_time_pw"
    t.datetime "last_login", precision: nil
    t.string "validation_key", limit: 38
    t.datetime "validation_key_expiration", precision: nil
    t.datetime "last_forgot_email_password", precision: nil

    t.unique_constraint ["users_name"], name: "lime_users_users_name_key"
  end

  create_table "med18_competencies", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "permission_group_id"
    t.string "student_uid"
    t.string "email"
    t.string "medhub_id"
    t.string "course_name"
    t.string "course_id"
    t.date "start_date"
    t.date "end_date"
    t.date "submit_date"
    t.string "evaluator"
    t.string "final_grade"
    t.string "environment"
    t.integer "ics1", limit: 2
    t.integer "ics2", limit: 2
    t.integer "ics3", limit: 2
    t.integer "ics4", limit: 2
    t.integer "ics5", limit: 2
    t.integer "ics6", limit: 2
    t.integer "ics7", limit: 2
    t.integer "ics8", limit: 2
    t.integer "mk1", limit: 2
    t.integer "mk2", limit: 2
    t.integer "mk3", limit: 2
    t.integer "mk4", limit: 2
    t.integer "mk5", limit: 2
    t.integer "pbli1", limit: 2
    t.integer "pbli2", limit: 2
    t.integer "pbli3", limit: 2
    t.integer "pbli4", limit: 2
    t.integer "pbli5", limit: 2
    t.integer "pbli6", limit: 2
    t.integer "pbli7", limit: 2
    t.integer "pbli8", limit: 2
    t.integer "pcp1", limit: 2
    t.integer "pcp2", limit: 2
    t.integer "pcp3", limit: 2
    t.integer "pcp4", limit: 2
    t.integer "pcp5", limit: 2
    t.integer "pcp6", limit: 2
    t.integer "pppd1", limit: 2
    t.integer "pppd2", limit: 2
    t.integer "pppd3", limit: 2
    t.integer "pppd4", limit: 2
    t.integer "pppd5", limit: 2
    t.integer "pppd6", limit: 2
    t.integer "pppd7", limit: 2
    t.integer "pppd8", limit: 2
    t.integer "pppd9", limit: 2
    t.integer "pppd10", limit: 2
    t.integer "pppd11", limit: 2
    t.integer "sbpic1", limit: 2
    t.integer "sbpic2", limit: 2
    t.integer "sbpic3", limit: 2
    t.integer "sbpic4", limit: 2
    t.integer "sbpic5", limit: 2
    t.text "prof_concerns"
    t.text "comm_prof_concerns"
    t.text "overall_summ_comm_perf"
    t.text "add_comm_on_perform"
    t.text "mspe"
    t.text "clinic_exp_comment"
    t.text "feedback"
    t.datetime "created_at", precision: nil, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: nil, default: -> { "now()" }, null: false
    t.index ["permission_group_id"], name: "index_med18_competencies_on_permission_group_id"
    t.index ["user_id"], name: "index_med18_competencies_on_user_id"
  end

  create_table "med18_mspes", primary_key: "sid", id: { type: :string, limit: 10 }, force: :cascade do |t|
    t.string "email", limit: 50, null: false
    t.string "full_name", limit: 50
    t.bigint "user_id"
    t.integer "permission_group_id"

    t.unique_constraint ["email"], name: "med18_mspe_email_key"
  end

  create_table "med19_competencies", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "permission_group_id"
    t.string "student_uid"
    t.string "email"
    t.string "medhub_id"
    t.string "course_name"
    t.string "course_id"
    t.date "start_date"
    t.date "end_date"
    t.date "submit_date"
    t.string "evaluator"
    t.string "final_grade"
    t.string "environment"
    t.integer "ics1", limit: 2
    t.integer "ics2", limit: 2
    t.integer "ics3", limit: 2
    t.integer "ics4", limit: 2
    t.integer "ics5", limit: 2
    t.integer "ics6", limit: 2
    t.integer "ics7", limit: 2
    t.integer "ics8", limit: 2
    t.integer "mk1", limit: 2
    t.integer "mk2", limit: 2
    t.integer "mk3", limit: 2
    t.integer "mk4", limit: 2
    t.integer "mk5", limit: 2
    t.integer "pbli1", limit: 2
    t.integer "pbli2", limit: 2
    t.integer "pbli3", limit: 2
    t.integer "pbli4", limit: 2
    t.integer "pbli5", limit: 2
    t.integer "pbli6", limit: 2
    t.integer "pbli7", limit: 2
    t.integer "pbli8", limit: 2
    t.integer "pcp1", limit: 2
    t.integer "pcp2", limit: 2
    t.integer "pcp3", limit: 2
    t.integer "pcp4", limit: 2
    t.integer "pcp5", limit: 2
    t.integer "pcp6", limit: 2
    t.integer "pppd1", limit: 2
    t.integer "pppd2", limit: 2
    t.integer "pppd3", limit: 2
    t.integer "pppd4", limit: 2
    t.integer "pppd5", limit: 2
    t.integer "pppd6", limit: 2
    t.integer "pppd7", limit: 2
    t.integer "pppd8", limit: 2
    t.integer "pppd9", limit: 2
    t.integer "pppd10", limit: 2
    t.integer "pppd11", limit: 2
    t.integer "sbpic1", limit: 2
    t.integer "sbpic2", limit: 2
    t.integer "sbpic3", limit: 2
    t.integer "sbpic4", limit: 2
    t.integer "sbpic5", limit: 2
    t.text "prof_concerns"
    t.text "comm_prof_concerns"
    t.text "overall_summ_comm_perf"
    t.text "add_comm_on_perform"
    t.text "mspe"
    t.text "clinic_exp_comment"
    t.text "feedback"
    t.datetime "created_at", precision: nil, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: nil, default: -> { "now()" }, null: false
    t.index ["permission_group_id"], name: "index_med19_competencies_on_permission_group_id"
    t.index ["user_id"], name: "index_med19_competencies_on_user_id"
  end

  create_table "med19_mspes", primary_key: "sid", id: { type: :string, limit: 10 }, force: :cascade do |t|
    t.string "email", limit: 50, null: false
    t.string "full_name", limit: 50
    t.bigint "user_id"
    t.integer "permission_group_id"

    t.unique_constraint ["email"], name: "med19_mspe_email_key"
  end

  create_table "med20_competencies", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "permission_group_id"
    t.string "student_uid"
    t.string "email"
    t.string "medhub_id"
    t.string "course_name"
    t.string "course_id"
    t.date "start_date"
    t.date "end_date"
    t.date "submit_date"
    t.string "evaluator"
    t.string "final_grade"
    t.string "environment"
    t.integer "ics1", limit: 2
    t.integer "ics2", limit: 2
    t.integer "ics3", limit: 2
    t.integer "ics4", limit: 2
    t.integer "ics5", limit: 2
    t.integer "ics6", limit: 2
    t.integer "ics7", limit: 2
    t.integer "ics8", limit: 2
    t.integer "mk1", limit: 2
    t.integer "mk2", limit: 2
    t.integer "mk3", limit: 2
    t.integer "mk4", limit: 2
    t.integer "mk5", limit: 2
    t.integer "pbli1", limit: 2
    t.integer "pbli2", limit: 2
    t.integer "pbli3", limit: 2
    t.integer "pbli4", limit: 2
    t.integer "pbli5", limit: 2
    t.integer "pbli6", limit: 2
    t.integer "pbli7", limit: 2
    t.integer "pbli8", limit: 2
    t.integer "pcp1", limit: 2
    t.integer "pcp2", limit: 2
    t.integer "pcp3", limit: 2
    t.integer "pcp4", limit: 2
    t.integer "pcp5", limit: 2
    t.integer "pcp6", limit: 2
    t.integer "pppd1", limit: 2
    t.integer "pppd2", limit: 2
    t.integer "pppd3", limit: 2
    t.integer "pppd4", limit: 2
    t.integer "pppd5", limit: 2
    t.integer "pppd6", limit: 2
    t.integer "pppd7", limit: 2
    t.integer "pppd8", limit: 2
    t.integer "pppd9", limit: 2
    t.integer "pppd10", limit: 2
    t.integer "pppd11", limit: 2
    t.integer "sbpic1", limit: 2
    t.integer "sbpic2", limit: 2
    t.integer "sbpic3", limit: 2
    t.integer "sbpic4", limit: 2
    t.integer "sbpic5", limit: 2
    t.text "prof_concerns"
    t.text "comm_prof_concerns"
    t.text "overall_summ_comm_perf"
    t.text "add_comm_on_perform"
    t.text "mspe"
    t.text "clinic_exp_comment"
    t.text "feedback"
    t.datetime "created_at", precision: nil, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: nil, default: -> { "now()" }, null: false
    t.index ["permission_group_id"], name: "index_med20_competencies_on_permission_group_id"
    t.index ["user_id"], name: "index_med20_competencies_on_user_id"
  end

  create_table "med20_mspes", primary_key: "sid", id: { type: :string, limit: 10 }, force: :cascade do |t|
    t.string "email", limit: 50, null: false
    t.string "full_name", limit: 50
    t.bigint "user_id"
    t.integer "permission_group_id"

    t.unique_constraint ["email"], name: "med20_mspe_email_key"
  end

  create_table "med21_competencies", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "permission_group_id"
    t.string "student_uid"
    t.string "email"
    t.string "medhub_id"
    t.string "course_name"
    t.string "course_id"
    t.date "start_date"
    t.date "end_date"
    t.date "submit_date"
    t.string "evaluator"
    t.string "final_grade"
    t.string "environment"
    t.integer "ics1", limit: 2
    t.integer "ics2", limit: 2
    t.integer "ics3", limit: 2
    t.integer "ics4", limit: 2
    t.integer "ics5", limit: 2
    t.integer "ics6", limit: 2
    t.integer "ics7", limit: 2
    t.integer "ics8", limit: 2
    t.integer "mk1", limit: 2
    t.integer "mk2", limit: 2
    t.integer "mk3", limit: 2
    t.integer "mk4", limit: 2
    t.integer "mk5", limit: 2
    t.integer "pbli1", limit: 2
    t.integer "pbli2", limit: 2
    t.integer "pbli3", limit: 2
    t.integer "pbli4", limit: 2
    t.integer "pbli5", limit: 2
    t.integer "pbli6", limit: 2
    t.integer "pbli7", limit: 2
    t.integer "pbli8", limit: 2
    t.integer "pcp1", limit: 2
    t.integer "pcp2", limit: 2
    t.integer "pcp3", limit: 2
    t.integer "pcp4", limit: 2
    t.integer "pcp5", limit: 2
    t.integer "pcp6", limit: 2
    t.integer "pppd1", limit: 2
    t.integer "pppd2", limit: 2
    t.integer "pppd3", limit: 2
    t.integer "pppd4", limit: 2
    t.integer "pppd5", limit: 2
    t.integer "pppd6", limit: 2
    t.integer "pppd7", limit: 2
    t.integer "pppd8", limit: 2
    t.integer "pppd9", limit: 2
    t.integer "pppd10", limit: 2
    t.integer "pppd11", limit: 2
    t.integer "sbpic1", limit: 2
    t.integer "sbpic2", limit: 2
    t.integer "sbpic3", limit: 2
    t.integer "sbpic4", limit: 2
    t.integer "sbpic5", limit: 2
    t.text "prof_concerns"
    t.text "comm_prof_concerns"
    t.text "overall_summ_comm_perf"
    t.text "add_comm_on_perform"
    t.text "mspe"
    t.text "clinic_exp_comment"
    t.text "feedback"
    t.datetime "created_at", precision: nil, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: nil, default: -> { "now()" }, null: false
    t.index ["permission_group_id"], name: "index_med21_competencies_on_permission_group_id"
    t.index ["user_id"], name: "index_med21_competencies_on_user_id"
  end

  create_table "med21_fom_exams", force: :cascade do |t|
    t.integer "user_id"
    t.integer "permission_group_id"
    t.string "course_code"
    t.datetime "submit_date", precision: nil
    t.decimal "comp1_wk1"
    t.decimal "comp1_wk2"
    t.decimal "comp1_wk3"
    t.decimal "comp1_wk4"
    t.decimal "comp1_wk5"
    t.decimal "comp1_wk6"
    t.decimal "comp1_wk7"
    t.decimal "comp1_wk8"
    t.decimal "comp1_wk9"
    t.decimal "comp1_wk10"
    t.decimal "comp1_wk11"
    t.decimal "comp1_wk12"
    t.decimal "comp1_dropped_score"
    t.string "comp1_dropped_quiz"
    t.decimal "comp2b_bss1"
    t.decimal "comp2b_bss2"
    t.decimal "comp2b_bss3"
    t.decimal "comp2b_bss4"
    t.decimal "comp2b_bss5"
    t.decimal "comp2b_bss6"
    t.decimal "comp2b_bss7"
    t.decimal "comp2b_bss8"
    t.decimal "comp2b_bss9"
    t.decimal "comp2b_bss10"
    t.decimal "comp2b_bss11"
    t.decimal "comp2b_bss12"
    t.decimal "comp3_final1"
    t.decimal "comp3_final2"
    t.decimal "comp3_final3"
    t.decimal "comp4_nbme"
    t.decimal "comp5a_hss1"
    t.decimal "comp5a_hss2"
    t.decimal "comp5a_hss3"
    t.decimal "comp5a_hss4"
    t.decimal "comp5a_hss5"
    t.decimal "comp5b_bss1"
    t.decimal "comp5b_bss2"
    t.decimal "comp5b_bss3"
    t.decimal "comp5b_bss4"
    t.decimal "comp5b_bss5"
    t.decimal "comp5b_bss6"
    t.decimal "comp5b_bss7"
    t.decimal "summary_comp1"
    t.decimal "summary_comp2b"
    t.decimal "summary_comp3"
    t.decimal "summary_comp4"
    t.decimal "summary_comp5a"
    t.decimal "summary_comp5b"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "permission_group_id", "course_code"], name: "by_med21_user_permission_group_course_code", unique: true
  end

  create_table "med21_mspes", primary_key: "sid", id: { type: :string, limit: 10 }, force: :cascade do |t|
    t.string "email", limit: 50, null: false
    t.string "full_name", limit: 50
    t.bigint "user_id"
    t.integer "permission_group_id"

    t.unique_constraint ["email"], name: "med21_mspe_email_key"
  end

  create_table "med22_fom_exams", force: :cascade do |t|
    t.integer "user_id"
    t.integer "permission_group_id"
    t.string "course_code"
    t.datetime "submit_date", precision: nil
    t.decimal "comp1_wk1"
    t.decimal "comp1_wk2"
    t.decimal "comp1_wk3"
    t.decimal "comp1_wk4"
    t.decimal "comp1_wk5"
    t.decimal "comp1_wk6"
    t.decimal "comp1_wk7"
    t.decimal "comp1_wk8"
    t.decimal "comp1_wk9"
    t.decimal "comp1_wk10"
    t.decimal "comp1_wk11"
    t.decimal "comp1_wk12"
    t.decimal "comp1_dropped_score"
    t.string "comp1_dropped_quiz"
    t.decimal "comp2a_hss1"
    t.decimal "comp2a_hss2"
    t.decimal "comp2a_hss3"
    t.decimal "comp2a_hss4"
    t.decimal "comp2a_hss5"
    t.decimal "comp2a_hss6"
    t.decimal "comp2a_hss7"
    t.decimal "comp2a_hssavg"
    t.decimal "comp2b_bss1"
    t.decimal "comp2b_bss2"
    t.decimal "comp2b_bss3"
    t.decimal "comp2b_bss4"
    t.decimal "comp2b_bss5"
    t.decimal "comp2b_bss6"
    t.decimal "comp2b_bss7"
    t.decimal "comp2b_bss8"
    t.decimal "comp2b_bss9"
    t.decimal "comp2b_bssavg"
    t.decimal "comp3_final1"
    t.decimal "comp3_final2"
    t.decimal "comp3_final3"
    t.decimal "comp4_nbme"
    t.decimal "comp5a_hss1"
    t.decimal "comp5a_hss2"
    t.decimal "comp5a_hss3"
    t.decimal "comp5a_hssavg"
    t.decimal "comp5b_bss1"
    t.decimal "comp5b_bss2"
    t.decimal "comp5b_bss3"
    t.decimal "comp5b_bss4"
    t.decimal "comp5b_bss5"
    t.decimal "comp5b_bssavg"
    t.decimal "summary_comp1"
    t.decimal "summary_comp2a"
    t.decimal "summary_comp2b"
    t.decimal "summary_comp3"
    t.decimal "summary_comp4"
    t.decimal "summary_comp5a"
    t.decimal "summary_comp5b"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "comp5a_hss4"
    t.index ["user_id", "permission_group_id", "course_code"], name: "by_med22_user_permission_group_course_code", unique: true
  end

  create_table "med22_mspe_cces", primary_key: "sid", id: { type: :string, limit: 10 }, force: :cascade do |t|
    t.string "email", limit: 50, null: false
    t.string "full_name", limit: 50

    t.unique_constraint ["email"], name: "med22_mspe_cces_email_key"
  end

  create_table "med22_mspes", primary_key: "sid", id: { type: :string, limit: 10 }, force: :cascade do |t|
    t.string "email", limit: 50, null: false
    t.string "full_name", limit: 50
    t.bigint "user_id"
    t.integer "permission_group_id"

    t.unique_constraint ["email"], name: "med22_mspe_email_key"
  end

  create_table "med23_mspes", primary_key: "sid", id: { type: :string, limit: 10 }, force: :cascade do |t|
    t.string "email", limit: 50, null: false
    t.string "full_name", limit: 50
    t.bigint "user_id"
    t.integer "permission_group_id"
    t.index ["user_id"], name: "index_med23_mspes_on_user_id"
    t.unique_constraint ["email"], name: "med23_mspe_email_key"
  end

  create_table "med24_mspes", primary_key: "sid", id: { type: :string, limit: 10 }, force: :cascade do |t|
    t.string "email", limit: 50, null: false
    t.string "full_name", limit: 50
    t.bigint "user_id"
    t.integer "permission_group_id"
    t.index ["user_id"], name: "index_med24_mspes_on_user_id"
    t.unique_constraint ["email"], name: "med24_mspe_email_key"
  end

  create_table "med25_mspes", primary_key: "sid", id: { type: :string, limit: 10 }, force: :cascade do |t|
    t.string "email", limit: 50, null: false
    t.string "full_name", limit: 50
    t.bigint "user_id"
    t.integer "permission_group_id"
    t.index ["user_id"], name: "index_med25_mspes_on_user_id"
    t.unique_constraint ["email"], name: "med25_mspe_email_key"
  end

  create_table "med26_mspes", primary_key: "sid", id: { type: :string, limit: 10 }, force: :cascade do |t|
    t.string "email", limit: 50, null: false
    t.string "full_name", limit: 50
    t.bigint "user_id"
    t.integer "permission_group_id"
    t.index ["user_id"], name: "index_med26_mspes_on_user_id"
    t.unique_constraint ["email"], name: "med26_mspe_email_key"
  end

  create_table "medhub_courses", force: :cascade do |t|
    t.string "course_code"
    t.integer "course_id"
    t.string "course_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_code"], name: "index_medhub_courses_on_course_code"
  end

  create_table "medhub_period_ids", id: false, force: :cascade do |t|
    t.integer "courseID"
    t.integer "periodID"
    t.date "start_date"
    t.date "end_date"
    t.index ["courseID", "periodID"], name: "medhub_period_ids_idx"
  end

  create_table "meetings", id: :serial, force: :cascade do |t|
    t.string "subject", array: true
    t.datetime "date", precision: nil
    t.string "location"
    t.string "m_status"
    t.text "notes"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "advisor_type"
    t.integer "advisor_id"
    t.integer "event_id"
    t.string "advice_category"
    t.text "advisor_discussed", default: [], array: true
    t.text "advisor_outcomes", default: [], array: true
    t.string "academic_discussed_other"
    t.string "academic_outcomes_other"
    t.string "career_discussed_other"
    t.string "career_outcomes_other"
    t.text "advisor_notes"
    t.text "study_resources", default: [], array: true
    t.string "study_resources_other"
    t.json "nbme_form"
    t.json "uworld_info"
    t.json "qbank_info"
    t.boolean "graduated_student"
    t.index ["advisor_id", "id"], name: "index_meetings_on_advisor_id_and_id", unique: true
    t.index ["event_id", "id"], name: "index_meetings_on_event_id_and_id", unique: true
    t.index ["user_id"], name: "index_meetings_on_user_id"
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.text "content"
    t.boolean "archived", default: false
    t.integer "user_id"
    t.integer "room_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "meta_attribute_entity_groups", id: :serial, force: :cascade do |t|
    t.text "group_name", null: false
    t.text "parent_table", null: false
    t.boolean "visible", default: true
    t.string "parent_table_pk", limit: 255
  end

  create_table "meta_attribute_groups", id: :serial, force: :cascade do |t|
    t.text "group_name", null: false
    t.text "parent_table", null: false
    t.boolean "visible", default: true
  end

  create_table "new_competencies", force: :cascade do |t|
    t.integer "user_id"
    t.integer "permission_group_id"
    t.string "student_uid"
    t.string "email"
    t.string "medhub_id"
    t.string "course_name"
    t.string "course_id"
    t.date "start_date"
    t.date "end_date"
    t.date "submit_date"
    t.string "evaluator"
    t.string "final_grade"
    t.string "environment"
    t.integer "ics1", limit: 2
    t.integer "ics2", limit: 2
    t.integer "ics3", limit: 2
    t.integer "ics4", limit: 2
    t.integer "ics5", limit: 2
    t.integer "mk1", limit: 2
    t.integer "mk2", limit: 2
    t.integer "mk3", limit: 2
    t.integer "pbli1", limit: 2
    t.integer "pbli2", limit: 2
    t.integer "pbli3", limit: 2
    t.integer "pcp1", limit: 2
    t.integer "pcp2", limit: 2
    t.integer "pcp3", limit: 2
    t.integer "pppd1", limit: 2
    t.integer "pppd2", limit: 2
    t.integer "sbp1", limit: 2
    t.text "prof_concerns"
    t.text "comm_prof_concerns"
    t.text "overall_summ_comm_perf"
    t.text "add_comm_on_perform"
    t.text "mspe"
    t.text "clinic_exp_comment"
    t.text "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_group_id", "user_id", "id"], name: "idx_on_permission_group_id_user_id_id_9b61cec064", unique: true
    t.index ["user_id", "id"], name: "index_new_competencies_on_user_id_and_id", unique: true
  end

  create_table "permission_groups", id: :serial, force: :cascade do |t|
    t.text "title", null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.text "pinned_survey_group_titles"
  end

  create_table "permission_ls_group_filters", id: :serial, force: :cascade do |t|
    t.integer "permission_ls_group_id", null: false
    t.integer "lime_question_qid"
    t.text "ident_type"
    t.text "restricted_val"
    t.boolean "filter_all", default: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["permission_ls_group_id", "lime_question_qid"], name: "uniq_qid_by_group", unique: true
  end

  create_table "permission_ls_groups", id: :serial, force: :cascade do |t|
    t.integer "lime_survey_sid", null: false
    t.integer "permission_group_id", null: false
    t.boolean "enabled", default: false
    t.boolean "view_raw", default: false
    t.boolean "view_all", default: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["lime_survey_sid", "permission_group_id"], name: "uniq_sid_by_group", unique: true
  end

  create_table "precep_meetings", force: :cascade do |t|
    t.bigint "user_id"
    t.string "student_sid"
    t.string "student_name"
    t.datetime "meeting_date"
    t.string "meeting_notes"
    t.string "meeting_with"
    t.string "other_present"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_precep_meetings_on_user_id"
  end

  create_table "preceptor_assesses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "response_id"
    t.string "preceptor_name"
    t.string "preceptor_email"
    t.date "submit_date"
    t.string "term"
    t.string "grade"
    t.boolean "attribute1"
    t.text "attribute1_no"
    t.boolean "attribute2"
    t.text "attribute2_no"
    t.boolean "attribute3"
    t.text "attribute3_no"
    t.text "overall_performance"
    t.text "feedback"
    t.string "professional_concerns"
    t.string "concern_comments"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["response_id"], name: "index_preceptor_assesses_on_response_id"
    t.index ["user_id"], name: "index_preceptor_assesses_on_user_id"
  end

  create_table "preceptor_evals", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "permission_group_id"
    t.integer "ics1", limit: 2
    t.integer "ics2", limit: 2
    t.integer "ics4", limit: 2
    t.integer "ics6", limit: 2
    t.integer "ics7", limit: 2
    t.integer "pbli1", limit: 2
    t.integer "pbli8", limit: 2
    t.integer "pppd1", limit: 2
    t.integer "pppd2", limit: 2
    t.integer "pppd6", limit: 2
    t.integer "pppd9", limit: 2
    t.integer "sbpic2", limit: 2
    t.integer "sbpic4", limit: 2
    t.integer "sbpic5", limit: 2
    t.string "preceptor_name"
    t.date "submit_date"
    t.string "term"
    t.string "grade"
    t.string "professional_concerns"
    t.string "concern_comments"
    t.text "mspe_comments"
    t.text "comments"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id", "permission_group_id"], name: "by_user_permission_group_id"
    t.index ["user_id"], name: "index_preceptor_evals_on_user_id"
  end

  create_table "question_widgets", id: :serial, force: :cascade do |t|
    t.integer "role_aggregate_id"
    t.integer "lime_question_qid"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "agg", limit: 255
    t.string "pk", limit: 255
    t.integer "user_id"
    t.string "graph_type", limit: 255
    t.string "view_type"
  end

  create_table "role_aggregates", id: :serial, force: :cascade do |t|
    t.string "pk_fieldname", limit: 255
    t.integer "lime_survey_sid"
    t.text "agg_fieldname"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "pk_title_fieldname", limit: 255
    t.string "view_type", limit: 255
    t.string "pk_label", limit: 255
    t.string "agg_label", limit: 255
    t.string "agg_title_fieldname", limit: 255
    t.string "default_view", limit: 255
  end

  create_table "rooms", id: :serial, force: :cascade do |t|
    t.string "identifier"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "discussable_id"
    t.string "discussable_type"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_token"
    t.datetime "expires_at"
    t.datetime "last_seen_at"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "student_lists", primary_key: "sid", id: { type: :string, limit: 10 }, force: :cascade do |t|
    t.string "full_name", limit: 50
    t.bigint "user_id"
    t.integer "permission_group_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "name"
    t.boolean "selected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "temp_competencies", id: false, force: :cascade do |t|
    t.bigint "id"
    t.bigint "user_id"
    t.bigint "permission_group_id"
    t.string "student_uid"
    t.string "email"
    t.string "medhub_id"
    t.string "course_name"
    t.string "course_id"
    t.date "start_date"
    t.date "end_date"
    t.date "submit_date"
    t.string "evaluator"
    t.string "final_grade"
    t.string "environment"
    t.integer "ics1", limit: 2
    t.integer "ics2", limit: 2
    t.integer "ics3", limit: 2
    t.integer "ics4", limit: 2
    t.integer "ics5", limit: 2
    t.integer "ics6", limit: 2
    t.integer "ics7", limit: 2
    t.integer "ics8", limit: 2
    t.integer "mk1", limit: 2
    t.integer "mk2", limit: 2
    t.integer "mk3", limit: 2
    t.integer "mk4", limit: 2
    t.integer "mk5", limit: 2
    t.integer "pbli1", limit: 2
    t.integer "pbli2", limit: 2
    t.integer "pbli3", limit: 2
    t.integer "pbli4", limit: 2
    t.integer "pbli5", limit: 2
    t.integer "pbli6", limit: 2
    t.integer "pbli7", limit: 2
    t.integer "pbli8", limit: 2
    t.integer "pcp1", limit: 2
    t.integer "pcp2", limit: 2
    t.integer "pcp3", limit: 2
    t.integer "pcp4", limit: 2
    t.integer "pcp5", limit: 2
    t.integer "pcp6", limit: 2
    t.integer "pppd1", limit: 2
    t.integer "pppd2", limit: 2
    t.integer "pppd3", limit: 2
    t.integer "pppd4", limit: 2
    t.integer "pppd5", limit: 2
    t.integer "pppd6", limit: 2
    t.integer "pppd7", limit: 2
    t.integer "pppd8", limit: 2
    t.integer "pppd9", limit: 2
    t.integer "pppd10", limit: 2
    t.integer "pppd11", limit: 2
    t.integer "sbpic1", limit: 2
    t.integer "sbpic2", limit: 2
    t.integer "sbpic3", limit: 2
    t.integer "sbpic4", limit: 2
    t.integer "sbpic5", limit: 2
    t.text "prof_concerns"
    t.text "comm_prof_concerns"
    t.text "overall_summ_comm_perf"
    t.text "add_comm_on_perform"
    t.text "mspe"
    t.text "clinic_exp_comment"
    t.text "feedback"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "ume_assess_plans", force: :cascade do |t|
    t.string "year"
    t.string "competency"
    t.string "student_learning_objective"
    t.string "assessment_description"
    t.string "method"
    t.string "target"
    t.string "resource"
    t.boolean "target_met"
    t.string "target_results"
    t.boolean "rubric_used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ume_blses", force: :cascade do |t|
    t.bigint "user_id"
    t.date "expiration_date"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ume_blses_on_user_id"
  end

  create_table "user_externals", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "ident", limit: 255
    t.string "ident_type", limit: 255
    t.boolean "use_email", default: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "p4_program_id"
    t.text "roles"
    t.string "full_name", limit: 255
    t.string "username", limit: 255
    t.datetime "locked_at", precision: nil
    t.boolean "is_ldap", default: false
    t.integer "permission_group_id"
    t.integer "cohort_id"
    t.string "ls_list_state", default: "dirty"
    t.string "coaching_type"
    t.integer "prev_permission_group_id"
    t.string "spec_program"
    t.string "sid"
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.boolean "subscribed", default: false, null: false
    t.date "matriculated_date"
    t.boolean "new_competency", default: false
    t.string "former_name"
    t.string "career_interest", default: [], array: true
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["sid"], name: "index_users_on_sid", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  create_table "usmle_exams", force: :cascade do |t|
    t.bigint "user_id"
    t.string "exam_type"
    t.integer "no_attempts"
    t.string "pass_fail"
    t.integer "exam_score"
    t.datetime "exam_date", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_usmle_exams_on_user_id"
  end

  create_table "version_notes", id: :serial, force: :cascade do |t|
    t.text "note"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "versions", id: :serial, force: :cascade do |t|
    t.string "item_type", limit: 255, null: false
    t.integer "item_id", null: false
    t.string "event", limit: 255, null: false
    t.string "whodunnit", limit: 255
    t.text "object"
    t.datetime "created_at", precision: nil
    t.text "object_changes"
    t.integer "version_note_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["version_note_id"], name: "index_versions_on_version_note_id"
  end

  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "artifacts", "users"
  add_foreign_key "cohorts", "users"
  add_foreign_key "competencies", "permission_groups"
  add_foreign_key "competencies", "users"
  add_foreign_key "course_schedules", "courses"
  add_foreign_key "csl_evals", "users"
  add_foreign_key "csl_feedbacks", "users"
  add_foreign_key "eg_cohorts", "users"
  add_foreign_key "epa_masters", "users"
  add_foreign_key "epas", "users"
  add_foreign_key "fom_exams", "users"
  add_foreign_key "formative_feedbacks", "users"
  add_foreign_key "med18_competencies", "permission_groups"
  add_foreign_key "med19_competencies", "permission_groups"
  add_foreign_key "med20_competencies", "permission_groups"
  add_foreign_key "med21_competencies", "permission_groups"
  add_foreign_key "med23_mspes", "users"
  add_foreign_key "med24_mspes", "users"
  add_foreign_key "med25_mspes", "users"
  add_foreign_key "med26_mspes", "users"
  add_foreign_key "precep_meetings", "users"
  add_foreign_key "preceptor_assesses", "users"
  add_foreign_key "preceptor_evals", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "student_lists", "users"
  add_foreign_key "sub_categories", "categories"
  add_foreign_key "usmle_exams", "users"
end
