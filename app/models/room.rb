class Room < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :city
    
    has_many :amenity_rooms
    has_many :amenities, through: :amenity_rooms
    
	validates_presence_of :name, :description, :price, :rules, :minimum_days, :address, :latitude, :longitude, :city_id, :user_id
	validates_numericality_of :price, :minimum_days, :latitude, :longitude, :city_id, :user_id

	after_create :change_guest_to_host

	private

	def change_guest_to_host
       if self.user.role_id == Role.find_by(name: "guest").id
    	    self.user.role_id = Role.find_by(name: "host").id
          self.user.save
       end
    end
end