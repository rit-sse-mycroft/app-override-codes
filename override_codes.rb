require 'mycroft'
require './nato'

class OverrideCodes < Mycroft::Client

  attr_accessor :verified

  def initialize(host, port)
    @key = ''
    @cert = ''
    @manifest = './app.json'
    @verified = false
    @grammar = OverrideCodeGrammar::xml()
    super
  end

  def connect
  end
  
  def on_event_loop

  end

  def on_data(parsed)
    if parsed[:type] == 'APP_DEPENDENCY'
      parsed[:data].each do |type, deps|
        targets = []
        deps.each do |id, status|
          if status != 'down'
            targets << id
          end
        end
        query(type, 'load_grammar', {grammar: {name: "override_codes", xml: @grammar}}, 30, targets)
      end
    elsif parsed[:type] == 'APP_MANIFEST_OK'
      puts "Going up!"
      up
    end
  end

  def on_end
    
  end
end

Mycroft.start(OverrideCodes)