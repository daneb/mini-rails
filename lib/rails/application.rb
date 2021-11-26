# lib/application.rb

module Rails
  class Application
    def self.inherited(klass)
      super
      @instance = klass.new
    end

    class << self
      attr_reader :instance
    end

    def initialize!
      full_path_with_error = caller.first
      config_environment_path = full_path_with_error.split(":").first
      @root = File.expand_path("../..", config_environment_path)
      ActiveSupport::Dependencies.autoload_paths = Dir["#{@root}/app/*"]
      ActiveRecord::Base.establish_connection(database: "#{@root}/db/#{Rails.env}.sqlite3")
    end

    attr_reader :root
  end
end
