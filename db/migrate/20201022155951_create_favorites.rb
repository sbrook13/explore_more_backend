class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.string :trail_id
      t.string :trail_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
