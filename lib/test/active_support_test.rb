#!/usr/bin/env ruby
require_relative "test_helper"

class ActiveSupportTest < MiniTest::Test
  def test_search_for_file
    file = ActiveSupport::Dependencies.search_for_file("application_controller")
    assert_equal "#{__dir__}/muffin_blog/app/controllers/application_controller.rb", file

    file = ActiveSupport::Dependencies.search_for_file("unknown")
    assert_nil file
  end

  def test_case_name
    # :ApplicationController => "application_controller"
    assert_equal "post", :Post.to_s.underscore
    assert_equal "application_controller", :ApplicationController.to_s.underscore
  end

  def test_load_missing_constants
    Post
  end
end
