require 'rails/generators/migration'

module ActsAsViewable
  class MigrationGenerator < Rails::Generators::Base
    include Rails::Generators::Migration

    desc "Generates migration for views table"

    def self.source_root
      File.join(File.dirname(__FILE__), 'templates')
    end

    def self.next_migration_number(path)
      if ActiveRecord::Base.timestamped_migrations
        Time.new.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(path) + 1)
      end
    end

    def create_migration_file
      migration_template 'migration.rb', 'db/migrate/acts_as_viewable_migration.rb'
    end
  end
end