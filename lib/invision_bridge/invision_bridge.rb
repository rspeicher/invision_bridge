module InvisionBridge
  module Base
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def establish_bridge()
        if Rails
          config_file  = Rails.configuration.database_configuration_file
          config_group = "invision_bridge_#{Rails.env}"
        else
          config_file  = File.join(File.dirname(__FILE__), '..', '..', 'config', 'database.yml')
          config_group = "invision_bridge"
        end

        config = YAML::load(File.open(config_file))
        config = config[config_group]

        if config.nil?
          raise "Unable to read database configuration from #{config_file} -- Make sure an #{config_group} definition exists."
        else
          config['prefix'] ||= 'ibf_'
        end

        establish_connection(config)

        unloadable # http://www.dansketcher.com/2009/05/11/cant-dup-nilclass/
        set_table_name "#{config['prefix']}members"
        set_primary_key "member_id"
      end
    end
  end
end
