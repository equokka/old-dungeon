# window.rb

class Dungeon::Window < Gosu::Window
  attr_accessor :keys
  def initialize
    super $game.width, $game.height, $game.fullscreen
  end
  def load
    $game.screen.job :init 
  end
  def update
    $game.routine
  end
  def draw
    $game.screen.job :draw unless $game.screen.nil?
  end
  def button_down(id)
    $keyboard.trigger id
  end
end