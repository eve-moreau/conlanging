PRE=~/Desktop/PC-PC/Lex
echo "Please enter language family:"
read LEX

loop() {
  cd ~/Desktop/PC-PC/lexurgy/bin
  nano words.wli
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
}

loop "$@"
