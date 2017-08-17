class Ability
  include CanCan::Ability

  def initialize(user)
    # user not logged in 
    if user.nil?
        can :read, [City, Amenity, Room]
    elsif user.role? "admin"
        can :manage, [City, Amenity, User, Room]
        can [:create, :read, :update], Role
    elsif user.role? "host"
        can [:read, :create], [City, Amenity, Room]
        can [:update, :destroy], Room do |room|
           room.user == user
        end
    elsif user.role? "guest"
        can :read, [City, Amenity, Room]
        can :create, Room
    end
  end
end
