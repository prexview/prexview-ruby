require "minitest/autorun"
require "prexview"

class PrexViewTest < Minitest::Test
  def test_params_for_all_required_options_present_xml
    code, response = PrexView.send_xml("<xml>hello world</xml>", {type: 'xml', design: "design-xml", token: "#{ENV['PREXVIEW_TOKEN']}" })
    assert_equal "200", code
  end

  def test_params_for_all_required_options_present_json
    code, response = PrexView.send_json( { "hello": "world" } , {type: 'json', design: "design-json", token: "#{ENV['PREXVIEW_TOKEN']}" })
    assert_equal "200", code
  end

  def test_params_for_all_required_options_except_token_present_xml
    code, response = PrexView.send_xml("<xml>hello world</xml>", {type: 'xml', design: "design-xml"})
    assert_equal "200", code
  end

  def test_params_for_all_required_options_except_token_present_json
    code, response = PrexView.send_json({ "hello": "world" }, {type: 'json', design: "design-json" })
    assert_equal "200", code
  end
end
