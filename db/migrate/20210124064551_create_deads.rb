class CreateDeads < ActiveRecord::Migration[6.0]
  def change
    create_table :deads do |t|
      t.string :name
      t.string :dimage_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
