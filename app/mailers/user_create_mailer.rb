class UserCreateMailer < ApplicationMailer
    def user_create(user)
        @user = user
        mail to: @user.email, subject: "Welcome to Trovit"
      end
end
