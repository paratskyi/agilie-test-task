class CreateConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :conditions, id: :uuid do |t|
      t.string :value, null: false
      t.string :operator, null: false
      t.string :associations_chain, array: true, null: false
      t.string :model, null: false

      t.timestamps
    end
  end
end
