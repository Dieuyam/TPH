class ChargesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        current_user.update(:offer_id => stripe.stripe_session_id)
    end

end
