class AddStarsCountToPosts < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.integer :stars_count, default: 0
    end
  end
end
