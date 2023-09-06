# Ingredient factories

def except_featured(name)
  name.gsub(/#{Ingredient::FEATURED.join('|')}/i, "any ingredient will do")
end
