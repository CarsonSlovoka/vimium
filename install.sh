# bash install.sh firefox
# bash install.sh chrome

install_on_chrome() {
  cp manifest_chrome.json manifest.json
  google-chrome chrome://extensions/
  zenity --info --text="ctrl+L and input: chrome://extensions/"
  zenity --info --text="指派vimium的目錄給它即可"
}

install_on_filefox() {
  cp manifest_firefox.json manifest.json
  firefox about:debugging#/runtime/this-firefox
  zenity --info --text="將manifest.json的路徑餵入即可"
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
