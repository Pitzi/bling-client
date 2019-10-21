class Bling::V2::FailResult
  attr_reader :body, :invoice_already_exists
  def initialize(body: nil, invoice_already_exists: nil)
    @body = body
    @invoice_already_exists = invoice_already_exists
  end

  alias_method :invoice_already_exists?, :invoice_already_exists

  def success?
    false
  end
end
