module Bento
  module Models
    module User
      def fake_belongs_to(singular)
        singular = singular.to_s
        plural = singular.pluralize

        define_method(singular) do
          send(plural).first
        end

        define_method("#{singular}=") do |record|
          send(plural).each(&:destroy)
          self.send(plural) << record
        end
      end
    end
  end
end

# TODO: only include in the user model
class ActiveRecord::Base
  extend Bento::Models::User
end