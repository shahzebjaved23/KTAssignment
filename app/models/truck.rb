class Truck < ApplicationRecord

	acts_as_tenant(:company)

	validates_presence_of :number
	validates_uniqueness_of :number
	belongs_to :company
end
