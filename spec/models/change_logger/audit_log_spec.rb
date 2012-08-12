require 'spec_helper'

describe Henko::AuditLog do
  it "should create the log" do
    log = Henko::AuditLog.create(action: 'destroy', action_url: '/something', user_id: 1, class_name: 'User', data: nil)
    Henko::AuditLog.count.should == 1
    
    log = Henko::AuditLog.first
    log.user_id.should == "1"
    log.action.should == "destroy"
  end
end
