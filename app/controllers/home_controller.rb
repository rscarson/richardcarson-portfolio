require 'json'

class HomeController < ApplicationController
  def index
    @settings = settings;
  end

  def contact
    ContactMailer.contact_email(
      params[:name],
      params[:email],
      params[:body]
    ).deliver_later
  end

  def settings
    file = File.read('config/settings.json')
    return JSON.parse(file)
  end
end