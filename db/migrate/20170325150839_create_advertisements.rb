class CreateAdvertisements < ActiveRecord::Migration[5.0]
  def change
    create_table :advertisements do |t|
      t.string :title
      t.string :body
      t.integer :price

      t.timestamps
    end
    add_index :advertisements, :body
  end
end