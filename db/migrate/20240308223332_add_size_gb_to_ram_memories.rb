class AddSizeGbToRamMemories < ActiveRecord::Migration[7.1]
  def change
    add_column :ram_memories, :size_gb, :integer
  end
end
