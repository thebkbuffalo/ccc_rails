class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.text :headline
      t.text :header
      t.text :body

      t.timestamps
    end
  end
end
