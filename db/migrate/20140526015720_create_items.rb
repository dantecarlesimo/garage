class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :sale, index: true
      t.integer :transaction_id
      t.string :name
      t.text :description
      t.integer :price
      t.string :paperclip

      t.timestamps
    end
  end
end
