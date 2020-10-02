class ConfirmMailer < ApplicationMailer
  include SessionsHelper
  def confirm_post(user,picture)
    @user = user
    @picture = picture
    mail to: @user.email, subject: "画像を投稿しました"
  end
end
