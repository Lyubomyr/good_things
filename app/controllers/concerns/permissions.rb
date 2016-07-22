module Permissions
  extend ActiveSupport::Concern

  def admin_only
    message = 'Only admin can access this page.'
    permission_error message unless current_user.admin_permissions?
  end

  def permission_error(message)
    redirect_to(root_path, alert: message)
  end
end