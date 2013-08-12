class PagesController < ApplicationController
  def landing
    render :layout => 'landing'
  end

  def home
    @guest = Guest.new
  end

  def about_us
  end

  def proposal
  end

  def bridal_party
  end

  def wedding_details
  end

  def music
  end

  def rsvp
  end

  def registry
  end

  def things_to_do
  end

end
