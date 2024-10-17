class CreateSendings < ActiveRecord::Migration[7.0]
  def change
    create_table :sendings do |t|

      t.timestamps
    end
  end
end
