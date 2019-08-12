class Paragraph
  attr_reader :text
  LINK_REGEX = /(\[([^\[]+)\]\(([^\)]+)\))/
  LINK_REGEX_WITHOUT_GROUP = /\[([^\[]+)\]\(([^\)]+)\)/
  # Emphasis
  BOLD = /(\*\*|__)(.*?)\1/
  ITALIC = /(\*|_)(.*?)\1/
  UNDERLINE = /(~~)(.*?)\1/
  LINEBREAK = /\n/

  def initialize(text)
    @text = text
  end

  def build
    {
      "type": "paragraph",
      "alignment": "left",
      "index": 0,
      "content": build_content_items
    }
  end

  private

  def build_content_items
    content_items.map do |content|
      link_content = link_data(content)
      link_content.nil? ? build_text(content) : build_link(link_content)
    end.compact
  end

  def link_data(content)
    LINK_REGEX.match(content)
  end

  def build_link(data)
    return Link.new(data[2], data[3]).build
  end

  def build_text(content)
    return if content.empty?
    {
      "type": "text",
      "text": formatted_text(content),
      "color": "#000033",
      "font_type": "regular",
      "font_size": 21,
      "url": ""
    }
  end

  def content_items
    text_divided - link_groups
  end

  def text_divided
    text.split(LINK_REGEX)
  end

  def link_groups
    text.scan(LINK_REGEX_WITHOUT_GROUP).flatten
  end

  def replace_emphasis(text)
    text.gsub!(BOLD, '<b>\2</b>')
    text.gsub!(ITALIC, '<i>\2</i>')
    text.gsub!(UNDERLINE, '<u>\2</u>')
    text.gsub!(LINEBREAK, '<br>')
    text
  end

  def formatted_text(content)
    replace_emphasis(content)
  end
end
