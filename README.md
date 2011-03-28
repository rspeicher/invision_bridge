# InvisionBridge ![](http://stillmaintained.com/tsigo/invision_bridge.png)

Allows your [Authlogic](http://github.com/binarylogic/authlogic)-based user model to authenticate using an [IP.Board](http://www.invisionpower.com/) 3.x database.

## Usage

### Database configuration

You'll need to **manually** alter the `ibf_members` table in your IP.Board database to
add the following fields for use by Authlogic:

    persistence_token             varchar(255)          NOT NULL
    last_request_at               datetime              NULL
    current_login_at              datetime              NULL
    last_login_at                 datetime              NULL
    current_login_ip              varchar(255)          NULL
    last_login_ip                 varchar(255)          NULL
    single_access_token           varchar(255)          NULL

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

Modify or create your User model to include `InvisionBridge`

    class User < ActiveRecord::Base
      include InvisionBridge
    end

That's it. You can further customize your model as needed. For example, you may
have a group of administrators on your forum that you want to be administrators
in your Rails application.

    class User < ActiveRecord::Base
      include InvisionBridge

      ADMIN_GROUP = 1

      def is_admin?
        self.member_group_id == ADMIN_GROUP
      end
    end

### ORM Adapters

Currently InvisionBridge only works with ActiveRecord models. I'd love to add a DataMapper adapter if/when I need one.

## Known Issues

While using this in my own production application, I'd occasionally get "MySQL
server has gone away" exceptions popping up. I still don't know the root cause,
but I was able to make the error stop appearing by adding `reconnect: true` to the
`invision_bridge_production` database definition.

## Credits

Copyright (c) 2010 Robert Speicher, released under the MIT license
