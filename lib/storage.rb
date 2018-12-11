class Storage

  def storaged_rules
    @rules = {
      report_in_company_bp: {
        resource: 'report_in_company_bp',
        description: 'allow access to bp report',
        params: {
          id: 123,
          bp_id: "abc123",
          report_id: 128
        },
        participant: {
          id: 123
        },
        methods: ['GET', 'PUT'],
        action: 'allow'
      },
      second_resourse: {
        resource: 'second resourse',
        description: 'allow access to bp report',
        params: {
          id: 123,
          bp_id: "abc123",
          report_id: 128
        },
        participant: {
          id: 123
        },
        methods: ['GET', 'PUT'],
        action: 'allow'
      }
    }
  end

  def array_of_rules_resources
    @array = []
    @rules.each do |key, value|
      @array.push(value[:resource])
    end
    @array
  end

  def request_name_valid?(request_name)
    array_of_rules_resources.include?(request_name)
  end

end