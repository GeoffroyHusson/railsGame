class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    
    if user.admin?
      can :manage, :all
      can :read, :all
      can :register, :all
      cannot :create, :all
    else
       can :read, :all
       can :register, :all
       cannot :create, :all
    end
  end
end
