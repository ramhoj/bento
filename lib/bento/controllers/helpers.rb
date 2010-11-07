module Bento
  module Controllers
    module Helpers
      extend ActiveSupport::Concern

      def self.define_helpers(resource_name)
        puts "defining #{resource_name}"
        class_eval do
          define_method("current_#{resource_name}") do
            current_user.send(resource_name) if current_user
          end
        end

        ActiveSupport.on_load(:action_controller) do
          helper_method "current_#{resource_name}"
        end
      end

      # def self.included(base)
      #   account_model_names = [*Bento.models].map { |class_name| class_name.to_s.demodulize.underscore }
      # 
      #   base.class_eval do
      #     account_model_names.each do |name|
      #       define_method("current_#{name}") do
      #         current_user.send(name) if current_user
      #       end
      #       helper_method "current_#{name}"
      #     end
      #   end
      # end
    end
  end
end

# class ActionController::Base
#   include Bento::Controllers::Helpers
# end