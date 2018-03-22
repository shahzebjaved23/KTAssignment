class Truck < ApplicationRecord

	validates_presence_of :number
	validates_uniqueness_of :number
end
