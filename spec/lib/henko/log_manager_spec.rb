require 'spec_helper'

describe Henko::LogManager do

  subject { Henko::LogManager  }

  it "should should have a user_id" do
    subject.user_id = 1
    subject.user_id.should == 1
  end

  it "should should have a user_ip" do
    subject.user_ip = '127.0.0.1'
    subject.user_ip.should == '127.0.0.1'
  end
  
  it "should should have an action_url" do
    subject.action_url = '/some_action'
    subject.action_url.should == '/some_action'
  end

  describe :audit_model do
    before(:each) do
      subject.user_id = 1
      subject.action_url = "/some_action"
      subject.user_ip = "127.0.0.1"

      @user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
    end

    it "should save all data correctly when model is created" do
      subject.audit_model({ record: @user, action: 'create' })
      
      audit_log = Henko::AuditLog.first
      audit_log.action.should == 'create'
      audit_log.user_id.should == "1"
      audit_log.user_ip.should == "127.0.0.1"
      audit_log.class_name.should == 'User'
      audit_log.data.should include(@user.first_name)
    end
    
    it "should save all data correctly when model is updated" do
      @user.first_name = "Avi"
      subject.audit_model({ record: @user, action: 'update' })
      audit_log = Henko::AuditLog.last
      audit_log.data.should include("Avi")
    end
  end
end
