class CreateSendings < ActiveRecord::Migration[7.0]
  def change
    create_table :sendings do |t|
      t.references :order,               null: false, foreign_key: true
      t.string :postal_code,             null: false        
      t.integer :area_id,                null: false  
      t.string :city,                    null: false
      t.string :address,                 null: false
      t.string :building               
      t.string :telephone_number,        null: false
      t.timestamps
    end
  end
end
