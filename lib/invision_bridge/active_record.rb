module InvisionBridge
  module ActiveRecord
    def self.included(base)
      base.class_eval do
        establish_connection(InvisionBridge.config)

        # IP.Board database design, grumble grumble
        set_table_name "#{InvisionBridge.config['prefix']}members"
        set_primary_key "member_id"

        # Configure Authlogic
        attr_accessible :name, :login, :password, :password_confirmation
        acts_as_authentic do |c|
          c.crypto_provider          = Authlogic::CryptoProviders::InvisionPowerBoard
          c.login_field              = :name
          c.crypted_password_field   = :members_pass_hash
          c.password_salt_field      = :members_pass_salt
          c.validate_password_field  = false
        end
      end
    end
  end
end
