require 'spec'

require 'rubygems'
gem 'rails'
gem 'activesupport'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'tworgy/rails_ext'
require 'tworgy/recursively'

Spec::Runner.configure do |config|
  
end
