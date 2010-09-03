require 'authlogic'
require 'authlogic/crypto_providers/invision_power_board'

module InvisionBridge
  autoload :UserBase, 'invision_bridge/user_base'

  mattr_accessor :database_file
  @@database_file = nil

  mattr_accessor :environment
  @@environment = :development

  def self.setup
    yield self

    establish_bridge
  end

  def self.establish_bridge
    raise ArgumentError, "InvisionBridge: database_file and environment must both be set to establish a database connection" unless self.database_file.present? and self.environment.present?

    config_file = self.database_file
    config_group = "invision_bridge_#{self.environment}"

    config = YAML::load(File.open(config_file))
    config = config[config_group]

    if config.nil?
      raise "Unable to read database configuration from #{config_file} -- Make sure an #{config_group} definition exists."
    else
      config['prefix'] ||= 'ibf_'
    end

    UserBase.class_eval do
      # unloadable
      establish_connection(config)
      set_table_name "#{config['prefix']}members"
      set_primary_key "member_id"

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
