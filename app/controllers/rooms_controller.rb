class RoomsController < ApplicationController

   before_action :authenticate_user!

   load_and_authorize_resource
    
    def index
        @rooms = Room.all
    end

    def new
        @room = Room.new
        @image = Image.new        
    end


    def create
        @room = Room.new(room_params)
        @room.user_id = current_user.id
        
        if @room.save
            redirect_to room_path(@room.id), notice: "Successfully created #{@room.name}"
        else
            render action: "new"
        end
    end 


    def show
        begin
           @room = Room.find(params[:id])
        rescue ActiveRecord::RecordNotFound
           redirect_to rooms_path, notice: "Record not found"
       end
    end

    def edit
        @room = Room.find(params[:id])
    end

    def update
        @room = Room.find(params[:id])
        if @room.update_attributes(room_params)
            redirect_to room_path(@room.id), notice: "Successfully updated"
        else
            render action: "edit"
        end
    end
    
    def destroy
        @room = Room.find(params[:id])
        @room.destroy
        redirect_to rooms_path, notice: "Successfully deleted #{@room.name}"
    end
    
    def my_rooms
      authorize! :my_rooms, Room.new
      @room = current_user.rooms
    end

    def unauthorized_rooms
        authorize! :unauthorized_rooms, Room.new
        @rooms = Room.where('is_verified = ?', false)
    end


    private
  
    def room_params
       params[:room].permit(:name, :description, :price, :rules, :minimum_days, :address, :latitude, :longitude, :is_verified, :city_id, :user_id, images_attributes:[:id, :image, :room_id], amenity_ids: [])
    end
    
end
