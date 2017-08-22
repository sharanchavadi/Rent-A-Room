class Ability
  include CanCan::Ability

  def initialize(user)
    # user not logged in 
    if user.nil?
        can :read, [City, Amenity, Room]
    elsif user.role? "admin"
        can :manage, [City, Amenity, User, Room] #do we really want admin to create rooms?
        can :unauthorized_rooms, Room
        can [:create, :read, :update], Role
    elsif user.role? "host"
        can [:create, :read], [Room, Image]
        can :my_rooms, Room
        can [:update, :destroy], Room do |room|
           room.user == user
        end
    elsif user.role? "guest"
        can :read, [City, Amenity, Room]
        can :create, Room
    end
  end
end
