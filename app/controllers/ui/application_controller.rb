class Ui::ApplicationController < Administrate::ApplicationController
  include AdministrateExportable::Exporter
  include PublicActivity::StoreController
  around_action :use_time_zone
  prepend_before_action :check_signed_in!
  before_action :set_paper_trail_whodunnit

  def check_signed_in!
    return if signed_in?

    redirect_to pages_home_path
  end

  # Disable 'edit' and 'destroy' links.
  def valid_action?(name, resource = resource_class)
    %w[new edit destroy].exclude?(name.to_s) && super
  end

  def info_for_paper_trail
    {
      whodunnit_type: current_user.class.name,
      whodunnit: current_user.id.to_s
    }
  end

  private

  def use_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
