# config/initializers/session_store.rb

# Setting expire_after to nil creates a transient "session cookie"
# that the browser deletes when closed.
Rails.application.config.session_store :cookie_store,
  key: '_ume_session',
  expire_after: nil
