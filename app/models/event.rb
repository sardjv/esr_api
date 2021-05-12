# == Schema Information
#
# Table name: activities
#
#  id             :bigint           not null, primary key
#  trackable_type :string(255)
#  trackable_id   :bigint
#  owner_type     :string(255)
#  owner_id       :bigint
#  key            :string(255)
#  parameters     :text(65535)
#  recipient_type :string(255)
#  recipient_id   :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Event < PublicActivity::Activity
  belongs_to :trackable, polymorphic: true
end
