class Ability
  include CanCan::Ability

  def initialize(user)
    # alias_action :home, :brand_category, :category, :shipping_type, :cart, :add_to_cart, :non_on_hand_add_to_cart, :increase_product_quantity, :decrease_product_quantity, :delete_cart_product, :profile, :update_successful, :sub_totals, :save_order, :complete_purchase, :transaction_history, :order_product, :calculator, :calculate, :product_info, :shipping_address_obj, :save_shipping_address, to: :pages_views_and_actions
    # # Define abilities for the passed in user here. For example:
    # user ||= User.new # guest user (not logged in)
    # if user.present?
    #   if user.admin?
    #     can :manage, :all
    #     cannot :pages_views_and_actions, :pages
    #   else
    #     can :pages_views_and_actions, :pages       
    #     cannot :access, :rails_admin
    #     # can :read, :all
    #   end
    # else
    #   can :pages_views_and_actions, :pages      
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
