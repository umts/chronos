module RequestsHelper
  # Any supervisor can view a request, and any user can view approved requests.
  def can_view_request
    @current_user.is_supervisor || (!@current_user.is_supervisor && @request.approved)
  end

  # Only supervisors can update requests
  def can_update_request
    @current_user.is_supervisor
  end
end
