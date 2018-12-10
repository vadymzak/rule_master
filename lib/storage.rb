class Storage

  def open
    @code = {
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

  def array_of_rules
    @array = []
    @code.each do |key, value|
      @array.push(value[:resource])
    end
    @array
  end

end