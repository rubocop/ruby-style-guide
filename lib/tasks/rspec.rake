# Require RSpec tasks
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

# The default task is tests
task :default => :spec