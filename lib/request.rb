class Request
  attr_accessor :name, :body

  def open
    code = {
      request: {
        report_in_company_bp: {
        id: 123,
        bp_id: "abc123",
        report_id: 128
        }
      }
    }
  end

  def name
    incoming_request = open
    @request_code = incoming_request.dig(:request)
    @request_name = @request_code.keys[0].to_s
  end

  def body
    @incoming_request = open
    @request_code = @incoming_request.dig(:request)
    @request_body = @request_code.values[0]
  end
end