require 'bento/rails/routes'

module Bento
  class Engine < ::Rails::Engine
    initializer "bento.helpers" do
      ActiveSupport.on_load(:action_controller) do
        include Bento::Controllers::Helpers
      end

      ActiveSupport.on_load(:action_view) do
        include Bento::Controllers::Helpers
      end
    end
  end
end