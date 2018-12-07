class Request
  attr_accessor :name, :body

  def initialize(name, body)
    @name = name
    @body = body
  end

  def self.open
    code = {
      request: {
        report_in_company_bp: {
        id: 1,
        bp_id: "abc123",
        report_id: 128
        }
      }
    }
  end
end

# report_in_company_bp: {
#   id: 1,
#   bp_id: abc123,
#   report_id: 128
# }