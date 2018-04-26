module RequestsHelper
  # Anybody that can update or approve requests can view, and anyone can view
  # approved requests.
  def can_view_request
    can_approve_request || can_update_request || @request.approved
  end

  # Only supervisors can update requests
  def can_approve_request
    @current_user.is_supervisor
  end

  # Only the user that created the request can update it
  def can_update_request
    @current_user == @request.user
  end
end
