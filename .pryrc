Pry.config.prompt = proc { "💎  " }
Pry.config.editor = 'vim'

begin
  require "awesome_print"

  module Kernel
    def ai(options = {})
      awesome_inspect(options.merge(indent: -2, index: false))
    end
  end

  AwesomePrint.pry!
rescue LoadError
  puts "Could not load Awesome Print."
end

def inline!
  require 'sidekiq/testing/inline'
end

def log!
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

# Don't output anything silly on console load.
''
