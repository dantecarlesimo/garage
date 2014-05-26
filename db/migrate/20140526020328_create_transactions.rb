class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user, index: true
      t.integer :seller_id
      t.references :item, index: true

      t.timestamps
    end
  end
end
