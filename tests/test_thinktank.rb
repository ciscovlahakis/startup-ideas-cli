require 'minitest/autorun'
require_relative '../thinktank'
require_relative '../startupidea'

class TestThinktank < Minitest::Test
  def setup
    @thinktank = Thinktank.new
    @example_idea = Thinktank::EXAMPLE_STARTUP_IDEA_HASH
  end

  def test_initialization
    assert_empty @thinktank.startupideas, "Startup ideas should be empty on initialization"
  end

  def test_example_startup_idea
    assert_equal "Facial Robot", @example_idea[:Name]
    assert_equal "A robot that scans your face and applies the right daily skincare for you.", @example_idea[:Description]
  end

  def test_add_startup_idea
    @thinktank.add_startup_idea("Seastead as a Service", "Building artificial floating cities using turret mooring systems.")
    refute_empty @thinktank.startupideas, "Startup ideas should not be empty after adding an idea"
    assert_instance_of StartupIdea, @thinktank.startupideas.first
    assert_equal "Seastead as a Service", @thinktank.startupideas.first.name
    assert_equal "Building artificial floating cities using turret mooring systems.", @thinktank.startupideas.first.description
  end
end
