module Bento
  module Generators
    module OrmHelpers
      def model_contents
<<-CONTENT
  # Include all bento modules. Others available are:
  # :all, :validations, :user_accessors, :user_association, :user_accessors, :trial
  bento

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name
CONTENT
      end

      def user_model_content
<<-CONTENT
  has_many :bento_memberships
  has_many :#{table_name}, :through => :bento_memberships

  #
  # Remove this method call unless you want to work with
  # the has_many :through association as if it was a simple
  # belongs_to :#{class_name.underscore}.
  #
  # If you know for sure that you don't want to be able
  # to have users that belongs to several #{table_name} you
  # can of course edit the generated migration files to
  # not create the join model table "bento_memberships" and instead
  # add a #{class_name.underscore}_id to your User model.
  #
  # You also need to not use the :user_association module in bento
  # for example to use all in your #{class_name} model change the
  # call to bento from `bento :all` to bento `:validations, :user_accessors, :user_accessors, :trial`
  # then you just remove the above relations and remove the "fake_" part below.
  #
  fake_belongs_to :#{class_name.underscore}
CONTENT
      end

      def bento_membership_model_content
<<-CONTENT
class BentoMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :#{class_name.underscore}

  attr_accessible :#{class_name.underscore}_id, :user_id
end
CONTENT
      end

      def model_exists?
        File.exists?(File.join(destination_root, model_path))
      end

      def bento_membership_exists?
        File.exists?(File.join(destination_root, bento_membership_path))
      end

      def model_path
        @model_path ||= File.join("app", "models", "#{file_path}.rb")
      end

      def bento_membership_path
        @bento_membership_path ||= File.join("app", "models", "bento_membership.rb")
      end

      def user_path
        @user_path ||= File.join("app", "models", "user.rb")
      end
    end
  end
end