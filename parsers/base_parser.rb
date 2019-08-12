class BaseParser

  attr_reader :element

  def initialize(element)
    @element = element
  end

  private

  def text
    element['content'][0]['text']
  end
end
