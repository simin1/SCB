class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
