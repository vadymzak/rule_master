class ParsedRequest

  attr_reader :parsed_request

  def initialize(parsed_request)
    @parsed_request = parsed_request
  end

  def name
    @request_name = @parsed_request.keys[0].to_s
  end

  def params
    @request_params = @parsed_request.values[0]
  end
end