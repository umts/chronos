module RequestsHelper
  # Anybody that can update or approve requests can view, and anyone can view
  # approved requests.
  def can_view_request
    can_approve_request || can_update_request || @request.approved?
  end

  # Only supervisors can update requests, nobody can update their own request
  def can_approve_request
    @request.user.nested_supervisors.include?(@current_user) && !@request.rejected?
  end

  # Only the user that created the request can update it
  def can_update_request
    (@current_user == @request.user) && @request.pending?
  end
end
