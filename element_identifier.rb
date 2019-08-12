module MdToJson
  class ElementIdentifier
    attr_reader :line, :previous_element
    LINK_REGEX = /(\[([^\[]+)\]\(([^\)]+)\))/

    def initialize(line, previous_element)
      @line = line
      @previous_element = previous_element
    end

    def identify
      return Separator.new if separator?
      return Header.new(line[5, line.size], Header::TYPE_SUBTITLE_FOUR) if header_four?
      return Header.new(line[4, line.size], Header::TYPE_SUBTITLE_THREE) if header_three?
      return Header.new(line[3, line.size], Header::TYPE_SUBTITLE_TWO) if header_two?
      return Header.new(line[2, line.size], Header::TYPE_SUBTITLE_ONE) if header_one?
      return Header.new(line[1, line.size], Header::TYPE_TITLE) if title?
      return Enumeration.new(line[1, line.size], enumeration_index) if enumeration?
      return BulletPoint.new(line[1, line.size]) if bullet_point?
      Paragraph.new(paragraph_text)
    end

    def paragraph_text
      previous_element.class.eql?(Paragraph) ? previous_element.text + "\n" + line : line
    end

    def enumeration?
      line[0,1].eql?('>')
    end

    def enumeration_index
      previous_element.class.eql?(Enumeration) ? previous_element.index + 1 : 1
    end

    def separator?
      line[0,3].eql?('---')
    end

    def bullet_point?
      line[0,1].eql?('*')
    end

    def title?
      line[0,1].eql?('#')
    end

    def header_one?
      line[0,2].eql?('##')
    end

    def header_two?
      line[0,3].eql?('###')
    end

    def header_three?
      line[0,4].eql?('####')
    end

    def header_four?
      line[0,5].eql?('#####')
    end
  end
end
