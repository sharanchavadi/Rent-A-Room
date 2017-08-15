class Ability
  include CanCan::Ability

  def initialize(user)
    # user not logged in 
    if user.nil?
        can :read, [City, Amenity]
    elsif user.role? "admin"
        can :manage, [City, Amenity, User]
        can [:create, :read, :update], Role
    elsif user.role? "host"
        can :read, [City, Amenity]
    elsif user.role? "guest"
        can :read, [City, Amenity]
    end
  end
end
