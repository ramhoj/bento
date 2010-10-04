module Bento
  module Generators
    class BentoGenerator < Rails::Generators::NamedBase
      namespace "bento"
      source_root File.expand_path("../templates", __FILE__)

      desc "Generates a model with the given NAME (if one does not exist) with bento " <<
           "configuration plus a migration file."

      hook_for :orm
    end
  end
end