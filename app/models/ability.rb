class Ability
  include CanCan::Ability
 
  def initialize(user)
    # Define abilities for the passed in user here. For example:
 
    user ||= User.new # guest user (not logged in)

    if User.count == 1
      cannot :destroy, User
    end

    if user.eltek?
      can :manage, :all
      if User.count == 1
        cannot :destroy, User
      end

    elsif user.distributor?
      can :read, :all
      cannot :read, Note, {visible: false}
      cannot :manage, User
      if User.count == 1
        cannot :destroy, User
      end

    else
      cannot :manage, :all
      if User.count == 1
        cannot :destroy, User
      end
    end
  end
end