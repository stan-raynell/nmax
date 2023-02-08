# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

# RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new
RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ["--color", "--format", "nested"]
end

task default: %i[spec rubocop]
