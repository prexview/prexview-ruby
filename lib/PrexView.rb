require "PrexView/version"

module PrexView
  def self.transform options
    # Send doc to PrexView
    #
    # Example:
    #   >> PrexView.transform({type: "xml/json", text: "<hello>Workd</hello>", token: "your_token"})
    #   => "200"
    #
    # Arguments:
    #   type: (String)
    #   text: (String or json)
    #   token: (String)
    PrexViewService::Transform.new(options).do_it
  end
end
