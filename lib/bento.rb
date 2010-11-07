module Bento
  require "bento/rails"
  require "bento/models/account"

  mattr_accessor :models
  @@models = %w[Account]

  # PRIVATE CONFIGURATION

  # Store scopes mappings.
  # mattr_reader :mappings
  # @@mappings = ActiveSupport::OrderedHash.new

  def self.configure
    yield self
  end

  def self.define_helpers(resource)
    Bento::Controllers::Helpers.define_helpers(resource)
  end

  def self.include_helpers(scope)
    ActiveSupport.on_load(:action_controller) do
      include scope::Helpers
    end

    ActiveSupport.on_load(:action_view) do
      include scope::Helpers
    end
  end

  # def self.add_mapping(resource, options)
  #   mapping = Bento::Mapping.new(resource, options)
  #   @@mappings[mapping.name] = mapping
  #   @@default_scope ||= mapping.name
  #   @@helpers.each { |h| h.define_helpers(resource) }
  #   mapping
  # end

  # TODO: thise file needs to be required AFTER rails has been loaded
  # Find out if this can be done trough the railstie in some way.
  require "bento/controllers/helpers"
  require "bento/controllers/account_scopable"
end