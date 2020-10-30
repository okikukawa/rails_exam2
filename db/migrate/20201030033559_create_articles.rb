class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :content
      t.text :image
      # t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
