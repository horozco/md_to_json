require_relative 'elements/link'
require_relative 'elements/bullet_point'
require_relative 'elements/header'
require_relative 'elements/separator'
require_relative 'elements/paragraph'
require_relative 'elements/enumeration'

module MdToJson
  class StructureBuilder

    attr_reader :md_content
    LINE_SEPARATOR = /\r\n/

    def initialize(md_content)
      @md_content = md_content
    end

    def build
     elements = build_elements
      {
       "reader": elements.map { |e| e.build }
      }.to_json
    end

    private

    def build_elements
      elements = []
      previous_element = nil

      md_content.split(LINE_SEPARATOR).each do |line|
        plain_line = line.gsub(LINE_SEPARATOR, '')

        new_element = MdToJson::ElementIdentifier.new(plain_line, previous_element).identify
        elements = delete_previous_element_if_paragrah(new_element, previous_element, elements)
        elements.push(new_element) if !new_element.nil?

        previous_element = new_element
      end

      # require 'pp'
      # pp elements
      elements
    end

    def delete_previous_element_if_paragrah(new, previous, elements)
      elements.pop if new.class.eql?(Paragraph) && previous&.class.eql?(Paragraph)
      elements
    end
  end
end
