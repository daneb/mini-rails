# lib/dependencies.rb
#

module ActiveSupport
  module Dependencies
    extend self

    attr_accessor :autoload_paths

    self.autoload_paths = []

    def search_for_file(name)
      autoload_paths.each do |path|
        file = File.join(path, "#{name}.rb")
        return file if File.file? file
      end
      nil
    end
  end
end