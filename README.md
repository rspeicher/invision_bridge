# InvisionBridge

Allows your Authlogic-based User model to authenticate using an IP.Board 3.x database.

## Usage

### Database configuration

Modify your `config/database.yml` file to include your IP.Board database information:

    invision_bridge_development:
      adapter: mysql
      database: my_forums_development
      host: localhost
      user: username
      password: password
      prefix: ibf_

    invision_bridge_production:
      adapter: mysql
      database: my_forums
      host: localhost
      user: username
      password: password
      prefix: ibf_

### Model creation

Modify or create your User model to inherit from `InvisionBridge::User::Base`

    class User < InvisionBridge::User::Base
    end

That's it. You can further customize your model as needed. For example, you may
have a group of administrators on your forum that you want to be administrators
in your Rails application.

    class User < InvisionBridge::User::Base
      ADMIN_GROUP = 1

      def is_admin?
        self.member_group_id == ADMIN_GROUP
      end
    end

## Known Issues

While using this in my own production application, I'd occasionally get "MySQL
server has gone away" exceptions popping up. I still don't know the root cause,
but I was able to make the error stop appearing by adding `reconnect: true` to the
`invision_bridge_production` database definition.

## Credits

Copyright (c) 2009 Robert Speicher, released under the MIT license