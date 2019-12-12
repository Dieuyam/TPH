class ContactMailer < ApplicationMailer

	def admin_contact_email()
     #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    
    mail(to: admin.email, subject: 'Prise de contact')
   end 

end
