class InvitationsController < ApplicationController
  def update
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      if @invitation.update_attributes(invitation_params)
        format.html { redirect_to '/home', notice: 'Thanks for RSVPing!' }
      end
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:comments, :hotel, guests_attributes: [:id, :first_name, :last_name, :confirmation, :dietary_restrictions])
  end
end
