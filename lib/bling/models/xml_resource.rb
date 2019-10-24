require 'mustache'
require 'virtus'
module Bling
  class XmlResource < Mustache
    include Virtus.model
    undef to_hash
    self.path = Bling.root.join("lib/templates/")
  end
end
