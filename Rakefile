require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'libs/allmenus'
  t.test_files = FileList['spec/lib/allmenus/*_spec.rb', 'spec/lib/*_spec.rb']
end

task default: :test
