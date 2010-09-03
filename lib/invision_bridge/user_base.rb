module InvisionBridge
  class UserBase < ActiveRecord::Base
    self.abstract_class = true

    # Authlogic -----------------------------------------------------------------
    attr_accessible :name, :login, :password, :password_confirmation

    # ---------------------------------------------------------------------------
    # Override some AR methods; we don't want to mess with Invision's integrity
    def destroy; end
    def delete; end
    def self.destroy_all; end
    def self.delete_all; end
  end
end
