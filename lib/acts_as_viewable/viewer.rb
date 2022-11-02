module ActsAsViewable
  module Viewer
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_viewer
        class_eval do
          include ActsAsViewable::Viewer::InstanceMethods

          has_many :views, class_name: 'ActsAsViewable::View', as: :viewer
        end
      end
    end

    module InstanceMethods
      def viewed(viewable)
        ActsAsViewable::View.viewed_by self, viewable
      end

      def viewed?(viewable)
        !!find_view_for(viewable)
      end

      def find_view_for(viewable)
        views.where(viewable_id: viewable.id, viewable_type: viewable.class.base_class.name).first
      end

    end
  end
end

ActiveRecord::Base.send :include, ActsAsViewable::Viewer