class Room < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :city
    
	validates_presence_of :name, :description, :price, :rules, :minimum_days, :address, :latitude, :longitude, :is_authorized, :city_id, :user_id
	validates_numericality_of :price, :minimum_days, :latitude, :longitude, :city_id, :user_id
end
