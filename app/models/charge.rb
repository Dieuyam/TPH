class Charge < ApplicationRecord
after_create :successfull_payment

    def successfull_payment

        case 

        when $stripe_customer.stripe_session_id.to_i == 3
            $stripe_customer.update(:offer_id => $stripe_customer.stripe_session_id, :is_pro => true)

        when $stripe_customer.stripe_session_id.to_i != 3
            $stripe_customer.update(:offer_id => $stripe_customer.stripe_session_id, :is_pro => false)
        end

    end


end
