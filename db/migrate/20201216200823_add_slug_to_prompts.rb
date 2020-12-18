class AddSlugToPrompts < ActiveRecord::Migration[6.0]
  def change
    add_column :prompts, :slug, :string
    add_index :prompts, :slug, unique: true
  end
end
