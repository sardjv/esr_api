class Ui::DataController < Ui::ApplicationController
  def index
    render locals: {
      grouped_routes: DataHelper.grouped_routes
    }
  end
end
