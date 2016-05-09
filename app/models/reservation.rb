class Reservation < ActiveRecord::Base
	belongs_to :show
	has_and_belongs_to_many :seats
	belongs_to :user
end
