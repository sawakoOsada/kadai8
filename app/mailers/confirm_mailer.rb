class ConfirmMailer < ApplicationMailer
  include SessionsHelper
  def confirm_mail(picture)
    @picture = picture
    @user = @current_user
    mail to: @user.email, subject: "お問い合わせの確認メール"
  end
end
