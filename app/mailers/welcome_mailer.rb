class WelcomeMailer < ApplicationMailer
    def welcome_send(user)
        @user = user
        mail to: user.email, subject: "Welcome", from: "disneyApp@api.com"
    end 
end
