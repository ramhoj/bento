module Bento
  module Models
    module Modules
      module Trial
        def self.included(base)
          base.class_eval do
            define_method("trial_days_remaining") do
              created_at.advance(:days => 30).to_date - Date.today
            end
          end
        end
      end
    end
  end
end