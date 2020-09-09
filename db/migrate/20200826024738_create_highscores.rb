class CreateHighscores < ActiveRecord::Migration[6.0]
  def change
    create_table :highscores do |t|
      t.string :name
      t.integer :level
      t.integer :seconds
      t.string :uniq_id

      t.timestamps
    end
  end
end
