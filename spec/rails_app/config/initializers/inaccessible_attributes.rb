ActiveRecord::Base.send(:attr_accessible, nil)

unless Rails.env.production?
  module ActiveModel
    class MassAssignmentError < StandardError; end
  end

  ActiveModel::MassAssignmentSecurity::Sanitizer.class_eval do
    def warn!(attributes)
      raise ActiveModel::MassAssignmentError, "Can't mass-assign these protected attributes: #{attributes.join(', ')}"
    end
  end
end