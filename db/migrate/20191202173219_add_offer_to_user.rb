class AddOfferToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :offer, foreign_key: true
  end
end
