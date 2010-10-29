module Bento
  require "bento/rails"
  require "bento/models/account"

  mattr_accessor :models
  @@models = %w[Account]

  def self.configure
    yield self
  end

  # TODO: thise file needs to be required AFTER rails has been loaded
  # Find out if this can be done trough the railstie in some way.
  require "bento/controllers/helpers"
  require "bento/controllers/account_scopable"
end