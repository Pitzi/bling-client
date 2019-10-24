require "bling/models/xml_resource"

module Bling
  class TransporteXml < XmlResource
    attribute :transportadora, String
    attribute :cpf_cnpj, String
    attribute :ie_rg, String
    attribute :endereco, String
    attribute :cidade, String
    attribute :uf, String
    attribute :placa, String
    attribute :uf_veiculo, String
    attribute :tipo_frete, String
    attribute :qtde_volumes, Integer
    attribute :especie, String
    attribute :numero, String
    attribute :peso_bruto, String
    attribute :peso_liquido, String
    attribute :servico_correios, String
    attribute :dados_etiqueta, String
  end
end
