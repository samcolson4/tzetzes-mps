module ArticlesHelper
  def find_mp(id)
    mp = Mp.find(id)
    return mp
  end

  def get_preview_text(word, article_text)
    if article_text.split(" ").length > 0
      text_split = article_text.split(" ")
      article_downcase = [] 
      output_words = []

      before = (-8..-1)
      after = (1..8)
      sentence = []

      text_split.each { |word| article_downcase << word.downcase } 
      
      word_index = article_downcase.index(word.downcase).to_i

      if word_index == 0
        return ""
      else
        before.each { |number| sentence << text_split[word_index + number] }
        output_words << sentence.join(" ")
        output_words << text_split[word_index]
        sentence = []
        after.each { |number| sentence << text_split[word_index + number] }
        output_words << sentence.join(" ")
      
        return output_words
      end
    end
  end

end
