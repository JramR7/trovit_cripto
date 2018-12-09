class UserDestroyMailer < ApplicationMailer
    def user_destroy(user)
        @greeting = "Hi" 
        @user = user
        mail to: @user.email, subject: "Account deletion"
      end
end
