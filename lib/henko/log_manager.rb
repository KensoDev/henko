module Henko
  class LogManager
    cattr_accessor :user_id, :user_ip, :action_url
    
    def self.audit_model(options = {})
      record = options[:record]
      action = options[:action]

      return unless record && options

      changes = record.changes
      current_user_id = Henko::LogManager.user_id

      audit_log = Henko::AuditLog.new
      audit_log.class_name = record.class.name
      audit_log.user_id = current_user_id if current_user_id
      audit_log.action = options[:action]
      audit_log.action_url = Henko::LogManager.action_url if Henko::LogManager.action_url
      audit_log.user_ip = Henko::LogManager.user_ip if Henko::LogManager.user_ip

      audit_log.data = changes.to_json

      if action == 'update'
        changes.each_key do |key|
          values= changes[key]
          prev_value = values[0]
          new_value = values[1]
          audit_log.data += "\n\nupdate #{key} from #{prev_value.nil? ? 'NIL' : prev_value} to #{new_value.nil? ? 'NIL' : new_value}\n"  
        end
      end
      audit_log.save

      return true
    end
  end
end
