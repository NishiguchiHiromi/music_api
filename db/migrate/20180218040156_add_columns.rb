class AddColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :musics, :user_id, :integer, null: false
    add_column :musics, :no, :integer, null: false
    add_column :musics, :title, :string, default: "no-title"
    add_column :musics, :composer, :string, default: "no-composer"
    add_column :musics, :source, :string, default: "no-source"
    add_column :musics, :meter, :string, default: "4/4"
    add_column :musics, :note_length, :string, default: "1/64"
    add_column :musics, :tempo, :string, default: "1/4=80"
    add_column :musics, :reference, :string
    add_column :musics, :key, :string, default: "C"
  end
end
