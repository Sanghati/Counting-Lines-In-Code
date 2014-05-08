class CodeLine

  attr_accessor :file_path
  def initialize(file_path)
      @file_path = file_path
  end

  def count 
    remove_comented_line = false
    count_lines = 0
         File.readlines(@file_path).each do |line|
             if remove_comented_line
                   remove_comented_line = false
             elsif is_blank_line?(line)||is_single_line_comment?(line)||is_multiline_comment?(line)
             elsif is_end_of_multiline_comment?(line)
                   if is_multiline_comment_between_sentences?(line)
                     count_lines += 1
                   else
                   end
             elsif is_start_of_multiline_comment?(line)
                   remove_comented_line = true 
             elsif is_multiline_comment_between_sentences?(line)
                   count_lines +=1
             else
                   count_lines +=1
             end
      end
  count_lines                                     
  end

  def is_blank_line?(line)
      line.match(/^\s*\n/)
  end

  def is_single_line_comment?(line)
      line.match(/\/\/[\s\S]*/)
  end

  def is_start_of_multiline_comment?(line)
      line.match(/^\/\*.*?[\s]/)
  end

  def is_multiline_comment?(line)
      line.match(/^\/\*.*?\*\//)
  end

  def is_multiline_comment_between_sentences?(line)
      line.match(/\/\*[\s\S]*?\*\//)
  end

  def is_end_of_multiline_comment?(line)
      line.match(/^.*?\*\//)   
  end

end
