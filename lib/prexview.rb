require 'json'

class PrexView

  @@url = 'https://api-beta.prexview.com/v1/'

  @@token = ENV['PXV_API_KEY']

  def initialize(token = ENV['PXV_API_KEY'])
    @@token = token
  end

  def sendXML(content, options)
    checkToken()
  end

  def sendJSON(content, options)
    checkToken()
  end

  private
    def send(data)

    end

    def isJson?(str)
      begin
        JSON.parse(json)
      rescue Exception => e
        return false
      end

      return true
    end

    def checkOptions(format, options)

    end

    def checkToken
      if token.to_s.empty?
        raise 'PrexView environment variable PXV_API_KEY must be set'
    end

end
