class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :answer
      t.integer :post_id
      t.integer :admin_id
      t.timestamps null: false
    end
  end
end
