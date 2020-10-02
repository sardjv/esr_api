class Api::V1::ApiResourceController < ApplicationController
  include JSONAPI::ActsAsResourceController
  include SecuredWithToken
  prepend_before_action :authenticate_request!
  before_action :set_paper_trail_whodunnit

  def context
    { credentials: @credentials }
  end

  def info_for_paper_trail
    {
      whodunnit_type: @credentials[:token].class.name,
      whodunnit: @credentials[:token].id.to_s
    }
  end
end
