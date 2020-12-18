class CreateSnippets < ActiveRecord::Migration[6.0]
  def change
    create_table :snippets do |t|
      t.text :code
      t.references :prompt, foreign_key: true

      t.timestamps
    end
  end
end
