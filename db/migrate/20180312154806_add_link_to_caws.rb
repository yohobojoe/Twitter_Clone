class AddLinkToCaws < ActiveRecord::Migration[5.1]
  def change
    add_column :caws, :link, :string
  end
end
