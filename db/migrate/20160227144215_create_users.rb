class CreateUsers < ActiveRecord::Migration
def change
    create_table :users do |t|
      # User name, from github
      t.string :name
      # Email, from github
      t.string :email
      # numeric userid from github, used for lookups
      t.bigint :userid
      # user nick from github, can be changed
      t.string :nick
      # token that we get from github
      t.string :token

      t.timestamps null: false
    end
  end
end
