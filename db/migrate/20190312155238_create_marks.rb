class CreateMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :marks do |t|
      t.string :title
      t.string :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
