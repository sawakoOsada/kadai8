class ConfirmMailer < ApplicationMailer
  include SessionsHelper
  def confirm_post(user)
    @user = user
    mail to: @user.email, subject: "画像を投稿しました"
  end
end
