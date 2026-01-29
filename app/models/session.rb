class Session < ApplicationRecord
  belongs_to :user

  before_create :set_expiration

  scope :active, -> { where("expires_at > ?", Time.current) }

  def expired?
    return true if expires_at.nil?
    expires_at < Time.current
  end

  def refresh!
    update!(last_seen_at: Time.current)
  end

  private

  def set_expiration
    self.expires_at ||= 2.weeks.from_now
  end
end
