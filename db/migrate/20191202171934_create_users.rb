class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.boolean :is_admin
      t.boolean :is_pro
      t.string :stripe_customer_id
      t.string :stripe_session_id
      t.string :remember_digest

      t.timestamps
    end
  end
end
