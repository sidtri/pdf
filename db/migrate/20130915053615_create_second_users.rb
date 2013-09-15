class CreateSecondUsers < ActiveRecord::Migration
  def change
    create_table :second_users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
