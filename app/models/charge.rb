class Charge < ApplicationRecord
after_create :successfull_payment

    def successfull_payment
        
        $stripe_customer.update(:offer_id => $stripe_customer.stripe_session_id)

    end


end
