class BulletPoint

  attr_reader :text

  def initialize(text)
    @text = text
  end

  def build
    {
      "type": "bulletPoint",
      "content": [
        {
          "type": "text",
          "text": text,
          "color": "",
          "font_type": "",
          "font_size": 18,
          "url": ""
        }
      ]
    }
  end
end
