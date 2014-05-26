class RemovePaperclipFromSale < ActiveRecord::Migration
  def change
    remove_column :sales, :paperclip, :string
  end
end
