# == Schema Information
#
# Table name: person_records
#
#  id                        :bigint           not null, primary key
#  Person ID                 :string(255)
#  Effective Start Date      :date
#  Effective End Date        :date
#  Employee Number           :string(255)
#  Title                     :string(255)
#  Last Name                 :string(255)
#  First Name                :string(255)
#  Middle Names              :string(255)
#  Maiden Name               :string(255)
#  Preferred Name            :string(255)
#  Previous Last Name        :string(255)
#  Gender                    :string(255)
#  Date of Birth             :date
#  National Insurance Number :string(255)
#  NHS Unique ID             :string(255)
#  Hire Date                 :date
#  Actual Termination Date   :date
#  Termination Reason        :string(255)
#  Employee Status Flag      :string(255)
#  WTR Opt Out               :string(255)
#  WTR Opt Out Date          :date
#  Ethnic Origin             :string(255)
#  Country of Birth          :string(255)
#  Previous Employer         :string(255)
#  Previous Employer Type    :string(255)
#  CSD 3 Months              :date
#  CSD 12 Months             :date
#  NHS CRS UUID              :string(255)
#  System Person Type        :string(255)
#  User Person Type          :string(255)
#  Office E-mail Address     :string(255)
#  NHS Start Date            :date
#  Last Update Date          :date
#  Disability Flag           :string(255)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
class PersonRecord < ApplicationRecord
    has_many :assignment_records, foreign_key: 'Person ID', primary_key: 'Person ID'
    has_many :costing_records, foreign_key: 'Person ID', primary_key: 'Person ID'
    has_many :supervisors, through: :assignment_records

    scope :no_effective_end_date, -> { where('Effective End Date': nil) }
    scope :supervisors, -> { where('Person ID': AssignmentRecord.all.map(&:'Supervisor Person ID').uniq) }
    scope :not_supervised, -> { joins(:assignment_records).where(assignment_records: { 'Supervisor Person ID': nil }).distinct }

    def age
        return nil unless self.send('Date of Birth').present?
        dob = self.send('Date of Birth')
        now = Time.now.utc.to_date
        now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    end

    def full_name
        "#{self.send('Title')} #{self.send('First Name')} #{self.send('Last Name')}"
    end
end
