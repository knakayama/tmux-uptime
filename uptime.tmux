#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

uptime="#($CURRENT_DIR/scripts/uptime.sh)"
uptime_interpolation_string="\#{uptime}"

source "${CURRENT_DIR}/scripts/helpers.sh"

do_interpolation() {
  local string="$1"
  local interpolated="${string/$uptime_interpolation_string/$uptime}"

  echo "$interpolated"
}

update_tmux_option() {
  local option="$1"
  local option_value="$(get_tmux_option "$option")"
  local new_option_value="$(do_interpolation "$option_value")"

  set_tmux_option "$option" "$new_option_value"
}

update_tmux_option "status-right"
update_tmux_option "status-left"
