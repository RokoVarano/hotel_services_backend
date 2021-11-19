class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :duration, null: false
      t.integer :price, null: false
      t.string :city, null: false
      t.string :image_url, null: false

      t.timestamps
    end
  end
end
