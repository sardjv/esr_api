class FakeDataJob < ApplicationJob
  queue_as :default

  def perform(klass:, quantity:)
    quantity.times { FactoryBot.create(klass.underscore) }
  end
end
