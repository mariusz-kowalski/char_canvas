# documentation in README file
class CharCanvas
  def initialize
    @canvas = []
  end

  def insert(string, line, column = 0)
    @canvas[line] ||= []
    string.each_char do |char|
      @canvas[line][column] = char
      column += 1
    end
  end

  def paint
    @canvas.each do |line|
      line.each { |char| print char || ' ' } if line
      puts
    end
  end
end
