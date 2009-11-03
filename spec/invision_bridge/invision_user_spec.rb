require File.dirname(__FILE__) + '/../spec_helper'

describe InvisionUser do
  it "should do something" do
    @user = InvisionUser.new
    @user.should be_an InvisionUser
  end
end

# describe InvisionUser do
#   before(:each) do
#     @user = InvisionUser.make_unsaved
#     @user.converge = InvisionUserConverge.make
#   end
#   
#   it "should provide a method to get converge_pass_hash" do
#     @user.converge_password.should eql(@user.converge.converge_pass_hash)
#   end
#   
#   it "should provide a method to getconverge_pass_salt" do
#     @user.converge_salt.should eql(@user.converge.converge_pass_salt)
#   end
#   
#   it "should know if a user is an admin" do
#     @user.is_admin?.should be_false
#   end
#   
#   it "should take an associated member" do
#     member = mock_model(Member, :name => 'Name')
#     @user = InvisionUser.make_unsaved(:member => member)
#     @user.member.name.should eql('Name')
#   end
# end
