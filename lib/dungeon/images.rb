# images.rb

class Dungeon::Images
  def initialize
    @images = {}
  end
  def add(name, path)
    @images[name] = Gosu::Image.new($window, "media/#{$game.cpack}/#{path}", false) unless @images.include? name
  end
  def mass_add(*args)
    args.each do |args|
      add(args[0], args[1])
    end
  end
  def add_text(name, text, font_height = Dungeon::DEFAULT_FONT_HEIGHT, font_path = "default.ttf")
    @images[name] = Gosu::Image.from_text($window, text, "media/#{$game.cpack}/font/#{font_path}", font_height) unless @images.include? name
  end
  def mass_add_text(*args)
    args.each do |args|
      add_text(*args)
    end
  end
  def delete(name)
    @images.delete(name)
  end
  def get(name)
    @images[name]
  end
  def reset
    @images = {}
  end
  def all
    @images
  end
end

def IMG(name)
  $images.get(name)
end

class Gosu::Image
  def h_center
    self.width/2
  end
  def v_center
    self.height/2
  end
end