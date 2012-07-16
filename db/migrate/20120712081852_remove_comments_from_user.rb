class RemoveCommentsFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :comments
      end

  def down
    add_column :users, :comments, :string
  end
end
