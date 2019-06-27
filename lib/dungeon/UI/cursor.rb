# cursor.rb

class Dungeon::Window::Cursor
  attr_accessor :image, :tooltip
  def initialize
    @x = @y = 0
    @x = 0
  end
  def update(x, y)
    @x = x
    @y = y
  end
  def draw(z)
    @z = z
    @image.draw_rot @x, @y, @z, 0, 0.5, 0.5, 0.5, 0.5 unless @image.nil?
  end
  def pos
    [@x, @y]
  end
  def box
    [[@x - 0.25, @y - 0.25], [@x + 0.25, @y + 0.25]]
  end
  def tooltip(text)
    @tooltip.draw_rot @x, @y, @z, 0, 0.5, 0.5, 0.5, 0.5 unless @tooltip.nil? || @image.nil?
    Gosu::Image.from_text($window, text, "media/#{$game.cpack}/font/default.ttf", Dungeon::DEFAULT_FONT_HEIGHT) #assuming $window is already declared
  end
end