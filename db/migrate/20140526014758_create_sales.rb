class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :user, index: true
      t.string :title
      t.string :address
      t.string :city
      t.integer :zipcode
      t.string :date
      t.string :time_start
      t.string :time_end
      t.text :description
      t.string :paperclip

      t.timestamps
    end
  end
end
