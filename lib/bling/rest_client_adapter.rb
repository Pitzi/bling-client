module Bling
  class RestClientAdapter
    extend Loggable

    def self.http_get url, headers = {}
      log "RestClientAdapter::http_get url: #{url} headers: #{headers}"
      response = RestClient.get(url, headers)
      log "RestClientAdapter::http_get response: #{response.inspect}"

      OpenStruct.new(:status => response.code, :body => response.body)

    rescue StandardError => e
      OpenStruct.new(:status => 500, :body => "message: #{e.message} | backtrace: #{e.backtrace.join("|")}")
    end
    
    def self.http_post url, params = {}
      log "RestClientAdapter::http_post url: #{url} params: #{params}"
      response = RestClient.post(url, params)
      log "RestClientAdapter::http_post response: #{response.inspect}"

      OpenStruct.new(:status => response.code, :body => response.body)

    rescue StandardError => e
      OpenStruct.new(:status => 500, :body => "message: #{e.message} | backtrace: #{e.backtrace.join("|")}")
    end
  end
end
