class CreateRamMemories < ActiveRecord::Migration[7.1]
  def change
    create_table :ram_memories do |t|
      t.string :name

      t.timestamps
    end
  end
end
