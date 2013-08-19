class GuestsController < ApplicationController
  
  http_basic_authenticate_with name: "embers", password: "beconstructive", :except => :create

  def index
    @guests = Guest.all
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
      redirect_to '/home' , :notice => "Successfully created guest."
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
    require "google_drive"

    username = ENV['WEDDING_DOC_USERNAME']
    password = ENV['WEDDING_DOC_PASSWORD']
    session = GoogleDrive.login(username, password)

    ws = session.spreadsheet_by_key("0As1QuI50fA28dEdDaWRNeHV3bjNRTy1CT2h0aVBNU3c").worksheets[7]

    ws[1, 1] = 'Name'
    ws[1, 2] = 'Address'
    ws[1, 3] = 'Coming?'
    ws[1, 4] = 'Notes'
    Guest.all.each_with_index do |guest, i|
      ws[i + 2, 1] = guest.name
      ws[i + 2, 2] = guest.address
      ws[i + 2, 3] = guest.not_coming? ? 'No' : 'Yes'
      ws[i + 2, 4] = guest.notes
    end
    ws.save

    redirect_to guests_url
  end

  private

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :address1, :address2, :city, :state, :zipcode, :country, :notes, :not_coming)
  end
end
