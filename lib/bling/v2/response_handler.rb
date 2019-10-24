require 'json'

module Bling
  module V2
    class ResponseHandler
      include Support
      def parse_get(response)
        parsed_response = JSON.parse(response.body)["retorno"]
        if response.status == 200 && present?(parsed_response["notasfiscais"])
          invoice = parsed_response["notasfiscais"].last["notafiscal"]

          if ["Autorizada","Emitida DANFE"].include?(invoice["situacao"])
            SuccessResult.new(invoice_key: invoice["chaveAcesso"],
                              danfe_link: invoice["linkDanfe"],
                              number: invoice["numero"],
                              serie: invoice["serie"],
                              valor: invoice["valorNota"],
                              invoice: invoice)
          elsif errors = parsed_response["erros"] and present?(errors["53"])
            failure_request_for(response, invoice_already_exists: true)
          else
            failure_request_for(response)
          end
        else
          failure_request_for(response)
        end
      end

      def parse_create(response)
          parsed_response = JSON.parse(response.body)["retorno"]

        if response.status == 201 && present?(parsed_response["notasfiscais"])
          invoice = parsed_response["notasfiscais"].last["notaFiscal"]
          SuccessResult.new(number: invoice["numero"], serie: invoice["serie"])
        else
          already_exists = parsed_response["erros"]
            .map { |e| e["erro"]["cod"] rescue nil }
            .compact
            .any? { |cod| cod == 55 }

          failure_request_for(response, invoice_already_exists: already_exists)
        end
      end

      def parse_send(response)
        parsed_response = JSON.parse(response.body)["retorno"]
        if [201, 200].include?(response.status) && present?(parsed_response["notasfiscais"])
          if present?(parsed_response["erros"])
            if parsed_response["erros"].is_a?(Array)
              return failure_request_for(response)
            elsif present?(parsed_response["erros"]["53"])
              return failure_request_for(response, invoice_already_exists: true)
            end
          end
          invoice = parsed_response["notasfiscais"].last["notafiscal"]
          if invoice["situacao"].to_i == 2
            SuccessResult.new(invoice_key: invoice["chaveAcesso"],
                              danfe_link: invoice["linkDanfe"])
          else
            failure_request_for(response)
          end
        else
          failure_request_for(response)
        end
      end

      private

      def failure_request_for(response, invoice_already_exists: false)
        FailResult.new(body: response.body, invoice_already_exists: invoice_already_exists)
      end
    end
  end
end
