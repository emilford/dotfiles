from kitty.boss import get_boss
from kitty.fast_data_types import Screen, get_options
from kitty.tab_bar import (
    DrawData,
    ExtraData,
    Formatter,
    TabBarData,
    as_rgb,
    draw_attributed_string,
    draw_tab_with_separator,
    draw_title,
)
from kitty.utils import color_as_int
from pathlib import Path


def _draw_right_status(screen: Screen, is_last: bool, cells: list) -> int:
    if not is_last:
        return 0

    draw_attributed_string(Formatter.reset, screen)

    right_status_length = 1
    for _, _, cell in cells:
        right_status_length += len(cell)

    screen.cursor.x = screen.columns - right_status_length
    screen.cursor.fg = 0
    screen.cursor.bg = 0

    for fg, bg, text in cells:
        screen.cursor.fg = fg
        screen.cursor.bg = bg
        screen.draw(text)

    return screen.cursor.x

def _get_cwd():
    cwd = ""
    tab_manager = get_boss().active_tab_manager
    if tab_manager is not None:
        window = tab_manager.active_window
        if window is not None:
            cwd = window.cwd_of_child

    cwd_parts = list(Path(cwd).parts)

    return cwd_parts[-1]

def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    end = draw_tab_with_separator(
        draw_data,
        screen,
        tab,
        before,
        max_title_length,
        index,
        is_last,
        extra_data
    )

    options = get_options()
    inactive_tab_fg = as_rgb(color_as_int(options.inactive_tab_foreground))
    inactive_tab_bg = as_rgb(color_as_int(options.inactive_tab_background))

    cells = []
    cells.append((inactive_tab_fg, inactive_tab_bg, _get_cwd()))

    _draw_right_status(screen, is_last, cells)

    return end
