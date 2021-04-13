class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :start_day
      t.date :finish_day
      t.boolean :one_day
      t.text :memo

      t.timestamps
    end
  end
end
