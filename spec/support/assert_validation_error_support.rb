module AssertValidationErrorSupport
  def validation_error(model, field, rule)
    error_message =
      I18n.t 'errors.format',
      attribute: I18n.t("activerecord.attributes.#{model}.#{field}"), message: I18n.t("errors.messages.#{rule}")
    
    error_message.gsub('%{attribute}', I18n.t("activerecord.attributes.#{model}.#{field}"))
  end
end
 
RSpec.configure do |config|
  config.include AssertValidationErrorSupport
end
