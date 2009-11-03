require File.dirname(__FILE__) + '/../spec_helper'

describe InvisionUserConverge do
  before(:each) do
    @user = InvisionUser.make_unsaved
    @converge = InvisionUserConverge.make
    @converge.user = @user
  end
  
  it "should belong to a user" do
    @converge.user.should eql(@user)
  end
end