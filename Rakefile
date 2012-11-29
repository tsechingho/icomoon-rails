lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bundler/gem_tasks'
require 'icomoon-rails/source_file'

desc "Update with Keyamoon's IcoMoon Library"
task 'update-icomoon' do
  files = SourceFile.new
  files.fetch ENV['ZIP'], ENV['NAME']
  files.move
  files.convert
  files.cleanup
end
