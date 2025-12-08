class CreateCuisines < ActiveRecord::Migration[8.1]
  def change
    create_table :cuisines do |t|
       t.string :region
       t.string :image
       t.timestamps null: false
    end
  end
end
