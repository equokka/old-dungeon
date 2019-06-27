# main.rb

require 'gosu'
require 'yaml'

# low level stuff
Dungeon = Class.new
require_relative 'constants'

# main stuff
require_relative 'core'
require_relative 'images'
require_relative 'window'
require_relative 'keyboard'

# UI
require_relative 'UI/screen'
require_relative 'UI/cursor'

# other
require_relative '../../db/control/translate' #(sets $translation)

# set globals
$game = Dungeon::Core.new
$window = Dungeon::Window.new
$images = Dungeon::Images.new
$cursor = Dungeon::Window::Cursor.new
$screens = Dungeon::Screen.new
$keyboard = Dungeon::Keyboard.new $translation

# fetch screen files from db
require_relative '../../db/screen/start'
require_relative '../../db/screen/new'

# begin
$game.screen = :start
$window.load
$window.show