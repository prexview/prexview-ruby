require "minitest/autorun"
require "prexview"

class PrexViewTest < Minitest::Test
  def test_params_for_all_required_options_present_xml
    assert_equal "200",
      PrexView.transform({type: 'xml', text: "<xml>hello world</xml>", token: "ryidhJZYWnR7YH7QrXXXGkkNv4s73keCoOLrS6kclD2Eo5IW6T6By9h9ElKBfve8"})
  end

  def test_params_for_all_required_options_present_json
    assert_equal "200",
      PrexView.transform({type: 'json', text: "{'hello':'world'}", token: "ryidhJZYWnR7YH7QrXXXGkkNv4s73keCoOLrS6kclD2Eo5IW6T6By9h9ElKBfve8"})
  end
end
