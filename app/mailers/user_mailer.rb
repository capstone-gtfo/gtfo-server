class UserMailer < ApplicationMailer
  default from: 'caudy7@gmail.com'

  def invalid_sms
    mail(to: 'caudy7@gmail.com', subject: 'Invalid Twillio Account')
    # mail(to: 'teecaud@hotmail.com', subject: 'Invalid Twillio Account')
  end
end
