class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  belongs_to :permission_group, inverse_of: :users
  
  normalizes :email, with: ->(e) { e.strip.downcase }

  def display_name
    last, first = full_name.split(", ").map(&:strip)
    return "#{first} #{last}"
  end
end
