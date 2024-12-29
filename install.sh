# bash install.sh firefox
# bash install.sh chrome

script_dir=$(dirname "$(readlink -f "$0")")

install_on_chrome() {
  cp "$script_dir/manifest_chrome.json" "$script_dir/manifest.json"
  swaymsg exec google-chrome chrome://extensions/
  # notify-send "" "body" # 一定要給summary，不然會遇到No summary specified.
  notify-send -t 8000 "餵入json" "
    指派vimium的目錄給它即可
    (ctrl+L and input: chrome://extensions/)
  "
  # yad --info --text="ctrl+L and input: chrome://extensions/"
  # yad --info --text="指派vimium的目錄給它即可"
}

install_on_filefox() {
  cp "$script_dir/manifest_firefox.json" "$script_dir/manifest.json"
  swaymsg exec firefox about:debugging#/runtime/this-firefox
  notify-send -t 8000 "餵入json" "將manifest.json的路徑餵入即可"
  # yad --info --text="將manifest.json的路徑餵入即可"
}

case "$1" in
  "chrome")
    install_on_chrome
    ;;
  "firefox")
    install_on_filefox
    ;;
  *)
    echo "Please specify 'chrome' or 'firefox' as an argument"
    ;;
esac
