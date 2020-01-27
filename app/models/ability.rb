# Authorization Model
class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    # alias_action :home, :profile, :transaction_history, to: :page_views

    # user ||= User.new # guest user (not logged in)
    # if user && user.has_role? :admin
    #   can :manage, :all
    #   cannot :page_views, :pages
    # elsif user && user.has_role? :user
    #   # can :read, :all
    #   # can :page_views, :pages
    #   cannot :access, :rails_admin
    #   cannot :manage, :rails_admin
    # else
    #   # can :read, :all
    #   # can :page_views, :pages
    #   cannot :manage, :rails_admin
    #   cannot :access, :rails_admin
    # end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
