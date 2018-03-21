class Trip < ApplicationRecord

	belongs_to :user
	belongs_to :truck

	validates_presence_of :starting
end
