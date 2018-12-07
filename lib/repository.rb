require 'pry'
require_relative 'storage'
require_relative 'request'
require_relative 'rule'

class Repository

  def storage
    access_rule = Storage.open
    @access_rule_code = access_rule.dig(:rule)
    p @access_rule_name = @access_rule_code[:resource]
    p @access_rule_params = @access_rule_code[:params]
  end

  def rule_creator
    Rule.new(name = @access_rule_name, body = @access_rule_params)
    #  тут могли б створюватись нові правила, які потім би записувались у Storage
  end

  def request
    # це розпарсені дані з першого завдання
    incoming_request = Request.open
    @request_code = incoming_request.dig(:request)
    p @request_name = @request_code.keys[0].to_s
    p @request_body = @request_code.values[0]
  end

  def request_validator
    if @access_rule_name == @request_name && @access_rule_params == @request_body
      puts "Request valid. Access confirmed!"
    else
      puts "Request invalid. Access denied!"
    end
  end
end

Repository.new.request_validator