class CreateCompletedTrails < ActiveRecord::Migration[6.0]
  def change
    create_table :completed_trails do |t|
      t.string :trail_id
      t.string :trail_type
      t.text :note
      t.integer :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
