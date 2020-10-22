class CreateAuthentications < ActiveRecord::Migration[6.0]
  def change
    create_table :authentications do |t|

      t.timestamps
    end
  end
end
