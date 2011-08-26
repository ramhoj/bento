# Load the rails application
require File.expand_path('../application', __FILE__)
require 'devise'
require 'inherited_resources'
require 'simple_form'
require 'table_for'
require 'show_for'

# Initialize the rails application
RailsApp::Application.initialize!