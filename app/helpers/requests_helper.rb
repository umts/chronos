module RequestsHelper
  # Anybody that can update requests can view, and anyone can view approved requests
  def can_view_request
    can_update_request || @request.approved?
  end

  # Only the user that created the request or one of their supervisors can update it
  def can_update_request
    can_update_request_as_owner || can_update_request_as_supervisor
  end

  # Current user is the owner and can update the request
  def can_update_request_as_owner
    (@current_user == @request.user) && (@request.pending? || @current_user.king?)
  end

  # Current user is a supervisor and can update the request as a supervisor
  def can_update_request_as_supervisor
    (@current_user.nested_subordinates.include?(@request.user) && !@request.rejected?)
  end
end
