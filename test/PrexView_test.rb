require "minitest/autorun"
require "prexview"

class PrexViewTest < Minitest::Test
  def test_params_for_all_required_options_present_xml
    code, response = PrexView.transform({type: 'xml', design: "design-xml", text: "<xml>hello world</xml>", token: "#{ENV['PREXVIEW_TOKEN']}" })
    assert_equal "200", code
  end

  def test_params_for_all_required_options_present_json
    code, response = PrexView.transform({type: 'json', design: "design-json", text: { "hello": "world" } , token: "#{ENV['PREXVIEW_TOKEN']}" })
    assert_equal "200", code
  end

  def test_params_for_all_required_options_except_token_present_xml
    code, response = PrexView.transform({type: 'xml', design: "design-xml", text: "<xml>hello world</xml>"})
    assert_equal "200", code
  end

  def test_params_for_all_required_options_except_token_present_json
    code, response = PrexView.transform({type: 'json', design: "design-json", text: { "hello": "world" } })
    assert_equal "200", code
  end
end
