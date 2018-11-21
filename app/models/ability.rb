class Ability
  include CanCan::Ability
 
  def initialize(user)
    # Define abilities for the passed in user here. For example:
 
    user ||= User.new # guest user (not logged in)
    if user.eltek?
      can :manage, :all

    elsif user.distributor?
      can :read, :all
      cannot :read, Note, {visible: false}
      cannot :read, User
      cannot :create, User
    else
      cannot :read, :all
    end
  end
end