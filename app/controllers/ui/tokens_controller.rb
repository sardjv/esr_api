class Ui::TokensController < Ui::ApplicationController
  # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
  # for more information


  # GET /ui/tokens
  def new
    resource = new_resource
    authorize_resource(resource)

    respond_to do |format|
      format.html {
        render locals: {
          page: Administrate::Page::Form.new(dashboard, resource)
        }
      }
      format.json {
        # Used for updating permissions form column dropdown options if the resource changes.
        render json: {
          column_options: PermissionHelper.column_options_for_select2(resource: params['resource'])
        }
      }
    end
  end

  # POST /ui/tokens
  def create
    resource = resource_class.new(resource_params)
    authorize_resource(resource)

    resource.created_by = current_user
    resource.token = Lockbox.generate_key

    if resource.save
      redirect_to(
        [namespace, resource],
        notice: translate_with_resource('create.success')
      )
    else
      @options = resource.permissions.map { |p|
        PermissionHelper.column_options(resource: p.resource)
      }
      render :new, locals: {
        page: Administrate::Page::Form.new(dashboard, resource)
      }
    end
  end

  def destroy
    # delete rather than destroy to bypass the readonly? check on Token.
    if requested_resource.delete
      flash[:notice] = translate_with_resource('destroy.success')
    else
      flash[:error] = requested_resource.errors.full_messages.join('<br/>')
    end
    redirect_to action: :index
  end

  def valid_action?(name, resource = resource_class)
    case resource.to_s.downcase
    when 'token' then %w[index new create show destroy].include?(name.to_s)
    else false
    end
  end
end
