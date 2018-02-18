class AddColumnsToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :music_id, :integer, null: false
    add_column :notes, :bar_order, :integer, null: false
    add_column :notes, :note_order, :integer, null: false
    add_column :notes, :note, :string, default: "C"
    add_column :notes, :length, :integer, default: 8
  end
end
