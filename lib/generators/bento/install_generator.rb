require 'active_support/secure_random'

module Bento
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "Creates a Bento initializer."

      def copy_initializer
        template "bento.rb", "config/initializers/bento.rb"
      end
    end
  end
end