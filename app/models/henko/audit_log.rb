module Henko
  class AuditLog
    include Mongoid::Document

    field :action, type: String
    field :action_url, type:String
    field :user_id, type: String
    field :class_name, type: String
    field :user_ip, type: String

    field :model_changes, type: String
    field :model_snapshot, type: String

    index :user_id, sparse: true
    index :action
    index :class_name
  end
end
