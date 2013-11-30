class PagesController < ApplicationController
  def landing
    render :layout => 'landing'
  end

  def save_the_date
    @guest = Guest.new
  end

  def home
  end

  def about_us
  end

  def proposal
  end

  def bridal_party
  end

  def wedding_details
  end

  def hotel_info
  end

  def music
  end

  def rsvp
  end

  def rsvp_confirm
    token = params[:last_name] + params[:zipcode]
    @invitation = Invitation.find_by_token(token.downcase)
    if @invitation.blank?
      redirect_to '/rsvp', :alert => "Couldn't find your invitation record, try again!"
    else
      @guests = @invitation.guests
      if @guests.reject { |g| !g.confirmation.nil? }.empty? && request.post?
        flash.now[:notice] = "Looks like you've already filled out your RSVP!<br />Feel free to change your previous response if you need to.".html_safe
      end
    end
  end

  def registry
  end

  def things_to_do
  end

end
