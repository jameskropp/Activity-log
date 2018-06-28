module Activity
  class EventLog < ApplicationRecord
    self.table_name = "activity_logs"

    SUPPORTED_FILTERS = [:user_id, :attached_id, :model, :event, :created_at, :updated_at]
    scope :user_id, -> (value) { where(user_id: value) }
    scope :attached_id, -> (value) { where(attached_id: value) }
    scope :model, -> (value) { where(model: value) }
    scope :event, -> (value) { where(event: value) }
    scope :created_at, -> (value) { where(created_at: value) }
    scope :updated_at, -> (value) { where(updated_at: value) }

    def self.create_log(log)
      self.create!(
        user_id: log[:user_id],
        attached_id: log[:attached_id],
        model: log[:model],
        event: log[:event],
      )
    end

    def self.filter(attributes)
      attributes.slice(*SUPPORTED_FILTERS).reduce(all) do |scope, (key, value)|
        value.present? ? scope.send(key, value) : scope
      end
    end
  end
end
