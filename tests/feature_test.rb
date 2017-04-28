require_relative "./test_helper"
require "feature"

class FeatureTest < MiniTest::Test
  def feature_class
    Feature
  end

  def fake_views
    "./tests/fake"
  end

  def test_supplemental_partial
    feature = feature_class.new(
      partial: "/partials/hairs/hair_1",
      views: fake_views,
    )

    assert_equal(
      "/partials/hairs/background/hair_1".to_sym,
      feature.supplemental_partial,
    )
  end

  def test_supplemental_partial_does_not_exist
    feature = feature_class.new(
      partial: "/partials/hairs/hair_2",
      views: fake_views,
    )

    assert_equal feature.supplemental_partial, ""
  end
end
