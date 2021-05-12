# == Schema Information
#
# Table name: organisation_records
#
#  id                          :bigint           not null, primary key
#  Organisation ID             :string(255)
#  Organisation Name           :string(255)
#  Organisation Type           :string(255)
#  Effective From Date         :date
#  Effective To Date           :date
#  Hierarchy Version ID        :string(255)
#  Hierarchy Version Date From :date
#  Hierarchy Version Date To   :date
#  Default Cost Centre         :string(255)
#  Parent Organisation ID      :string(255)
#  NACS Code                   :string(255)
#  Location ID                 :string(255)
#  Last Update Date            :datetime
#  Cost Centre Description     :string(255)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
class OrganisationRecord < ApplicationRecord
end
