class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books, id: :uuid, default: "gen_random_uuid()", force: true do |t|
      t.string :title, index: true
      t.string :genre
      t.string :publisher
      t.integer :pages
      t.column :created_at, "timestamp with time zone", null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.column :updated_at, "timestamp with time zone", null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.column :published_at, "timestamp with time zone"
    end
  end
end
