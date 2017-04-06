#encoding: UTF-8
require 'net/http'
require "uri"
require "json"

module PrexViewService
  class Transform
    def initialize options = {}
      @uri   = URI("#{ENV['PREXVIEW_URL']}")
      @token = options.fetch(:token, "#{ENV['PREXVIEW_TOKEN']}")
      @type  = options.fetch(:type, nil)
      @text  = options.fetch(:text, nil)
      @design = options.fetch(:design, nil)
      @output = options.fetch(:options, 'pdf')
      @note   = options.fetch(:note, '')
    end

    def do_it
      body = build_body

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

    def build_body
      case @type
      when 'xml'
        { "xml" => @text, "design" => @design, "output" => @output }
      when 'json'
        { "json" => JSON.dump(@text), "design" => @design, "output" => @output}
      end
    end

    def save_field_in_filesystem bytes
      File.open("coso", 'wb') { |output|
        output << bytes
      }
    end
  end
end