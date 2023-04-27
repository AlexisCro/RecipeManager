class UserMailer < ApplicationMailer

    def confirm(user)
        @user = user
        mail(to: user.mail, subject: t('mailer.subject'))
    end

    def password(user)
        @user = user
        mail(to: user.mail, subject: t('mailer.recover_password'))
    end
end
