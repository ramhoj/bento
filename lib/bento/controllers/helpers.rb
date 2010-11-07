module Bento
  module Controllers
    module Helpers
      mattr_accessor :resource_names
      @@resource_names = []

      def self.define_helpers(resource_name)
        @@resource_names << resource_name

        ActiveSupport.on_load(:action_controller) do
          @@resource_names.uniq.each do |name|
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