class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_user

  # paper trail
  before_action :set_paper_trail_whodunnit

  private

  def set_current_user
    @current_user =
      if session.key? :swipe_id # swipe in at timeclock
        User.active.find_by(swipe_id: session[:swipe_id])
      elsif session.key? :user_id
        User.active.find_by(id: session[:user_id])
      elsif request.env['fcIdNumber'] # shibboleth
        user = User.active.find_by(spire_id: request.env['fcIdNumber'])
        session[:user_id] = user.id
        user
      elsif Rails.env.development?
        User.second
      end
  end
end
