class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Raises an exception if authorize has not been called in a controller, except for indexes
  # after_filter :verify_authorized, :except => :index

  # Add a custom flash type for errors
  add_flash_types :error
end
