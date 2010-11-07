require 'bento/rails/routes'

module Bento
  class Engine < ::Rails::Engine
    # Force routes to be loaded if we are doing any eager load.
    config.before_eager_load { |app| app.reload_routes! }

    initializer "bento.url_helpers" do
      Bento.include_helpers(Bento::Controllers)
    end
  end
end