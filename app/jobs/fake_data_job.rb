class FakeDataJob < ApplicationJob
  def perform(klass:, quantity:)
    quantity.times { FactoryBot.create(klass.underscore) }
  end
end
