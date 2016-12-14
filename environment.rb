project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/controllers/*') {|file| require file}

# Dir[File.dirname(__FILE__) + '/controllers/*.rb'].each {|file| p file }
