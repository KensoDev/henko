require 'spec_helper'

describe ChangeLogger::ActiveRecordExtensions do
  it "should create a log when the user is created" do
    ChangeLogger::LogManager.should_receive(:audit_model)
    user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  end

  it "should update a log when the user is updated" do
    user = User.create

    ChangeLogger::LogManager.should_receive(:audit_model)
    
    user.first_name = Faker::Name.first_name
    user.save
  end
  
  it "should create a log when the user is destroyed" do
    user = User.create

    ChangeLogger::LogManager.should_receive(:audit_model)

    user.destroy
  end
end
