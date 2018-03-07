class CreateCaws < ActiveRecord::Migration[5.1]
  def change
    create_table :caws do |t|
      t.string :message
      t.integer :user_id

      t.timestamps
    end
  end
end
