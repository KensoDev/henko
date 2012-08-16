require 'active_support'
module Henko
  class LogManager
    cattr_accessor :user_id, :user_ip, :action_url
    
    def self.audit_model(options = {})
      record = options[:record]
      action = options[:action]

      return unless record && options

      changes         = record.changes.dup
      current_user_id = Henko::LogManager.user_id

      audit_log            = Henko::AuditLog.new
      audit_log.class_name = record.class.name
      audit_log.user_id    = current_user_id if current_user_id
      audit_log.action     = options[:action]
      audit_log.action_url = Henko::LogManager.action_url if Henko::LogManager.action_url
      audit_log.user_ip    = Henko::LogManager.user_ip if Henko::LogManager.user_ip

      audit_log.model_changes  = changes.to_json
      audit_log.model_snapshot = record.to_json

      audit_log.save

      return true
    end
  end
end
