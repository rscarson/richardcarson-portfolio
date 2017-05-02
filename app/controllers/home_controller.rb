class HomeController < ApplicationController
  def index
  end

  def contact
    ContactMailer.contact_email(
      params[:name],
      params[:email],
      params[:body]
    ).deliver_later
  end
end
