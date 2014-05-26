class RemovePaperclipFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :paperclip, :string
  end
end
