RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  config.model Brand do
    configure :brand_categories do
      visible false
    end

    configure :pre_order do
      visible false
    end

    configure :product do
      visible false
    end

    list do
      include_fields :id, :name, :logo, :created_at, :updated_at
    end
  end

  config.model BrandCategory do
    visible false
  end

  config.model Category do
    configure :brands do
      visible false
    end

    configure :brand_categories do
      visible false
    end

    configure :products do
      visible false
    end

    configure :pre_orders do
      visible false
    end

    list do
      include_fields :id, :name, :created_at, :updated_at
    end
  end

  config.model Cart do
    list do
      include_fields :id, :user, :created_at, :updated_at
    end
  end

  config.model ItemType do
    list do
      include_fields :id, :name, :created_at, :updated_at
    end
  end

  config.model OrderStatus do
    list do
      include_fields :id, :name, :created_at, :updated_at
    end
  end

  config.model PaymentOrderStatus do
    configure :orders do
      visible false
    end

    list do
      include_fields :id, :name, :created_at, :updated_at
    end
  end

  config.model Product do
    configure :cart_product do
      visible false
    end

    configure :order_products do
      visible false
    end

    configure :pre_orders do
      visible false
    end
    configure :brands do
      visible false
    end

    configure :products do
      visible false
    end
  end

  config.model User do
    configure :cart do
      visible false
    end

    configure :orders do
      visible false
    end

    configure :reset_password_sent_at do
      visible false
    end

    configure :remember_created_at do
      visible false
    end

    list do
      include_fields :id, :first_name, :last_name, :email, :created_at, :updated_at
    end
  end

  config.model Batch do
    configure :orders do
      visible false
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
