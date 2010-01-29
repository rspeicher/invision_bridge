module InvisionBridge
  module Base
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def establish_bridge()
        if Rails
          config = YAML::load(File.open(Rails.configuration.database_configuration_file))
          config = config["invision_bridge_#{Rails.env}"]
        else
          config = YAML::load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config', 'database.yml')))
          config = config["invision_bridge"]
        end

        config['prefix'] ||= 'ibf_'

        establish_connection(config)

        unloadable # http://www.dansketcher.com/2009/05/11/cant-dup-nilclass/
        set_table_name "#{config['prefix']}members"
        set_primary_key "member_id"
      end
    end
  end
end
