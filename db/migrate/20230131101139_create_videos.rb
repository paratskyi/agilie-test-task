class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos, id: :uuid do |t|
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
