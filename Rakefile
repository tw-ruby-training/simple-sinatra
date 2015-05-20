require 'sequel'
require_relative 'lib/database_helper'

desc 'Create a new migration file with timestamp'
task :create_migration, :description do |t, args|
  if create_migration_file(args.description)
    puts 'Migration created'
  else
    puts 'Migration creation failed'
  end
end

desc 'Perform migration up to latest migration available'
task :migrate do
  Sequel.extension :migration
  Sequel::TimestampMigrator.run(DatabaseHelper.connect, 'migrations')
  puts 'Task complete'
end

def create_migration_file description
  File.new("migrations/#{timestamp}_#{snake_case(description)}.rb", 'w')
end

def timestamp
  Time.now.strftime('%Y%m%d%H%M')
end

def snake_case string
  string.gsub(' ', '_').downcase
end
