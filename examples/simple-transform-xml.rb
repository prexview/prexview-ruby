require 'prex_view'

def send_request
  handle  = File.open('data/simple-invoice.xml', 'r')
  xml = handle.read

  code, response = PrexView.send_xml(xml, { type: 'xml', design: "invoice-xml" })

  if ("200".."299").to_a.include? code
    save_in_filesystem response, 'pdf'
  elsif ("400".."499").to_a.include? code
    save_in_filesystem response, 'txt'
  end
end

def save_in_filesystem bytes, ext
  File.open("coso.#{ext}", 'wb') { |output|
    output << bytes
  }
end

def main
  send_request
end

main