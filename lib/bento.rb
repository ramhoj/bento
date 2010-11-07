module Bento
  require "bento/rails"
  require "bento/models/account"

  def self.configure
    yield self
  end

  require "bento/controllers/helpers"
  require "bento/controllers/account_scopable"
end