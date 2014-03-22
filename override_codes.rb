require 'mycroft'
require_relative 'nato'

class OverrideCodes < Mycroft::Client

  def initialize(host, port)
    @key = ''
    @cert = ''
    @manifest = './app.json'
    @verified = false
    silence_stream(STDOUT) do
      @grammar = OverrideCodeGrammar::xml()
    end
    @sentgrammar = Hash.new(false)
    super
  end

  on 'APP_MANIFEST_OK' do |data|
    up
  end

  on 'APP_DEPENDENCY' do |data|
    update_dependencies(data)
    targets = []
    @dependencies['stt'].each do |k,v|
      if v == 'up' and not @sent_grammar[k]
        targets << k
      elsif v == 'down' and sent_grammar[k]
        @sent_grammar = false
      end
    end
    query('stt', 'load_grammar', {grammar: {name: "override_codes", xml: @grammar}}, 30, targets)
  end
end

Mycroft.start(OverrideCodes)