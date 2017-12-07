class NotifierMailer < ApplicationMailer
    default from: 'RoyalTra31@gmail.com', return_path: 'RoyalTra31@gmail.com'

    def welcome(recipient)
        @account = recipient
        mail(to: recipient.email_address_with_name, subject: 'Welcome to Libby Place')
    end

    def volunteers(users,subject, body)
        mail(to: users, subject: subject, body: body )
    end

    def sample(user)
        
        mail(to:user, subject: 'sample email', body: "Lets go" )
    end

    
end
