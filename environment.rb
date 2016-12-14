# Include Ruby DateTime object library
require 'date'


# Require all files from controllers, helpers, models, views folders
project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/controllers/*') {|file| require file}
Dir.glob(project_root + '/helpers/*') {|file| require file}
Dir.glob(project_root + '/models/*') {|file| require file}
Dir.glob(project_root + '/views/*') {|file| require file}
