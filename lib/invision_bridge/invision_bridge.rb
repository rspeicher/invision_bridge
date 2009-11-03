# Pretty much a copy-paste from connection_ninja
module ActiveRecord
  module Acts
    module InvisionBridge
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      module ClassMethods
        def establish_bridge(table)
          config = YAML::load(File.open(File.dirname(__FILE__) + '/../../config/database.yml'))
          config = config['invision_bridge']
          establish_connection(config)
          
          unloadable # http://www.dansketcher.com/2009/05/11/cant-dup-nilclass/
          set_table_name "#{config['prefix']}#{table}"
          set_primary_key 'converge_id' if table == 'members_converge'
        end
      end
    end
  end
end
