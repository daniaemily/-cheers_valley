require 'nokogiri'

filepath  = 'winename.xml'
builder   = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do
  beers do
    beer do
      name        'Edelweiss'
      appearance  'White'
      origin      'Austria'
    end
    beer do
      # [...]
    end
  end
end

File.open(filepath, 'wb') { |file| file.write(builder.to_xml) }
