class AddCommentsToUser < ActiveRecord::Migration
  def change
    add_column :users, :comments, :string
  end
end
