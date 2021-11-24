#!/usr/bin/env ruby
require_relative "test_helper"
require "active_support"

class ActiveSupportTest < MiniTest::Test
  def setup
    ActiveSupport::Dependencies.autoload_paths = Dir["#{__dir__}/muffin_blog/app/*"]
  end

  def test_search_for_file
    file = ActiveSupport::Dependencies.search_for_file("application_controller.rb")
    assert_equal "#{__dir__}/muffin_blog/app/controllers/application_controller.rb", file
  end
end
