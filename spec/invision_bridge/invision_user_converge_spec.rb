require File.dirname(__FILE__) + '/../spec_helper'

describe InvisionBridge::InvisionUserConverge do
  before(:each) do
    @user = InvisionBridge::InvisionUser.make_unsaved
    @converge = InvisionBridge::InvisionUserConverge.make
    @converge.user = @user
  end
  
  it "should belong to a user" do
    @converge.user.should eql(@user)
  end
end