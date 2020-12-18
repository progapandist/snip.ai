class AddTextAndSlugToSnippets < ActiveRecord::Migration[6.0]
  def change
    add_column :snippets, :text, :string
    add_column :snippets, :slug, :string
    add_index :snippets, :slug, unique: true
  end
end
