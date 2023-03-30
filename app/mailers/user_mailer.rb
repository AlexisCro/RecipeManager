class UserMailer < ApplicationMailer

    def confirm(user)
        @user = user
        mail(to: user.mail, subject: t('mailer.subject'))
    end
    
end
