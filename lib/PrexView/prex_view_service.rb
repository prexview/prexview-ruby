#encoding: UTF-8
require 'net/http'
require "uri"

module PrexviewService
  class Transform
    def initialize options = {}
      @uri   = URI("https://api-beta.prexview.com/v1/transform")
      @token = options.fetch(:token, nil)
      @type  = options.fetch(:type, nil)
      @text  = options.fetch(:text, nil)
    end

    def do_it 
      prexview = PrexViewService::Transform.new
      body = prexview.build_body

      http = Net::HTTP.new(@uri.host, @uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new @uri, body

      request["content-type"] = 'multipart/form-data; boundary=---011000010111000001101001'
      request["authorization"] = @token
      response = http.request(request)
      response.body
    end

    def build_body 
      case @type
      when 'xml'
        { "xml" => @text, "design" => "design-xml", "output" => "pdf" }
      when 'json'
        { "json" => @text, "design" => "design-json", "output" => "pdf" }
      end
    end

    def save_field_in_filesystem bytes
      File.open("coso", 'wb') { |output|
        output << bytes
      }
    end
  end
end