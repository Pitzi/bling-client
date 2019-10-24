require "bling/models/xml_resource"
module Bling
  class ItemXml < XmlResource
    attribute :codigo, String
    attribute :descricao, String
    attribute :qtde, Integer
    attribute :vlr_unit, Decimal
    attribute :tipo, String
    attribute :un, String
    attribute :peso_bruto, Decimal
    attribute :peso_liq, Decimal
    attribute :class_fiscal, String
    attribute :origem, Integer
    attribute :cest, String
  end
end
