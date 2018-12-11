require 'pry'
require_relative 'storage'
require_relative 'request'
require_relative 'rule'

class Repository

  def initialize
    @storage = Storage.new
    @storaged_rules = @storage.storaged_rules
  end

  def request_name_valid?
    @request = Request.new
    storaged_sample(@request.name.to_sym) if @storage.request_name_valid?(@request.name)
  end

  def storaged_sample(rule)
    @access_rule = @storaged_rules.dig(rule)
  end

  def storaged_rule_params
    @access_rule[:params] unless @access_rule.nil?
  end

  def request_params_valid?
    storaged_rule_params == @request.params
  end
end

rep = Repository.new
rep.request_name_valid?
puts rep.request_params_valid?