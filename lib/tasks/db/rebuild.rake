require 'spinner.rb'
namespace :db do
  desc "Rebuild the database"
  task :rebuild do |t, args|
    spinner = Spinner.new
    spinner.task("Dropping", 'db:drop')
    spinner.task("Creating", 'db:create')
    spinner.task("Migrating", 'db:migrate')
    spinner.task("Loading", 'db:test:load')
    spinner.task("Seeding", 'db:seed')
    spinner.spin!
  end
end
