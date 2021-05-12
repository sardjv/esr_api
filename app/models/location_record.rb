# == Schema Information
#
# Table name: location_records
#
#  id                          :bigint           not null, primary key
#  Record Type                 :string(255)
#  Location ID                 :string(255)
#  Location Code               :string(255)
#  Location Description        :string(255)
#  Inactive Date               :date
#  Assignment Address 1st line :string(255)
#  Assignment Address 2nd line :string(255)
#  Assignment Address 3rd line :string(255)
#  Town                        :string(255)
#  County                      :string(255)
#  Postcode                    :string(255)
#  Country                     :string(255)
#  Telephone                   :string(255)
#  Fax                         :string(255)
#  Payslip Delivery Point      :string(255)
#  Site Code                   :string(255)
#  Welsh Location Translation  :string(255)
#  Welsh Address Line 1        :string(255)
#  Welsh Address Line 2        :string(255)
#  Welsh Address Line 3        :string(255)
#  Welsh Town Translation      :string(255)
#  Last Update Date            :datetime
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
class LocationRecord < ApplicationRecord
end
