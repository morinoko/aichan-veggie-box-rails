class CreateVeggieBoxes < ActiveRecord::Migration[6.0]
  def change
    create_table :veggie_boxes do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
