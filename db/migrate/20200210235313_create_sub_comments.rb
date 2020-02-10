class CreateSubComments < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_comments do |t|
      t.text :content
      t.references :comment, index: :true
      t.references :user, index: :true

      t.timestamps
    end
  end
end
