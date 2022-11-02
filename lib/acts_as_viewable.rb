require 'active_model'
require 'active_support'
require 'active_record'

module ActsAsViewable
  if defined?(ActiveRecord::Base)
    require 'acts_as_viewable/viewable'
    require 'acts_as_viewable/viewer'
    require 'acts_as_viewable/view'
  end
end
