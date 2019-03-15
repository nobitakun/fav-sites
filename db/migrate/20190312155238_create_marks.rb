class CreateMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :marks do |t|
      t.string :name
      t.string :url
      t.string :favicon
      t.string :image
      t.string :memo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
