class Header

  attr_reader :text, :type

  TYPE_TITLE = "main_phrase"
  TYPE_SUBTITLE_ONE = "subtitle_one"
  TYPE_SUBTITLE_TWO = "subtitle_two"
  TYPE_SUBTITLE_THREE = "subtitle_three"
  TYPE_SUBTITLE_FOUR = "subtitle_four"

  def initialize(text, type)
    @text = text
    @type = type
  end

  def build
    {
      "type": type,
      "alignment": "center",
      "index": 0,
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
