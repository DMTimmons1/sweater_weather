class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  before_create :create_api_key

private

  def create_api_key
		self.api_key = SecureRandom.hex(15)
	end  
end
