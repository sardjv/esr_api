# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
class Admin::ApplicationController < Administrate::ApplicationController
  include AdministrateExportable::Exporter
  before_action :authenticate_user!

  def authenticate_user!
    return if user_authenticated?

    redirect_to '/'
  end

  def user_authenticated?
    session && session[:userinfo].present?
  end

  # disable 'edit' and 'destroy' links
  def valid_action?(name, resource = resource_class)
    %w[new edit destroy].exclude?(name.to_s) && super
  end

  # Override this value to specify the number of elements to display at a time
  # on index pages. Defaults to 20.
  # def records_per_page
  #   params[:per_page] || 20
  # end
end
