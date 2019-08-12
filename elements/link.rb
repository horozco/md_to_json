class Link

  attr_reader :text, :url

  def initialize(text, url)
    @text = text
    @url = url
  end

  def build
    {
      "type": "link",
      "text": text,
      "color": "#333333",
      "font_type": "regular",
      "font_size": 18,
      "url": url
    }
  end
end
