class CreateStatuts < ActiveRecord::Migration
  def change
    create_table :statuts do |t|
      t.string :intitule

      t.timestamps
    end
  end
end
