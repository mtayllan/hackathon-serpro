# frozen_string_literal: true

class Dashboard::ContactsController < DashboardController
  before_action :set_contact, only: %i[show edit update destroy]

  def index
    respond_to do |format|
      format.html
      format.json do
        render json: ContactDatatable.new(params, view_context: view_context,
                                                  user: current_user)
      end
    end
  end

  def new
    @contact = Contact.new
  end

  def edit; end

  def create
    @contact = current_user.organization.contacts.new(contact_params)
    if @contact.save
      redirect_to dashboard_contacts_url, notice: 'Contato criado com sucesso.'
    else
      render :new
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to dashboard_contacts_url, notice: 'Contato atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to dashboard_contacts_url, notice: 'Contato destruído com sucesso.'
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:kind, :value)
  end
end
