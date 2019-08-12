require_relative 'base_parser'

class LinkParser < BaseParser
  def parse
    "[#{text}](#{url})"
  end

  private

  def text
    element['text']
  end

  def url
    element['url']
  end
end
