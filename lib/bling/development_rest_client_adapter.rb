require "ostruct"

module Bling
  class DevelopmentRestClientAdapter

    def self.http_get url, headers = {}
      body = <<-BODY.freeze
      {\"retorno\":{\"notasfiscais\":[{\"notafiscal\":{\"serie\":\"1\",\"numero\":\"001793\",\"loja\":\"0\",\"numeroPedidoLoja\":null,\"tipo\":\"S\",\"situacao\":\"Emitida DANFE\",\"cliente\":{\"nome\":\"Jaison De Moura Santos\",\"cnpj\":\"88138070315\",\"ie\":\"\",\"rg\":\"\",\"endereco\":\"Rua agudos\",\"numero\":\"116\",\"complemento\":\"Dep\\u00f3sito de g\\u00e1s consigas\",\"cidade\":\"Osasco\",\"bairro\":\"Rochdale\",\"cep\":\"06.223-140\",\"uf\":\"SP\",\"email\":\"cx-danfe@pitzi.com.br\",\"fone\":\"1145585669\"},\"contato\":\"Jaison De Moura Santos\",\"cnpj\":\"88138070315\",\"vendedor\":\"\",\"dataEmissao\":\"2014-08-04 00:00:00\",\"valorNota\":\"100.00\",\"chaveAcesso\":\"35140813403189000105550010000017931246248418\",\"xml\":\"https:\\/\\/bling.com.br\\/relatorios\\/nfe.xml.php?s&chaveAcesso=35140813403189000105550010000017931246248418\",\"linkDanfe\":\"https:\\/\\/bling.com.br\\/doc.view.php?id=182cff5ae125e87ee920dc33ebb65dc5\",\"codigosRastreamento\":[],\"cfops\":[\"5949\"],\"tipoIntegracao\":\"api\"}},{\"notafiscal\":{\"serie\":\"1\",\"numero\":\"001793\",\"loja\":\"0\",\"numeroPedidoLoja\":\"127031\",\"tipo\":\"S\",\"situacao\":\"Autorizada\",\"cliente\":{\"nome\":\"Carmen Izidora De Oliveira Correa\",\"cnpj\":\"13698177897\",\"ie\":\"\",\"rg\":\"\",\"endereco\":\"RUA S\\u00c3O JOAO\",\"numero\":\"359\",\"complemento\":\"\",\"cidade\":\"Birigui\",\"bairro\":\"JARDIM NOSSA SENHORA DE FATIMA\",\"cep\":\"16.200-755\",\"uf\":\"SP\",\"email\":\"cx-danfe@pitzi.com.br\",\"fone\":\"18997445919\"},\"contato\":\"Carmen Izidora De Oliveira Correa\",\"cnpj\":\"13698177897\",\"vendedor\":\"\",\"dataEmissao\":\"2018-03-05 14:24:50\",\"valorNota\":\"640.77\",\"chaveAcesso\":\"35180313403189000296550010000017931020948887\",\"xml\":\"https:\\/\\/bling.com.br\\/relatorios\\/nfe.xml.php?s&chaveAcesso=35180313403189000296550010000017931020948887\",\"linkDanfe\":\"https:\\/\\/bling.com.br\\/doc.view.php?id=d29a5340f4937d8c63bb6f894d31d5f3\",\"codigosRastreamento\":[],\"cfops\":[\"5949\"],\"tipoIntegracao\":\"Api\"}},{\"notafiscal\":{\"serie\":\"1\",\"numero\":\"001793\",\"loja\":\"203242027\",\"numeroPedidoLoja\":\"181822\",\"tipo\":\"S\",\"situacao\":\"Autorizada\",\"cliente\":{\"nome\":\"Cristiane Pereira Da Silva \",\"cnpj\":\"25497172873\",\"ie\":\"\",\"rg\":\"\",\"endereco\":\"Rua Itapeva\",\"numero\":\"86\",\"complemento\":\"casa \",\"cidade\":\"Po\\u00e1\",\"bairro\":\"Jardim Selma Helena\",\"cep\":\"08.090-140\",\"uf\":\"SP\",\"email\":\"cx-danfe@pitzi.com.br\",\"fone\":\"00000000000\"},\"contato\":\"Cristiane Pereira Da Silva \",\"cnpj\":\"25497172873\",\"vendedor\":\"\",\"dataEmissao\":\"2019-03-14 13:57:00\",\"valorNota\":\"604.95\",\"chaveAcesso\":\"35190313403189000377550010000017931256576996\",\"xml\":\"https:\\/\\/bling.com.br\\/relatorios\\/nfe.xml.php?s&chaveAcesso=35190313403189000377550010000017931256576996\",\"linkDanfe\":\"https:\\/\\/bling.com.br\\/doc.view.php?id=a086c1ccbf9fe5fdc5b032e4b3badba5\",\"codigosRastreamento\":[],\"cfops\":[\"5949\"],\"tipoIntegracao\":\"Api\"}}]}}
      BODY
      OpenStruct.new(:status => 200, :body => body)

    rescue StandardError => e
      OpenStruct.new(:status => 500, :body => "message: #{e.message} | backtrace: #{e.backtrace.join("|")}")
    end
    
    def self.http_post url, params = {}
      body_create = "{\"retorno\":{\"notasfiscais\":[{\"notaFiscal\":{\"situacao\":\"2\",\"numero\":\"127601\",\"serie\":\"1\",\"codigos_rastreamento\":{\"codigo_rastreamento\":null},\"volumes\":null,\"idNotaFiscal\":6725350805}}]}}".freeze
      
      body_send = "{\"retorno\":{\"notasfiscais\":[{\"notaFiscal\":{\"situacao\":\"2\",\"numero\":\"127601\",\"serie\":\"1\",\"codigos_rastreamento\":{\"codigo_rastreamento\":null},\"volumes\":null,\"idNotaFiscal\":6725350805}}, {\"notafiscal\":{\"situacao\":\"2\",\"chaveAcesso\": \"teste dev\",\"linkDanfe\": \"Rails Development environment\", \"numero\":\"127601\",\"serie\":\"1\",\"codigos_rastreamento\":{\"codigo_rastreamento\":null},\"volumes\":null,\"idNotaFiscal\":6725350805}}]}}".freeze
      OpenStruct.new(:status => 201, :body => url.match(/&number/) ? body_send : body_create )

    rescue StandardError => e
      OpenStruct.new(:status => 500, :body => "message: #{e.message} | backtrace: #{e.backtrace.join("|")}")
    end
  end
end
