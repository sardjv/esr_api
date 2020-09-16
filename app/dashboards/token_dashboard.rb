require 'administrate/base_dashboard'

class TokenDashboard < Administrate::BaseDashboard
  class << self
    def model
      I18n.t('models.token.name', count: 1)
    end

    def resource_name(_opts = nil)
      I18n.t('models.token.name', count: 2)
    end
  end

  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    'name': Field::String,
    'created_by': Field::BelongsTo.with_options(
      class_name: 'User',
      searchable: true,
      searchable_fields: %w[first_name last_name]
    ),
    'created_at': Field::DateTime,
    'token_one_time': Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :created_by,
    :created_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :token_one_time
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how training absence records are displayed
  # across all pages of the admin dashboard.
  def display_resource(token)
    token.name
  end
end
