# core.rb

class Dungeon::Core
  attr_accessor :width, :height, :fullscreen, :caption, :cpack, :controls
  def initialize
    settings = YAML.load_file("#{$0}/../../db/global.yml")
    @width = settings["width"]
    @height = settings["height"]
    @fullscreen = settings["fullscreen"]
    @caption = Dungeon::GAME_TITLE
    @cpack = Dungeon::STD_CONTENT_PACK
    @controls = Dungeon::STD_CONTROLS
  end
  def h_center
    @width/2
  end
  def v_center
    @height/2
  end
  def unit
    #always assuming 16:9
    @height/18
  end
  def check_touch(box_a, box_b)
    box_a[1][0] < box_b[0][0] || box_a[0][0] > box_b[1][0] || box_a[1][1] < box_b[0][1] || box_a[0][1] > box_b[1][1] ? false :true
  end
  def routine # dynamic value operations on every window update go here
    $cursor.update $window.mouse_x, $window.mouse_y
    @screen.job :update
    $window.caption = self.caption
    $keyboard.react
  end
  def screen= (screen)
    $images.reset
    $keyboard.reset
    @screen = $screens.get(screen)
    $window.load
  end
  def screen
    @screen
  end
  def get_strings(name)
    YAML.load_file("#{$0}/../../db/strings/#{name}.yml")
  end
  def quit
    $window.close
  end
end