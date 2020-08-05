class CreateInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :interests do |t|
      t.string :name
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
