class Event < PublicActivity::Activity
  belongs_to :trackable, polymorphic: true
end
