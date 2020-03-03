class CreateFractals < ActiveRecord::Migration[6.0]
  def change
    create_table :fractals do |t|
      t.string :name
      t.text :image
      t.string :rule
      t.string :fractal_type
      t.integer :user_id

      t.timestamps
    end
  end
end
