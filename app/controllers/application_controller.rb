class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_user
  # TODO: before_action redirect to timeclock page when swipe_id is in session after timeout

  # paper trail
  before_action :set_paper_trail_whodunnit

  private

  def set_current_user
    @current_user =
      if session.key? :swipe_id
        User.active.find_by(swipe_id: session[:swipe_id])
      elsif session.key? :user_id
        User.active.find_by(id: sesison[:user_id])
      elsif request.env['fcIdNumber']
        user = User.active.find_by(spire_id: request.env['fcIdNumber'])
        session[:user_id] = user.id
        user
      elsif Rails.env.development?
        User.first
      end
  end
end
