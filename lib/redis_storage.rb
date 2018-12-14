require 'redis'
require_relative 'parsed_request'
require_relative 'validator'
# RedisStorage class store data in redis db
class RedisStorage < Storage
  def initialize
    @redis_rules = Redis.new

    @redis_rules.hmset('report_in_company_bp_new',:resource, 'report_in_company_bp',
                                                  :description, 'allow access to bp report',
                                                  :params, { id: 123, bp_id: 'abc123', report_id: 128 },
                                                  :participant, {id: 123},
                                                  :methods, 'GET',
                                                  :action, 'allow')
    @redis_rules.hmset('second_resourse1',  :resource, 'second_resourse1',
                                            :description, 'allow access to second resourse',
                                            :params, { id: 123, bp_id: 'abc123', report_id: 128 },
                                            :participant, {id: 123},
                                            :methods, 'GET',
                                            :action,  'allow')
    p @redis_rules.hgetall('report_in_company_bp_new')
  end

  def find_rule(rule_name)
    @redis_rules.hgetall(rule_name)
  end
end
