require_relative 'parsers/link_parser'
require_relative 'parsers/title_parser'
require_relative 'parsers/subtitle_parser'
require_relative 'parsers/separator_parser'
require_relative 'parsers/paragraph_parser'
require_relative 'parsers/enumeration_parser'
require_relative 'parsers/bullet_point_parser'
module MdToJson
  class ElementConverter
    attr_reader :element

    def initialize(element)
      @element= element
    end

    def convert
      return TitleParser.new(element).parse if title?
      return SubtitleParser.new(element).parse if subtitle?
      return SeparatorParser.new(element).parse if separator?
      return ParagrapParser.new(element).parse if paragraph?
      return EnumerationParser.new(element).parse if enumeration?
      return BulletPointParser.new(element).parse if bullet_point?
      return LinkParser.new(element).parse if link?
      ""
    end

    def title?
      paragraph? && element['alignment'].eql?('center')
    end

    def subtitle?
      element['type'].eql?('subtitle')
    end

    def separator?
      element['type'].eql?('separator')
    end

    def paragraph?
      element['type'].eql?('paragraph')
    end

    def enumeration?
      element['type'].eql?('enumeration')
    end

    def link?
      element['type'].eql?('link')
    end

    def bullet_point?
      element['type'].eql?('bulletPoint')
    end
  end
end
