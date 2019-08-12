module MdToJson
  class JSONParser

    attr_reader :json_content

    def initialize(json_content)
      @json_content = json_content
    end

    def elements
      JSON.parse(json_content)['reader']
    end

    def parse
      output = ""
      elements.each do |element|
        result = ElementConverter.new(element).convert
        output += "#{result}\r\n"
      end
      output
    end
  end
end
