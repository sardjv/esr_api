require "administrate/field/base"

class MultiSelect < Administrate::Field::Select
  def to_s
    data
  end

  def self.permitted_attribute(attribute)
    { attribute.to_sym => [] }
  end

  def permitted_attribute
    self.class.permitted_attribute(attribute)
  end
end
