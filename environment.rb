# Include Ruby DateTime object library
require 'date'

# Include Active Support core extensions for Date, Time, and DateTime
require 'active_support/core_ext/date'
require 'active_support/core_ext/time'
require 'active_support/core_ext/date_time'


# Require all files from controllers, helpers, models, views folders
project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/controllers/*.rb') {|file| require file}
Dir.glob(project_root + '/helpers/*.rb') {|file| require file}
Dir.glob(project_root + '/models/*.rb') {|file| require file}
Dir.glob(project_root + '/views/*.rb') {|file| require file}
