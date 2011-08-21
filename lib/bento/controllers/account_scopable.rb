module Bento
  module Controllers
    module AccountScopable
      mattr_accessor :resource_names
      @@resource_names = []

      def self.define_methods(resource_name)
        @@resource_names << resource_name.to_s.singularize
        @@name = @@resource_names.first

        ActiveSupport.on_load(:action_controller) do
          class_eval do
            def admin?
              respond_to_admin? and current_user.admin?
            end

            def not_responding_to_admin?
              (not respond_to_admin?)
            end

            def respond_to_admin?
              current_user.respond_to?(:admin?)
            end
          end

          @@resource_names.uniq.each do |name|
            (class << self; self; end).send(:define_method, "scoped_to_#{name}") do
              inherit_resources

              class_eval do
                private

                # This is where things get scoped.
                # If you're using inherit_resources it will automaticly
                # call your associations on this method.
                # In your own code you would just use current_<my account like model>-method.
                def begin_of_association_chain
                  begining = instance_variable_get("@#{@@name}".to_sym)
                  return begining if begining

                  begining = send("current_#{@@name}")
                  instance_variable_set("@#{@@name}".to_sym, begining)
                  begining
                end

                def bento_resource_by_param_or_session
                  if bento_resource_id
                    @@name.camelcase.constantize.find(bento_resource_id)
                  else
                    current_user.send(@@name)
                  end
                end

                def bento_resource_id
                  key, value = params.find { |key, value| key.to_s.ends_with?("#{@@name}_id") }
                  value
                end
              end

              class_eval <<-RUBY, __FILE__, __LINE__+1
                private

                def current_#{name}
                  if current_user
                    if current_user.#{name}
                      current_user.#{name}
                    elsif not_responding_to_admin? or admin?
                      bento_resource_by_param_or_session
                    end
                  end
                end
              RUBY
            end # define_method
          end # @@resource_names.uniq.each
        end # ActiveSupport.on_load
      end # def self.define_helpers
    end # module AccountScopable
  end # module Controllers
end # module Bento

class ActionController::Base
  extend Bento::Controllers::AccountScopable
end