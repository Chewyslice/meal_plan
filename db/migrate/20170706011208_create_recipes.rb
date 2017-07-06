class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name. null: false
      t.text :description, null: false
      t.belongs_to :user. null: false, foreign_key: true
      t.timestamps null: false

    end
  end
end
