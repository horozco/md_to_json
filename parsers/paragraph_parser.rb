require_relative 'base_parser'

class ParagrapParser < BaseParser

  def parse
    paragraph_content = ""
    element['content'].each_with_index do |sub_element, index|
      paragraph_content += "#{sub_element['text']}"          if plain_text?(sub_element)
      paragraph_content += LinkParser.new(sub_element).parse if link?(sub_element)
    end
    paragraph_content
  end

  def plain_text?(sub_element)
    sub_element['type'].eql?('text')
  end

  def link?(sub_element)
    sub_element['type'].eql?('link')
  end
end
