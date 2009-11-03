require File.dirname(__FILE__) + '/../spec_helper'

describe InvisionBridge::InvisionUser do
  before(:each) do
    @user = InvisionBridge::InvisionUser.make_unsaved
    @user.converge = InvisionBridge::InvisionUserConverge.make
  end
  
  it "should provide a method to get converge_pass_hash" do
    @user.converge_password.should eql(@user.converge.converge_pass_hash)
  end
  
  it "should provide a method to get converge_pass_salt" do
    @user.converge_salt.should eql(@user.converge.converge_pass_salt)
  end
  
  describe "for Invision Board integrity" do
    # FIXME: These aren't really testing anything, since we never save the record (make_unsaved)
    %w(destroy delete).each do |method|
      it "should override #{method}" do
        lambda { @user.send(method) }.should_not change(InvisionBridge::InvisionUser, :count)
      end
      
      it "should override self.#{method}_all" do
        lambda { InvisionBridge::InvisionUser.send("#{method}_all") }.should_not change(InvisionBridge::InvisionUser, :count)
      end
    end
  end
end