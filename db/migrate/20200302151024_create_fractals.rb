class CreateFractals < ActiveRecord::Migration[6.0]
  def change
    create_table :fractals do |t|
      t.string :name
      t.text :image
      t.text :parameters
      t.integer :user_id

      t.timestamps
    end
  end
end
