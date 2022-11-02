class ActsAsViewableMigration < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.belongs_to :viewer, polymorphic: true, null: false
      t.belongs_to :viewable, polymorphic: true, null: false
      t.integer :times_viewed, default: 1, null: false
      t.timestamps null: false
    end

    add_index :views, [:viewer_id, :viewer_type, :viewable_id, :viewable_type], unique: true, name: 'index_views_on_viewer_and_viewable'
    add_index :views, [:viewable_id, :viewable_type]
  end
end