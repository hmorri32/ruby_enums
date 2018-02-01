require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['bubble/test/*.rb', 'insertion/test/*.rb', 'merge/test/*.rb']
  t.verbose = true
end