class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  has_paper_trail
  include PublicActivity::Model
  tracked
end
