# frozen_string_literal: true

class Dashboard::MedicsController < DashboardController
  before_action :set_medic, only: %i[edit update destroy]

  def index
    respond_to do |format|
      format.html
      format.json do
        render json: MedicDatatable.new(params, view_context: view_context,
                                                user: current_user)
      end
    end
  end

  def new
    @medic = Medic.new
  end

  def create
    @medic = Medic.new(medic_params)
    @medic.organization = current_user.organization

    if @medic.save
      redirect_to dashboard_medics_path, notice: 'Médico criado com sucesso'
    else
      render :new
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @medic.update(medic_params)
        format.html { redirect_to dashboard_medics_path, notice: 'Médico atualizado com sucesso' }
        format.js {  }
      else
        render :edit
      end
    end
  end

  def destroy
    @medic.destroy
    redirect_to dashboard_medics_path, notice: 'Médico excluído com sucesso'
  end

  private

  def set_medic
    @medic = Medic.find(params[:id])
  end

  def medic_params
    params.require(:medic).permit(:name, :image, :on_shift,
                                  medic_expertises_attributes: [:id, :expertise_id, :_destroy])
  end
end
