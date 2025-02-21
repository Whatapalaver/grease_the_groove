class CreateDailySessions < ActiveRecord::Migration[7.2]
  def change
    create_table :daily_sessions do |t|
      t.belongs_to :active_day, null: false, foreign_key: true
      t.string :name
      t.text :notes
      t.bigint :position

      t.timestamps
    end
  end
end
