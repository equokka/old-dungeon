# screen.rb 

class Dungeon::Screen
  def initialize
    @screens = {}
  end
  def add(&screen)
  	name = screen.call :name
    @screens[name] = Dungeon::ScreenLoader.new screen unless @screens.include? name
  end
  def get(name)
    @screens[name]
  end
end

class Dungeon::ScreenLoader
  def initialize(block)
    @instructions = block
  end
  def job(name, *args)
  	@instructions.call name, *args
  end
end