class ContactMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    mail(to: 'rscarson@richardcarson.ca', subject: 'New portfolio message')
  end
end
