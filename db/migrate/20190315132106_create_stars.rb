class CreateStars < ActiveRecord::Migration[5.1]
  def change
    create_table :stars do |t|
      t.references :mark, foreign_key: true
      t.references :user, foreign_key: true
      t.string :label

      t.timestamps
    end
  end
end
