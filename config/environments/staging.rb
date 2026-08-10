Rails.application.configure do 
  config.active_storage.variant_processor = :vips
  config.active_storage.service = :production
  config.public_file_server.enable = true
  config.eager_load = true
end

