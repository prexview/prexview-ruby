require 'PrexView'

def send_request
  json = JSON.parse(File.new('data/simple-invoice.json', 'r').read)
  code, response = PrexView.send_json(json, { type: 'json', design: "invoice-json" })
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