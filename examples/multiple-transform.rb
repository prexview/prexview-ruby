require 'PrexView'
require 'json'

def send_request
  array_content = JSON.parse(File.new('data/multiple-invoice.json', 'r').read)
  transform = -> (json) do
    code, response = PrexView.transform(json, { type: 'json', design: "invoice-jso" })
    if ("200".."299").to_a.include? code
      save_in_filesystem response, "#{content["number"]}.pdf"
    elsif ("400".."499").to_a.include? code
      save_in_filesystem response, 'failed.txt'
    end
  end
  array_content.map(&transform)
end

def save_in_filesystem bytes, name_pdf
  directory_name = "multiple-invoice"
  Dir.mkdir(directory_name) unless File.exists?(directory_name)
  File.open("#{directory_name}/#{name_pdf}", 'wb') { |output|
    output << bytes
  }
end

def main
  send_request
end

main