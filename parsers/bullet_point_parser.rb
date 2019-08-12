require_relative 'base_parser'

class BulletPointParser < BaseParser
  def parse
    "* #{text}"
  end
end
