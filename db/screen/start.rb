# start.rb

$screens.add do |job|
  case job
  when :name
    :start
  when :init
    $images.mass_add ["menu_bg", "/menu/bg.png"], ["menu_highlight", "/menu/highlight.png"], ["cursor_default", "/cursor/default.png"], ["menu_bg_sides", "/menu/bg_sides.png"]
    $images.mass_add_text ["menu_title", Dungeon::GAME_TITLE.split('').join(' '), $game.unit * 2], ["menu_new", "NEW", $game.unit * 2], ["menu_load", "LOAD", $game.unit * 2], ["menu_settings", "SETTINGS", $game.unit * 2], ["menu_quit", "QUIT", $game.unit * 2], ["menu_version", "( #{Dungeon::VERSION} )", $game.unit]
    $cursor.image = IMG("cursor_default")
    $game.caption = Dungeon::GAME_TITLE
    $keyboard.set 'msl' do
      $game.screen = :new if $game.check_touch [[$game.width/4, (IMG("menu_new").v_center + $game.unit * 4) - $game.unit], [($game.width/4)*3, (IMG("menu_new").v_center + $game.unit * 4) + $game.unit]], $cursor.box
    end
    $keyboard.set 'esc' do
      $game.quit
    end
  when :update
  when :draw
    $cursor.draw 4
    IMG("menu_bg").draw_as_quad(0, 0, 0xffffffff, $game.width, 0, 0xffffffff, $game.width, $game.height, 0xffffffff, 0, $game.height, 0xffffffff, 0)
    IMG("menu_bg_sides").draw_as_quad(0, 0, 0xffffffff, $game.width, 0, 0xffffffff, $game.width, $game.height, 0xffffffff, 0, $game.height, 0xffffffff, 2)
    IMG("menu_title").draw_rot       $game.h_center, IMG("menu_title").v_center +    $game.unit * 1,  3, 0, 0.5, 0.5, 1, 1, Gosu::Color::BLACK
    IMG("menu_new").draw_rot         $game.h_center, IMG("menu_new").v_center +      $game.unit * 4,  3, 0, 0.5, 0.5, 1, 1, Gosu::Color::BLACK
    IMG("menu_load").draw_rot        $game.h_center, IMG("menu_load").v_center +     $game.unit * 7,  3, 0, 0.5, 0.5, 1, 1, Gosu::Color::BLACK
    IMG("menu_settings").draw_rot    $game.h_center, IMG("menu_settings").v_center + $game.unit * 10, 3, 0, 0.5, 0.5, 1, 1, Gosu::Color::BLACK
    IMG("menu_quit").draw_rot        $game.h_center, IMG("menu_quit").v_center +     $game.unit * 13, 3, 0, 0.5, 0.5, 1, 1, Gosu::Color::BLACK
    IMG("menu_version").draw_rot     $game.h_center, $game.height - IMG("menu_version").v_center,     3, 0, 0.5, 0.5, 1, 1, Gosu::Color::BLACK

    # this is so messy
    w = 0
    [IMG("menu_new").v_center + $game.unit * 4, IMG("menu_load").v_center + $game.unit * 7, IMG("menu_settings").v_center + $game.unit * 10, IMG("menu_quit").v_center + $game.unit * 13].each do |y|
      which = [IMG("menu_new"), IMG("menu_load"), IMG("menu_settings"), IMG("menu_quit")][w]
      IMG("menu_highlight").draw_rot $game.h_center, y, 1, 0, 0.5, 0.5, $game.width/IMG("menu_highlight").width, which.height/IMG("menu_highlight").height if $game.check_touch([[$game.width/4, y - $game.unit], [($game.width/4)*3, y + $game.unit]], $cursor.box)
      w += 1
    end
  end
end