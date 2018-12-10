require 'pry'
require_relative 'storage'
require_relative 'request'
require_relative 'rule'

class Repository

  def initialize
    @storage = Storage.new
    @storage_codes = @storage.open
    @request = Request.new
  end

  def storage_sample(rule)
    @access_rule_code = @storage_codes.dig(rule)
  end

  def storage_rule_name
    @access_rule_name = @access_rule_code[:resource] unless @access_rule_code.nil?
  end

  def storage_rule_body
    @access_rule_body = @access_rule_code[:params] unless @access_rule_code.nil?
  end

  def request_name_validator
    if @storage.array_of_rules.include?(@request.name)
      puts "Request name valid!"
      storage_sample(@request.name.to_sym)
    else
      puts "Request name invalid. Access denied!"
    end
  end

  def request_body_validator
    if storage_rule_name == @request.name && storage_rule_body == @request.body
      puts "Request body valid. Access confirmed!"
    else
      puts "Request body invalid. Access denied!"
    end
  end
end

rep = Repository.new
rep.request_name_validator
rep.request_body_validator