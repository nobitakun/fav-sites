class CreateDefaultMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :default_marks do |t|
      t.string :title
      t.string :url
      t.integer :order_num

      t.timestamps
    end
  end
end
