class Ui::ApplicationController < Administrate::ApplicationController
  include AdministrateExportable::Exporter
  before_action :check_signed_in!

  def check_signed_in!
    return if signed_in?

    redirect_to pages_home_path
  end

  # Disable 'edit' and 'destroy' links.
  def valid_action?(name, resource = resource_class)
    %w[new edit destroy].exclude?(name.to_s) && super
  end
end
