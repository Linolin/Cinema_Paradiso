class Seat < ActiveRecord::Base
	belongs_to :theater
	has_and_belongs_to_many :reservations
end
