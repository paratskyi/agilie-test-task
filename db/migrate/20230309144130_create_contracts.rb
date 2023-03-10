class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts, id: :uuid do |t|
      t.string :name
      t.text :description
      t.references :user, index: { unique: true }, type: :uuid
      t.references :supplier, type: :uuid

      t.timestamps
    end
  end
end
