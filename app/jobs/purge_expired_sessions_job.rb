class PurgeExpiredSessionsJob < ApplicationJob
  queue_as :default

  def perform
    # Deletes any session that hasn't been touched in over 15 minutes
    Session.where("updated_at < ?", 30.minutes.ago).delete_all
  end
end
