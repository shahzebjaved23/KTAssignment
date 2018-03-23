class Trip < ApplicationRecord

	include TripOverlapValidations

	belongs_to :user
	belongs_to :truck
	belongs_to :company

	acts_as_tenant(:company)

	validates_presence_of :starting

end
