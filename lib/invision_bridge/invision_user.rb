module InvisionBridge
  class InvisionUser < ActiveRecord::Base
    include ActiveRecord::Acts::InvisionBridge

    establish_bridge('members')

    # Authlogic -----------------------------------------------------------------
    attr_accessible :login, :password, :password_confirmation
    acts_as_authentic do |c|
      c.crypto_provider          = Authlogic::CryptoProviders::InvisionPowerBoard
      c.login_field              = :name
      c.crypted_password_field   = :converge_password
      c.password_salt_field      = :converge_salt
      # c.validate_fields          = false
      c.validate_password_field  = false
    end
  
    def converge_password
      self.converge.converge_pass_hash
    end
    def converge_salt
      self.converge.converge_pass_salt
    end
  
    # Override some AR methods; we don't want to mess with Invision's integrity
    def destroy; end
    def delete; end
    def self.destroy_all; end
    def self.delete_all; end
  
    has_one :converge, :class_name => "InvisionUserConverge", :foreign_key => "converge_id"
  end
end