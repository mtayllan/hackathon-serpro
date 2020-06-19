# frozen_string_literal: true

class Dashboard::OrganizationHealthPlanExpertisesController < DashboardController
  before_action :set_organization_health_plan_expertise, only: %i[edit update destroy]

  def index
    respond_to do |format|
      format.html
      format.json do
        render json: OrganizationHealthPlanExpertiseDatatable.new(params, view_context: view_context,
                                                                          user: current_user)
      end
    end
  end

  def new
    @organization_health_plan_expertise = OrganizationHealthPlanExpertise.new
  end

  def create
    @organization_health_plan_expertise = OrganizationHealthPlanExpertise.new(organization_health_plan_expertise_params)
    @organization_health_plan_expertise.organization = current_user.organization

    if @organization_health_plan_expertise.save
      redirect_to dashboard_organization_health_plan_expertises_path, notice: 'Médico criado com sucesso'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @organization_health_plan_expertise.update(organization_health_plan_expertise_params)
      redirect_to dashboard_organization_health_plan_expertises_path, notice: 'Médico atualizado com sucesso'
    else
      render :edit
    end
  end

  def destroy
    @organization_health_plan_expertise.destroy
    redirect_to dashboard_organization_health_plan_expertises_path, notice: 'Médico excluído com sucesso'
  end

  private

  def set_organization_health_plan_expertise
    @organization_health_plan_expertise = OrganizationHealthPlanExpertise.find(params[:id])
  end

  def organization_health_plan_expertise_params
    params.require(:organization_health_plan_expertise).permit(:organization_id, :health_plan_id, :expertise_id)
  end
end
