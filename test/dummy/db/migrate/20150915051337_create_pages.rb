class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.integer :cached_times_viewed, default: 0, null: false

      t.timestamps null: false
    end
  end
end
