module Bling
  class RestClientAdapter

    def self.http_get url, headers = {}
      response = RestClient.get(url, headers)

      OpenStruct.new(:status => response.code, :body => response.body)

    rescue StandardError => e
      OpenStruct.new(:status => 500, :body => "message: #{e.message} | backtrace: #{e.backtrace.join("|")}")
    end
    
    def self.http_post url, params = {}
      response = RestClient.post(url, params)

      OpenStruct.new(:status => response.code, :body => response.body)

    rescue StandardError => e
      OpenStruct.new(:status => 500, :body => "message: #{e.message} | backtrace: #{e.backtrace.join("|")}")
    end
  end
end
