class SolicitationsController < ApplicationController

  def create
    @solicitation = Solicitation.new(solicitation_params)

    respond_to do |format|
      if @solicitation.save
        format.js
      else
        format.html { render :new }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def solicitation_params
    params.require(:solicitation).permit(:name, :message, :email)
  end
end
