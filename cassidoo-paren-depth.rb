# Find and return the maximum depth of parenthesis given a string. If the parenthesis are unbalanced, return -1.
# Example:
# parenDepth("( a((b)) ((c)d) )")
# > 3
# parenDepth("b) (c) ()")
# > -1
# parenDepth("who am I and where do I belong")
# > 0

def paren_depth(str)
  total_open = 0
  total_close = 0
  longest_opens = 0

  current_opens = 0
  str.split('').each do |char|
    if char == '('
      current_opens += 1
      total_open += 1
      longest_opens = current_opens if current_opens > longest_opens
    end

    if char == ')'
      total_close += 1
      current_opens = 0
    end
  end

  no_paren = total_open.zero? && total_close.zero?

  return 0 if no_paren
  return -1 if total_open != total_close
  longest_opens
end

# Testing
puts paren_depth('( a((b)) ((c)d) )') == 3
puts paren_depth('b) (c) ()') == -1
puts paren_depth('who am I and where do I belong') == 0

