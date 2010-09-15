require 'authlogic'
require 'authlogic/crypto_providers/invision_power_board'

module InvisionBridge
  autoload :ActiveRecord, 'invision_bridge/active_record'

  def self.config
    if @config.nil?
      if Rails
        config_file = Rails.configuration.database_configuration_file
        config_group = "invision_bridge_#{Rails.env}"
      else
        config_file = File.join(File.dirname(__FILE__), '..', '..', 'config', 'database.yml')
        config_group = "invision_bridge"
      end

      config = YAML::load(File.open(config_file))
      config = config[config_group]

      if config.nil?
        raise "** [InvisionBridge] Unable to read database configuration from #{config_file} -- Make sure an #{config_group} definition exists."
      else
        config['prefix'] ||= 'ibf_'
      end

      @config = config
    end

    @config
  end

  def self.included(base)
    if base.respond_to? :establish_connection
      base.send(:include, InvisionBridge::ActiveRecord)
    else
      raise "** [InvisionBridge] Currently we only support ActiveRecord models. Sorry."
    end
  end

end
