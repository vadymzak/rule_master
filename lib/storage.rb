require_relative 'parsed_request'
require_relative 'validator'

class Storage

  attr_reader :access_rules

  def initialize
    @access_rules = {
      report_in_company_bp: {
        resource: 'report_in_company_bp',
        description: 'allow access to bp report',
        params: {
          id: 123,
          bp_id: 'abc123',
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
          bp_id: 'abc123',
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

  def find_rule(rule_name)
    @access_rules[rule_name.to_sym]
  end
end
