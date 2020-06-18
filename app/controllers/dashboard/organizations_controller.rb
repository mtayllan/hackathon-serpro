# frozen_string_literal: true

class Dashboard::OrganizationsController < DashboardController
  def edit
    @organization = current_user.organization
    @organization.build_address if @organization.address.nil?
  end

  def update
    @organization = current_user.organization
    if @organization.update(organization_params)
      redirect_to edit_dashboard_organization_path,
                  notice: 'Dados atualizados com sucesso'
    else
      render :edit
    end
  end

  private

  def organization_params
    params.require(:organization).permit(
      :name, :kind, :cnes, :covid_attendance, :cnpj,
      address_attributes: %i[city street number zipcode number
                             state neighborhood]
    )
  end
end