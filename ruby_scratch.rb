x = "my name is jim and here i am to tell you a lot of stuff about computers oh boy here we go: what's the deal with computers?"
y = "Think about brands that you love. Taglines you remember, products you use every day or recommend to friends of yours."

z = x.scan(/./)

def truncate_description(description)
  stopping_point = description.index(/\./)
  short_description = description[0..stopping_point]
end





RESTFUL API:
  using HTML as it was originally intended
  get, put, post, delete
  get should be idempotent: issuing the command twice should not change the outcome for either

what brought you to validic?
why do you like it there?
how big are the teams?
what would be my first assignment?
what does the ideal candidate look like?
