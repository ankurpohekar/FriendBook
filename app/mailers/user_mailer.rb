class UserMailer < ApplicationMailer
  default form: 'surajnayk286@gmail.com'
  
  def send_mail_on_user_create(user)
    @user = user

    mail to: "ankurpohekar286@mailinator.com",subject: 'Thanku for creating user'
  end
end
