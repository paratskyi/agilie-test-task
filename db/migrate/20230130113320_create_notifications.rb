class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications, id: :uuid do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :redirect_url

      t.timestamps
    end
  end
end
