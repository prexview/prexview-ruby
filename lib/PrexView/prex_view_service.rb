#encoding: UTF-8
require 'net/http'
require "uri"
require "json"

module PrexViewService
  class Transform
    def initialize data_string, options = {}
      @data_string   = data_string

      @uri    = URI("https://api.prexview.com/v1/transform")
      @token  = options.fetch(:token, "#{ENV['PREXVIEW_TOKEN']}")
      @type   = options.fetch(:type, nil)
      @design = options.fetch(:design, nil)
      @output = options.fetch(:options, 'pdf')
      @note   = options.fetch(:note, '')
    end

    def send_xml
      body = { "xml" => @data_string, "design" => @design, "output" => @output, "note" => @note}
      _post body
    end

    def send_json
      body = { "json" => JSON.dump(@data_string), "design" => @design, "output" => @output, "note" => @note}
      _post body
    end

  private
    def _post body
      http = Net::HTTP.new(@uri.host, @uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new @uri, body

      request["content-type"] = 'multipart/form-data; boundary=---011000010111000001101001'
      request["authorization"] = @token
      response = http.request(request)
      response.body

      if ("200".."299").to_a.include? response.code
        [response.code, response.body]
      elsif ("400".."499").to_a.include? response.code
        [response.code, response.body]
      end
    end

    def save_field_in_filesystem filename, bytes
      File.open(filename, 'wb') { |output|
        output << bytes
      }
    end
  end
end