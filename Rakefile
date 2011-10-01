ROOT_PATH = File.expand_path(File.dirname(__FILE__))
LIB_PATH = File.join(ROOT_PATH, 'lib')
$: << LIB_PATH if File.directory?(LIB_PATH) && !$:.include?(LIB_PATH)

Dir["#{LIB_PATH}/tasks/**/*.rake"].each { |f| load f }