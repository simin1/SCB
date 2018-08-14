class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :topic, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
