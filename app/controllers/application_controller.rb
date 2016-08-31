class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    # TODO: Fetch the logged in user
  end
end
