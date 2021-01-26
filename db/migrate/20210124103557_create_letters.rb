class CreateLetters < ActiveRecord::Migration[6.0]
  def change
    create_table :letters do |t|
      t.string :name
      t.text :caption
      t.string :limage_id
      t.integer :dead_id

      t.timestamps
    end
  end
end
