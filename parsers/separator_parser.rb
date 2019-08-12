require_relative 'base_parser'

class SeparatorParser < BaseParser
  def parse
    "---"
  end
end
