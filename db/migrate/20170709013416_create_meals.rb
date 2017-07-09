class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.date :date, null: false
      t.reference :meal_plan, nul: false, foreign_key: true
      t.reference :recipe, nul: false, foreign_key: true
      t.timestamps null: false

    end
  end
end
