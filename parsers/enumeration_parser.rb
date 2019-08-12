require_relative 'base_parser'

class EnumerationParser < BaseParser
  def parse
    "> #{text}"
  end
end
