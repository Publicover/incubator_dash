x = "my name is jim and here i am to tell you a lot of stuff about computers oh boy here we go: what's the deal with computers?"
y = "Think about brands that you love. Taglines you remember, products you use every day or recommend to friends of yours."

z = x.scan(/./)

def truncate_description(description)
  stopping_point = description.index(/\./)
  short_description = description[0..stopping_point]
end
