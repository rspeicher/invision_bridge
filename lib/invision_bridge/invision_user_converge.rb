module InvisionBridge
  class InvisionUserConverge < ActiveRecord::Base
    include ActiveRecord::Acts::InvisionBridge

    establish_bridge('members_converge')
    belongs_to :user, :class_name => "InvisionUser", :foreign_key => "user_id"
  end
end