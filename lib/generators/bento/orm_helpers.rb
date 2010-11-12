module Bento
  module Generators
    module OrmHelpers
      def model_contents
<<-CONTENT
  # Include all bento modules. Others available are:
  # :all, :validations, :user_accessors, :user_association, :user_accessors, :trial
  bento

CONTENT
      end

      def model_exists?
        File.exists?(File.join(destination_root, model_path))
      end

      def model_path
        @model_path ||= File.join("app", "models", "#{file_path}.rb")
      end
    end
  end
end