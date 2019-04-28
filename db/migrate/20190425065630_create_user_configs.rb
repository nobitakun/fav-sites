class CreateUserConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_configs do |t|
      t.references :user, foreign_key: true
      t.integer :mark_target
      t.integer :language_setting
      t.string :bg_image
      t.integer :col_num

      t.timestamps
    end
  end
end
