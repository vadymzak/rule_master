class Storage

  def initialize
    
  end

  def self.open
    code = {
      rule: {
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
      }
    }
  end

end

# rule: {
#    resource: 'report_in_company_bp',
#    description: 'allow access to bp report',
#    params: {
#      id: 123,
#      bp_id: abc123,
#      report_id: 128
#    },
#    participant: {
#        id: 123
#    },
#    methods: ['GET', 'PUT'],
#    action: 'allow'
# }