# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
class Ui::ApplicationController < Administrate::ApplicationController
  include AdministrateExportable::Exporter
  before_action :check_signed_in!

  def check_signed_in!
    return if signed_in?

    redirect_to pages_home_path
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
