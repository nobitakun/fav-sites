class CreateListStars < ActiveRecord::Migration[5.1]
  def change
    create_table :list_stars do |t|
      t.references :list, foreign_key: true
      t.references :star, foreign_key: true

      t.timestamps
    end
  end
end
