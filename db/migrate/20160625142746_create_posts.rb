class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.integer :gender
      t.string :depart
      t.string :email
      t.string :title
      t.text :question
      t.boolean :public, default: false
      t.timestamps null: false
    end
  end
end
