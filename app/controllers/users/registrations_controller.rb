# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # Overriding the default in order to pass a list of admin emails to the 'unconfirmed' flash message.
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        # Set custom flash message for unconfirmed administrator.
        admin_flash_message
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private

  # Set custom flash message for unconfirmed administrator.
  def admin_flash_message
    if resource.inactive_message == :unconfirmed
      set_flash_message(
        :notice,
        :signed_up_but_unconfirmed,
        admin: (User.pluck(:email) - [resource.email]).to_sentence(last_word_connector: ", #{I18n.t('navigation.or')} ")
      )
    else
      set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}"
    end
  end
end
