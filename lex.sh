PRE=~/conlanging/languages
echo "Please enter language family:"
read LEX

loop() {
  cd ~/conlanging/sca/bin
  micro words.wli
  for lang in "$@"; do
    echo "Processing $lang"
    chmod +x lexurgy
    ./lexurgy sc "$PRE/$LEX/$lang.lsc" words.wli > /dev/null
    cp -f words_ev.wli words.wli > /dev/null
  done
  echo "-----------------------------------------"
  echo ""
  cat words.wli
  echo ""
  echo "-----------------------------------------"
  read -p "Press ENTER to continue..." pause
}

while true
do
  loop "$@"
done