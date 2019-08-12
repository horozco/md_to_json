# require_relative 'structure_builder'
# require_relative 'json_parser'

# md_content = "# Frase principal del libro - Texto grande nivel 1\r\n\r\n## 1. BLAH\r\n### Your Title here\r\n#### Your Title here\r\n##### Your Title here\r\n\r\n\r\n[This is a link](http://google.com)\r\n\r\n---\r\n\r\n\r\n(separador)\r\n\r\nEsto es un párrafo normal. texto normal que puede tener multiples <u>formatos</u>.\r\n\r\nTexto normal que puede tener multiples <u>formatos</u>. Texto normal que puede tener multiples <u>formatos</u>\r\n\r\n1. ITEM 1\r\n2. ITEM 2\r\n\r\n## Bloque de texto más grande de nivel 2 que puede tener la cantidad deseada de texto pero que no puede contener saltos de línea, si hacemos un salto de línea, ya pierde el formato.\r\n\r\n### Bloque de texto más grande de nivel 3 que puede tener la cantidad deseada de texto pero que no puede contener saltos de línea, si hacemos un salto de línea, ya pierde el formato.\r\n\r\n#### Bloque de texto más grande de nivel 4 que puede tener la cantidad deseada de texto pero que no puede contener saltos de línea, si hacemos un salto de línea, ya pierde el formato.\r\n\r\n_Más texto_ is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n---\r\n\r\n1. Item 1\r\n2. Item 2\r\n3. Item 3 \r\n\r\n---\r\n\r\n* Item 1\r\n* Item 2\r\n* Item 3 \r\n\r\n> Frases con números romanos\r\n\r\n---\r\n\r\n> Frases con números romanos\r\n\r\n> Frases con números romanos\r\n\r\n> Frases con números romanos\r\n\r\nMás texto se puede colocar aquí."

# builder =  MdToJson::StructureBuilder.new(md_content)
# puts " ==========  Structure  =========  "
# puts builder.build

# json_content = File.read("sample_output.json")
# parser = MdToJson::JSONParser.new(json_content)
# puts parser.parse
