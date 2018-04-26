class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_user
  # paper trail
  before_action :set_paper_trail_whodunnit

  def current_user
    # TODO: figure out the best way to set the current user
    @current_user = User.second
  end
end
