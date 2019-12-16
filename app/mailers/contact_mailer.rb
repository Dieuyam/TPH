class ContactMailer < ApplicationMailer

	def admin_contact_email(message,first_name,email,phone)
     #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @phone = phone
    @name = first_name
    @email = email
    @message = message

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://the-perfect-house.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.

    mail(to: "theperfecthouseia@gmail.com", subject: 'Prise de contact')
   end

end
