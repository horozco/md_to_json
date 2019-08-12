class Enumeration

  attr_reader :text, :index

  def initialize(text, index = 1)
    @text = text
    @index = index
  end

  def build
    {
      "type": "enumeration",
      "alignment": "center",
      "index": index,
      "content": [
        {
          "type": "text",
          "text": text,
          "color": "#000033",
          "font_type": "regular",
          "font_size": 21,
          "url": ""
        }
      ]
    }
  end
end
