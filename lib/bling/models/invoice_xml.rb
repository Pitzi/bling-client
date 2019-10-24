require "bling/models/xml_resource"
module Bling
  class InvoiceXml < XmlResource
    attribute :name, String
    attribute :nat_operacao, String
    attribute :tipo, String
    attribute :loja, String
    attribute :tipoPessoa, String
    attribute :cpf_cnpj, String
    attribute :ie_rg, String
    attribute :endereco, String
    attribute :numero, Integer
    attribute :complemento, String
    attribute :bairro, String
    attribute :cep, String
    attribute :cidade, String
    attribute :uf, String
    attribute :fone, String
    attribute :email, String
    attribute :items, Array[ItemXml]
    attribute :transporte, TransporteXml, default: TransporteXml.new
    attribute :obs, String
    attribute :numero_loja, String

    def render_transporte
      transporte.render
    end

    def render_items
      items.reduce('') do |xml, item|
        xml << item.render
      end
    end
  end
end
