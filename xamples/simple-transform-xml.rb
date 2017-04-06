require 'PrexView'

def send_request
  handle  = File.open('data/simple-invoice.xml', 'r')
  content = handle.read

  code, response = PrexView.transform({ type: 'xml', design: "invoice-xml", text: content })

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