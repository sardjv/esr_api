class Api::V1::ApiResourceController < ApplicationController
  include JSONAPI::ActsAsResourceController
  include SecuredWithToken
  before_action :authenticate_request!
end
