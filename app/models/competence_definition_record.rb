# == Schema Information
#
# Table name: competence_definition_records
#
#  id                     :bigint           not null, primary key
#  Competence ID          :string(255)
#  Competence Name        :string(255)
#  Description            :string(255)
#  Date From              :date
#  Date To                :date
#  Behavioural Indicator  :string(255)
#  Certification Required :string(255)
#  Rating Scale ID        :string(255)
#  Evaluation Method      :string(255)
#  Renewal Period Freq    :string(255)
#  Renewal Period Units   :string(255)
#  Competence Cluster     :string(255)
#  Competence Alias       :string(255)
#  VPD Code               :string(255)
#  Last Update Date       :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class CompetenceDefinitionRecord < ApplicationRecord
end
