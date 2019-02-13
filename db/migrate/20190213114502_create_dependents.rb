class CreateDependents < ActiveRecord::Migration[5.2]
  def change
    create_table :dependents do |t|
      t.string :name
      t.string :parentesco
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
