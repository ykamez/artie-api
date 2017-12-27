require 'prmd/rake_tasks/combine'
require 'prmd/rake_tasks/verify'
require 'prmd/rake_tasks/doc'

namespace :json_schema do
  Prmd::RakeTasks::Combine.new do |t|
    t.options[:meta] = 'docs/schema/meta.yml'
    t.options[:type_as_string] = true
    t.paths << 'docs/schema/schemata'
    t.output_file = 'docs/schema/schema.json'
  end

  Prmd::RakeTasks::Verify.new do |t|
    t.files << 'docs/schema/schema.json'
  end

  Prmd::RakeTasks::Doc.new do |t|
    t.files = { 'docs/schema/schema.json' => 'docs/schema/schema.md' }
  end

  task update: ['json_schema:combine', 'json_schema:verify', 'json_schema:doc']
end
