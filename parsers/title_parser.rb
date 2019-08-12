require_relative 'base_parser'

class TitleParser < BaseParser
  def parse
    "# #{text}"
  end
end
