module ActsAsViewable
  class View < ActiveRecord::Base
    belongs_to :viewable, polymorphic: true
    belongs_to :viewer, polymorphic: true

    validates_presence_of :viewable_id
    validates_presence_of :viewer_id

    scope :by_viewer, ->(viewer) { where(viewer_id: viewer.id, viewer_type: viewer.class.base_class.to_s) }
    scope :by_viewable, ->(viewable) { where(viewable_id: viewable.id, viewable_type: viewable.class.base_class.to_s) }

    after_create :increment_cached_counter
    after_destroy :decrement_cached_counter

    def increment_cached_counter
      viewable.class.update_counters viewable_id, cached_times_viewed: 1 if viewable.respond_to?(:cached_times_viewed)
    end

    def decrement_cached_counter
      viewable.class.update_counters viewable_id, cached_times_viewed: times_viewed if viewable.respond_to?(:cached_times_viewed)
    end

    # return: 처음 본 경우 true, otherwise false
    def self.viewed_by(viewer, viewable)
      rows_affected = by_viewer(viewer).by_viewable(viewable).update_all "times_viewed = times_viewed + 1"
      return false if rows_affected > 0

      create(viewer_id: viewer.id, viewer_type: viewer.class.base_class.name, viewable_id: viewable.id, viewable_type: viewable.class.base_class.name)
      true
    end
  end
end