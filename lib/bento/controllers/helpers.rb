module Bento
  module Controllers
    module Helpers
      def self.included(base)
        account_model_names = [*Bento.models].map { |class_name| class_name.to_s.demodulize.underscore }

        base.class_eval do
          account_model_names.each do |name|
            define_method("current_#{name}") do
              current_user.send(name) if current_user
            end
            helper_method "current_#{name}"
          end
        end
      end
    end
  end
end

class ActionController::Base
  include Bento::Controllers::Helpers
end