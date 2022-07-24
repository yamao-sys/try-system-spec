module ApplicationHelper
    def errors(resource, field)
      return if resource&.errors&.full_messages_for(field).blank?

      resource.errors.full_messages_for(field).join('<br>')
    end
end
