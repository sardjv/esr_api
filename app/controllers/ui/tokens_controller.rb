class Ui::TokensController < Ui::ApplicationController
  def index
    render locals: {
      tokens: Token.select(:name, :created_by_id).all
    }
  end
end
