Rails.application.configure do
  config.active_storage.variant_processor = :vips
  config.active_storage.service = :production
  config.public_file_server.enable = true
  config.eager_load = true
  # Route exceptions to your custom controller
  config.exceptions_app = self.routes

  # Ensure consideration of local responses is false so custom 500 pages render
  config.consider_all_requests_local = false

  # Ensure log level is set to capture backtraces
  config.log_level = :debug # or :info
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
end
