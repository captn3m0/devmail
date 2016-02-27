class CreateUsers < ActiveRecord::Migration
def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.bigint :userid
      t.string :nick

      t.timestamps null: false
    end
  end
end
