module UserRoles
  extend ActiveSupport::Concern
  def admin_permissions?
    admin
  end
end