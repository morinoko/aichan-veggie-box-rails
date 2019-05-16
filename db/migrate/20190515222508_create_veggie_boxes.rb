class CreateVeggieBoxes < ActiveRecord::Migration[6.0]
  def change
    create_table :veggie_boxes do |t|
      t.string :title_ja
      t.string :title_en
      t.text :description_ja
      t.text :description_en

      t.timestamps
    end
  end
end
