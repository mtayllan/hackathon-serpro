class Dashboard::OrganizationUsersController < ApplicationController
  before_action :set_dashboard_organization_user, only: [:show, :edit, :update, :destroy]

  def index
    @organization_users = current_organization_user.organization.users
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
      redirect_to dashboard_organization_user_url, notice: "You are not allowed to create a user to another organization."
    end
    if @organization_user.save
      redirect_to dashboard_organization_user_url, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @organization_user.update(dashboard_organization_user_params)
      redirect_to dashboard_organization_user_url, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @organization_user.destroy
      redirect_to dashboard_organization_users_url, notice: 'User was successfully destroyed.'
    else
      redirect_to dashboard_organization_users_url, notice: 'User was unsuccessfully destroyed.'
    end
  end

  private
    def set_dashboard_organization_user
      @organization_user = OrganizationUser.find(params[:id])
    end

    def dashboard_organization_user_params
      params.fetch(:dashboard_organization_user, {})
    end
end
