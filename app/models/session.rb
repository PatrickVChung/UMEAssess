class Session < ApplicationRecord
  belongs_to :user

  before_create :set_expiration

  scope :active, -> { where("expires_at > ?", Time.current) }

  def expired?
    expires_at.nil? || expires_at < Time.current
  end

  def refresh!
    update!(
      last_seen_at: Time.current,
      expires_at: 30.minutes.from_now
      )
    touch
  end

  private

  def set_expiration
    self.expires_at ||= 30.minutes.from_now
    self.last_seen_at ||= Time.current
  end
end
