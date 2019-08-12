require_relative 'base_parser'

class SubtitleParser < BaseParser
  def parse
    "## #{text}"
  end
end
