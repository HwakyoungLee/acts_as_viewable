module ActsAsViewable
  module Viewable
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_viewable
        class_eval do
          include ActsAsViewable::Viewable::InstanceMethods

          has_many :views, class_name: 'ActsAsViewable::View', as: :viewable
        end
      end
    end

    module InstanceMethods
      def viewed_by(viewer)
        ActsAsViewable::View.viewed_by viewer, self
      end

      def viewed_by?(viewer)
        !!find_view_by(viewer)
      end

      def times_viewed
        return self[:cached_times_viewed] if respond_to?(:cached_times_viewed)

        views.count || 0
      end

      def find_view_by(viewer)
        views.where(viewer_id: viewer.id, viewer_type: viewer.class.base_class.name).first
      end

    end
  end
end

ActiveRecord::Base.send :include, ActsAsViewable::Viewable