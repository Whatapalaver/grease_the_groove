class CreateActiveDays < ActiveRecord::Migration[7.2]
  def change
    create_table :active_days do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.date :day, null: false

      t.timestamps
    end
  end
end
