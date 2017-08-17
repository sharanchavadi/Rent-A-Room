class RoomsController < ApplicationController

   load_and_authorize_resource
    
    def index
        @rooms = Room.all
    end

    def new
        @room = Room.new
        @room.user_id = current_user.id
        
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

    private
  
    def room_params
       params[:room].permit(:name, :description, :price, :rules, :minimum_days, :address, :latitude, :longitude, :is_authorized, :city_id, :user_id)
    end
    
end
