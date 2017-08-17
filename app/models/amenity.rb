class Amenity < ActiveRecord::Base

	belongs_to :user

	has_many :amenity_rooms
	has_many :rooms, through: :amenity_rooms

	validates_presence_of :name, :description
end
