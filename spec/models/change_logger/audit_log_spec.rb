require 'spec_helper'

describe ChangeLogger::AuditLog do
  it "should create the log" do
    log = ChangeLogger::AuditLog.create(action: 'destroy', action_url: '/something', user_id: 1, class_name: 'User', data: nil)
    ChangeLogger::AuditLog.count.should == 1
    
    log = ChangeLogger::AuditLog.first
    log.user_id.should == "1"
    log.action.should == "destroy"
  end
end
