class Request

  def request
    incoming_request = {
      report_in_company_bp: {
        id: 123,
        bp_id: "abc123",
        report_id: 128
      }
    }
  end

  def name
    @request_name = request.keys[0].to_s
  end

  def params
    @request_body = request.values[0]
  end
end