require 'opal'
# require 'opal_ujs'
# require 'turbolinks'
require_tree '.'

Document.ready? do
  Element.find('body').html = '<h1>Hello World from Opal!</h1>'
end
