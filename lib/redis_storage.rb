require 'redis'
require_relative 'parsed_request'
require_relative 'validator'
# RedisStorage class store data in redis db
class RedisStorage < Storage
  def initialize
    @redis_rules = Redis.new

    @redis_rules.hset('report_in_company_bp', :resource, 'report_in_company_bp')
    @redis_rules.hset('report_in_company_bp', :description,
                'allow access to bp report')
    @redis_rules.hset('report_in_company_bp', :params, { id: 123, bp_id: 'abc123',
                                                   report_id: 128 })
    @redis_rules.hset('report_in_company_bp', :participant, id: 123)
    @redis_rules.hset('report_in_company_bp', :methods, 'GET')
    @redis_rules.hset('report_in_company_bp', :action, 'allow')

    @redis_rules.hset('second_resourse', :resource, 'second_resourse')
    @redis_rules.hset('second_resourse', :description,
                'allow access to second resourse')
    @redis_rules.hset('second_resourse', :params, { id: 123, bp_id: 'abc123',
                                              report_id: 128 })
    @redis_rules.hset('second_resourse', :participant, id: 123)
    @redis_rules.hset('second_resourse', :methods, 'GET')
    @redis_rules.hset('second_resourse', :action, 'allow')
  end

  def find_rule(rule_name)
    @redis_rules.hgetall(rule_name)
  end
end
