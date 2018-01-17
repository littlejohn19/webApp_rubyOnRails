class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin_user!

  def ensure_admin_user!
    if !current_user.admin? and (request.path.start_with?('/admin/events') or request.path.start_with?('/admin/archive'))
      redirect_to root_path
    end
  end

  layout 'admin'
end
