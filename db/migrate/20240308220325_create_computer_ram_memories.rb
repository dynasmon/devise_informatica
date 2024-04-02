class CreateComputerRamMemories < ActiveRecord::Migration[7.1]
  def change
    create_table :computer_ram_memories do |t|
      t.references :computer, null: false, foreign_key: true
      t.references :ram_memory, null: false, foreign_key: true
      t.integer :capacity

      t.timestamps
    end
  end
end
