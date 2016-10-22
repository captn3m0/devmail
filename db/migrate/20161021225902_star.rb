class Star < ActiveRecord::Migration[5.0]
  def change
    create_table :stars do |t|
      t.belongs_to :user
      t.integer :repo_id
      t.string :repo
      t.timestamps null: false
      t.datetime :starred_at
    end
    add_index :stars, [:user_id, :repo_id], unique: true
  end
end
