class Dashboard::OrganizationUsersController < DashboardController
  before_action :set_dashboard_organization_user, only: [:show, :edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html
      format.json do
        render json: OrganizationUserDatatable.new(params, view_context: view_context,
                                                user: current_user)
      end
    end
  end

  def show
  end

  def new
    @organization_user = OrganizationUser.new
  end

  def edit
  end

  def create
    @organization_user = OrganizationUser.new(dashboard_organization_user_params)

    if current_organization_user.organization_id != @organization_user.organization_id
      redirect_to dashboard_organization_users_url, notice: "Você não pode criar uma usuários que não são da sua organização."
      return
    end
    if @organization_user.save
      redirect_to dashboard_organization_users_url, notice: 'Usuário criado com sucesso.'
    else
      render new_dashboard_organization_user_url
    end
  end

  def update
    if @organization_user.update(dashboard_organization_user_params)
      redirect_to dashboard_organization_users_url, notice: 'Usuário atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    if @organization_user.destroy
      redirect_to dashboard_organization_users_url, notice: 'Usuário deletado com sucesso.'
    else
      redirect_to dashboard_organization_users_url, notice: 'Usuário deletado com sucesso.'
    end
  end

  private
    def set_dashboard_organization_user
      @organization_user = OrganizationUser.find(params[:id])
    end

    def dashboard_organization_user_params
      params.require(:organization_user).permit(:email, :password, :password_confirmation, :organization_id)
    end
end
