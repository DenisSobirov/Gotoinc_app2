class BlockUserEmailMailer < ApplicationMailer
  def block_user(user)
    @user = user
    mail(to: @user.email, subject: 'block')
  end
end
