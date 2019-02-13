class AddNameToUser < ActiveRecord::Migration[5.2]
  def update
    add_column :users, :name, :string
  end
end
