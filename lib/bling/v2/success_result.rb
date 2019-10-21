class Bling::V2::SuccessResult
  attr_reader :invoice_key, :danfe_link, :number, :serie, :valor, :invoice
  
  def initialize(invoice_key: nil, danfe_link: nil, number: nil, serie: nil, valor: nil, invoice: nil)
    @invoice_key = invoice_key
    @danfe_link = danfe_link
    @number = number
    @serie = serie 
    @valor = valor
    @invoice = invoice
  end

  alias invoice_number number

  def success?
    true
  end
end
