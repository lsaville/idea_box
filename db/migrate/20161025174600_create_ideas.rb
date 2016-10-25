class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :name
      t.string :description
      t.string :notes
      t.timestamps null: false
      t.references :user, foreign_key: true
    end
  end
end
