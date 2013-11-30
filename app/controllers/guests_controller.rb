class GuestsController < ApplicationController
  
  http_basic_authenticate_with name: "embers", password: "beconstructive", :except => :create

  def index
    @invitations = Invitation.all
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      redirect_to '/home' , :notice => true
    else
      render :action => 'new'
    end
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(guest_params)
      redirect_to @guest, :notice  => "Successfully updated guest."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to guests_url, :notice => "Successfully destroyed guest."
  end

  def export
    Guest.export_to_google_doc
    redirect_to guests_url
  end

  private

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :address1, :address2, :city, :state, :zipcode, :country, :notes, :not_coming, :confirmation, :dietary_restrictions)
  end
end
