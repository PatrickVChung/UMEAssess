Rails.application.configure do 
  config.active_storage.variant_processor = :vips
  config.active_storage.service = :production
end

