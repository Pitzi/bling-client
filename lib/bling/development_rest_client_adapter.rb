require "ostruct"

module Bling
  class DevelopmentRestClientAdapter

    def self.http_get url, headers = {}
      body = <<-BODY.freeze
      {"retorno":{"notasfiscais":[{"notafiscal":{"serie":"1","numero":"00001","loja":"0000001","numeroPedidoLoja":null,"tipo":"S","situacao":"Autorizada","cliente":{"nome":"Cliente Da Silva","cnpj":"04823194000186","ie":"","rg":"","endereco":"Rua Marrecas","numero":"SN","complemento":"Sem Complemento","cidade":"Teresina","bairro":"Sao Joaquim","cep":"64.005-458","uf":"PI","email":"email@email.com.br","fone":"11999999999"},"contato":"Cliente","cnpj":"04823194000186","vendedor":"","dataEmissao":"2019-10-24 17:07:11","valorNota":"100.00","chaveAcesso":"35191066663189000296660010001286301750544604","xml":"https:\/\/bling.com.br\/relatorios\/nfe.xml.php?s&chaveAcesso=35191066663189000296660010001286301750544604","linkDanfe":"https:\/\/bling.com.br\/doc.view.php?id=34b232e9b9666teste666e847034b35470b26093","codigosRastreamento":[],"cfops":["6949"]}}]}}
      BODY
      OpenStruct.new(:status => 200, :body => body)

    rescue StandardError => e
      OpenStruct.new(:status => 500, :body => "message: #{e.message} | backtrace: #{e.backtrace.join("|")}")
    end
    
    def self.http_post url, params = {}
      body_create = "{\"retorno\":{\"notasfiscais\":[{\"notaFiscal\":{\"situacao\":\"2\",\"numero\":\"000001\",\"serie\":\"1\",\"codigos_rastreamento\":{\"codigo_rastreamento\":null},\"volumes\":null,\"idNotaFiscal\":6798764573}}]}}".freeze
      
      body_send = "{\"retorno\":{\"notasfiscais\":[{\"notaFiscal\":{\"situacao\":\"2\",\"numero\":\"0000011\",\"serie\":\"1\",\"codigos_rastreamento\":{\"codigo_rastreamento\":null},\"volumes\":null,\"idNotaFiscal\":849585648}}, {\"notafiscal\":{\"situacao\":\"2\",\"chaveAcesso\": \"teste dev\",\"linkDanfe\": \"Rails Development environment\", \"numero\":\"0000001\",\"serie\":\"1\",\"codigos_rastreamento\":{\"codigo_rastreamento\":null},\"volumes\":null,\"idNotaFiscal\":83756484929}}]}}".freeze
      OpenStruct.new(:status => 201, :body => url.match(/&number/) ? body_send : body_create )

    rescue StandardError => e
      OpenStruct.new(:status => 500, :body => "message: #{e.message} | backtrace: #{e.backtrace.join("|")}")
    end
  end
end
