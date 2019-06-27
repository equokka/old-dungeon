# new.rb

$screens.add do |job, args=nil|
  case job
  when :name
    :new
  when :init
    $images.mass_add ["menu_bg", "/menu/bg.png"], ["menu_highlight", "/menu/highlight.png"], ["cursor_default", "/cursor/default.png"], ["menu_bg_sides", "/menu/bg_sides.png"], ["menu_button_right", "/menu/button_right.png"], ["menu_textinput", "/menu/textinput.png"]
    $images.mass_add_text ["menu_title", "NEW GAME", $game.unit * 2], ["menu_name", "NAME", $game.unit], ["menu_difficulty", "DIFFICULTY:", $game.unit], ["menu_back", "BACK", $game.unit * 2], ["menu_create", "CREATE", $game.unit * 2]
    $cursor.image = IMG("cursor_default")
    $game.caption = "#{Dungeon::GAME_TITLE} - New"
    $keyboard.set 'a' do
      $game.screen = :start
    end
  when :update
  when :draw
    $cursor.draw 5
    IMG("menu_bg").draw_as_quad(0, 0, 0xffffffff, $game.width, 0, 0xffffffff, $game.width, $game.height, 0xffffffff, 0, $game.height, 0xffffffff, 0)
    IMG("menu_bg_sides").draw_as_quad(0, 0, 0xffffffff, $game.width, 0, 0xffffffff, $game.width, $game.height, 0xffffffff, 0, $game.height, 0xffffffff, 2)
    IMG("menu_title").draw_rot        $game.h_center, IMG("menu_title").v_center + $game.unit * 1,  3, 0, 0.5, 0.5, 1, 1, Gosu::Color::BLACK
    IMG("menu_name").draw_rot         $game.h_center, IMG("menu_name").v_center + $game.unit * 4,  3, 0, 0.5, 0.5, 1, 1, Gosu::Color::BLACK
    IMG("menu_textinput").draw_rot    $game.h_center, IMG("menu_textinput").v_center + $game.unit * 6, 3, 0, 0.5, 0.5, ($game.h_center - $game.unit * 2)/IMG("menu_textinput").width, $game.unit * 2 / IMG("menu_textinput").height
    IMG("menu_difficulty").draw_rot   $game.width/4 + IMG("menu_difficulty").h_center + $game.unit, IMG("menu_difficulty").v_center + $game.unit * 9, 3, 0, 0.5, 0.5, 1, 1, Gosu::Color::BLACK
    IMG("menu_back").draw_rot         $game.width/4 + IMG("menu_button_right").h_center, IMG("menu_back").v_center + $game.unit * 13, 4, 0, 0.5, 0.5, 1, 1, Gosu::Color::BLACK
    IMG("menu_create").draw_rot       $game.width/4*3 - IMG("menu_create").h_center - $game.unit, IMG("menu_create").v_center + $game.unit * 13, 4, 0, 0.5, 0.5, 1, 1, Gosu::Color::BLACK

    IMG("menu_button_right").draw_rot $game.width/4*3 - IMG("menu_button_right").h_center, IMG("menu_button_right").v_center + $game.unit * 12, 3, 0, 0.5, 0.5, 1, 1
    IMG("menu_button_right").draw_rot $game.width/4 + IMG("menu_button_right").h_center, IMG("menu_button_right").v_center + $game.unit * 12, 3, 180, 0.5, 0.5, 1, 1
    # this is so messy
    w = 0
    [IMG("menu_difficulty").v_center + $game.unit * 9].each do |y|
      which = [IMG("menu_difficulty")][w]
      IMG("menu_highlight").draw_rot $game.h_center, y, 1, 0, 0.5, 0.5, $game.width/IMG("menu_highlight").width, which.height/IMG("menu_highlight").height unless $game.check_touch([[$game.width/4, y - $game.unit], [($game.width/4)*3, y + $game.unit]], $cursor.box)
      w += 1
    end
  end
end