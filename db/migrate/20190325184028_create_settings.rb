class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.string :slug
      t.string :label
      t.string :content
      t.integer :order_num

      t.timestamps
    end
  end
end
