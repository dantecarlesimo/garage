module ApplicationHelper
  #including the following methods from devise so sign-in/sign-out are available anywhere
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # def stored_locations_for(resource)
  #   nil
  # end

  def after_sign_in_path_for(resource)
    # redirect_to user_sales_path
    '/user_sales'
  end

end
