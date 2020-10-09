class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  has_paper_trail
  include PublicActivity::Model
  tracked owner: -> (controller, _model) { controller.current_user }
end
