$:.unshift(File.expand_path(File.dirname(__FILE__) + '/../lib'))
require 'taskmapper'
require 'taskmapper-jira'
require 'rspec'
require 'rspec/expectations'

class FakeJiraTool
  attr_accessor :call_stack, :returns

  def initialize
    @call_stack = []
    @returns = {}
  end

  def method_missing *args
    @call_stack << args
    @returns.delete(args.first) if @returns.key?(args.first)
  end
end

RSpec.configure do |config|
  config.color_enabled = true
end

