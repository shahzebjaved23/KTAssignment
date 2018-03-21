class User < ApplicationRecord
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

	after_create :add_auth_token

	validates_presence_of :first_name, :last_name, :email, :role
	validates_inclusion_of :role, in: ["user", "admin"]

	def add_auth_token
		self.update(auth_token: Devise.friendly_token)
	end
end
