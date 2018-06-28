module Activity
  class EventLog < ApplicationRecord
    self.table_name = "activity_logs"

    # Supported field names and scopes for each field
    SUPPORTED_FILTERS = [:user_id, :attached_id, :model, :event, :created_at, :updated_at]
    scope :user_id, -> (value) { where(user_id: value) }
    scope :attached_id, -> (value) { where(attached_id: value) }
    scope :model, -> (value) { where(model: value) }
    scope :event, -> (value) { where(event: value) }

    # Filter that finds all records that match a given request
    # Example Request: attributes = {:attached_id: 1, event: "created_user"}
    # - Will return any records where attached_id = 1 and event = "created_user"
    # - Allows for simple searching with many unique cases
    def self.filter(page, per_page, order_by, attributes)
      logs = attributes.slice(*SUPPORTED_FILTERS).reduce(all) do |scope, (key, value)|
        value.present? ? scope.send(key, value) : scope
      end

      {
        current_page: page,
        total_pages: logs.page(page).per(per_page).total_pages,
        logs: logs.order(order_by).page(page).per(per_page),
      }
    end

    def self.create_log(log)
      self.create!(
        user_id: log[:user_id],
        attached_id: log[:attached_id],
        model: log[:model],
        event: log[:event],
      )
    end
  end
end
