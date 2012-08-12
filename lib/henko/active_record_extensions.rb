require 'rails'

module Henko
  require 'henko/railtie' if defined?(Rails)

  module ActiveRecordExtensions
    extend ActiveSupport::Concern

    included do
      after_create do
        Henko::LogManager.audit_model({ record: self, action: 'create' })
      end
      after_update do
        Henko::LogManager.audit_model( {record: self, action: 'update' })
      end
      after_destroy do
        Henko::LogManager.audit_model({ record: self, action: 'destroy' })
      end
    end
  end
end
