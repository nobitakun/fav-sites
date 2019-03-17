class CreateCategoryMarks < ActiveRecord::Migration[5.1]
  def change
    create_table :category_marks do |t|
      t.references :mark, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
