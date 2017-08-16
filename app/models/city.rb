class City < ActiveRecord::Base

	belongs_to :user
	has_many :rooms

	validates_presence_of :name
end
