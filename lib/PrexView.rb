require "PrexView/version"
require "PrexView/prex_view_service"

module PrexView
  def self.send_xml xml, options
    # Send doc to PrexView
    #
    # Example:
    #   >> PrexView.send_xml(xml, {type: "xml/json", token: "your_token"})
    #   => "200"
    #
    # Arguments:
    #   xml: (String or json)
    #   type: (String)
    #   token: (String)
    code, content = PrexViewService::Transform.new(xml, options).send_xml
  end

  def self.send_json json, options
    # Send doc to PrexView
    #
    # Example:
    #   >> PrexView.send_json(json, {type: "xml/json", token: "your_token"})
    #   => "200"
    #
    # Arguments:
    #   json: (String or json)
    #   type: (String)
    #   token: (String)
    code, content = PrexViewService::Transform.new(json, options).send_json
  end
end
