class CreateCawTags < ActiveRecord::Migration[5.1]
  def change
    create_table :caw_tags do |t|
      t.integer :caw_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
