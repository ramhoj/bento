module FormErrorsHelper
  def error_message_for(object, message=nil)
    if object.errors.present?
      content_tag(:div, :class => 'form-errors') do
        content_tag(:h3, message || "#{object.class.model_name.human} could not be saved.")
      end
    end
  end
end

ActionView::Helpers::FormBuilder.class_eval do
  def error_message(message=nil)
    @template.error_message_for(@object, message)
  end
end