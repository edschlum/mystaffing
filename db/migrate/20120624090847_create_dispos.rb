class CreateDispos < ActiveRecord::Migration
  def change
    create_table :dispos do |t|
      t.datetime :jour
      t.integer :statut_id
      t.integer :user_id

      t.timestamps
    end
  end
end
