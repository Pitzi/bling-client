module Bling
  module V2
    class Invoice
      attr_accessor :http_adapter, :response_handler


      def self.get(numero: nil, serie: nil)
        new.get(numero: numero, serie: serie)
      end

      def self.create(xml: nil)
        new.create(xml: xml)
      end

      def self.send(numero: nil, serie: nil)
        new.send(numero: numero, serie: serie)
      end

      def initialize(http_adapter: default_rest_client_adapter, response_handler: Bling::V2::ResponseHandler.new)
        @http_adapter = http_adapter 
        @response_handler = response_handler
      end

      def get(numero: nil, serie: nil)
        url = get_url(numero, serie)
        response = http_adapter.http_get(url)
        response_handler.parse_get(response)
      end

      def create(xml: nil)
        response = http_adapter.http_post(post_create_url, {xml: xml})
        response = response_handler.parse_create(response)
      end

      def send(numero:, serie:)
        response = http_adapter.http_post(post_send_url(numero, serie, true))
        response_handler.parse_send(response)
      end

      private
      
      def default_rest_client_adapter
        # USE Bling::RestClientAdapter to access Bling production
        if Bling.env.development?
          Bling::DevelopmentRestClientAdapter
        else
          Bling::RestClientAdapter
        end
      end

      def get_url(numero, serie)
        "https://bling.com.br/Api/v2/notafiscal/#{numero}/#{serie}/json/?apikey=#{Bling.apikey}&loja=1"
      end

      def post_create_url
        "https://bling.com.br/Api/v2/notafiscal/json/?apikey=#{Bling.apikey}"
      end

      def post_send_url(numero, serie, send_email)
        "https://bling.com.br/Api/v2/notafiscal/json/?apikey=#{Bling.apikey}&number=#{numero}&serie=#{serie}&sendEmail=#{send_email}"
      end
    end
  end
end
