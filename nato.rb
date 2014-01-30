require 'srgs'

module OverrideCodeGrammar
  include Srgs::DSL
  
  extend self
  
  def xml
    grammar 'overridePublic' do
      private_rule 'codes' do
        item '', repeat: "1-8" do
          one_of do
            item 'Alfa'
            item 'Bravo'
            item 'Charlie'
            item 'Delta'
            item 'Echo'
            item 'Foxtrot'
            item 'Golf'
            item 'Hotel'
            item 'India'
            item 'Juliett'
            item 'Kilo'
            item 'Lima'
            item 'Mike'
            item 'November'
            item 'Oscar'
            item 'Papa'
            item 'Quebec'
            item 'Romeo'
            item 'Sierra'
            item 'Tango'
            item 'Uniform'
            item 'Victor'
            item 'Whiskey'
            item 'Xray'
            item 'Yankee'
            item 'Zulu'
            item 'One'
            item 'Two'
            item 'Three'
            item 'Four'
            item 'Five'
            item 'Six'
            item 'Seven'
            item 'Eight'
            item 'Nine'
            item 'Zero'
          end
        end
      end
  
      public_rule 'override' do
        example 'Mycroft, override code Alpha Charlie Zero Niner Xray Romeo'
        item 'Mycroft override code'
        reference 'codes'
      end
    end
  end
end