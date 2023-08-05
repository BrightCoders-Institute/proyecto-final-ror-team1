RailsAdmin.config do |config|
  config.asset_source = :sprockets

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

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.included_models = %w[
    Shipment
    Account
  ]

  config.model 'Shipment' do
    edit do
      fields :tracking_number, :account, :tracking_history do
        read_only true
      end
      field :status, :enum do
        enum do
          %w[
            REGISTERED
            IN_TRANSIT
            LAST_MILE
            DELIVERED
            DELAYED
            LOST
            STOLEN
            CANCELED
          ]
        end
      end
    end
    base do
      fields :tracking_number, :status, :created_at, :account, :tracking_history
      fields do
        read_only true
      end
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
  end
end
