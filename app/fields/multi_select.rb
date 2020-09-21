require 'administrate/field/base'

class MultiSelect < Administrate::Field::Select
  def to_s
    data
  end

  def self.permitted_attribute(attribute, _options = nil)
    { attribute.to_sym => [] }
  end
end
