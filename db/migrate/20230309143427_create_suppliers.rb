class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers, id: :uuid do |t|
      t.string :name
      t.integer :spend

      t.timestamps
    end
  end
end
