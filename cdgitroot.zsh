
if [ -z "$CDGITROOT_FILE" ]; then
  CDGITROOT_FILE=~/.cdgitroot
fi
export CDD_FILE

_reg_pwd_gitroot() {
  if [ "`\ls -d .git .hg 2> /dev/null`" != "" ]; then

    local dir=$PWD
    dir="$(echo "$dir" | sed "s;^$HOME;~;")"

    if [ -f "$CDGITROOT_FILE" ]; then
      \grep -v "$dir" "$CDGITROOT_FILE" > "$CDGITROOT_FILE.tmp"
      \cat "$CDGITROOT_FILE.tmp" > "$CDGITROOT_FILE"
      \rm -f "$CDGITROOT_FILE.tmp"
    fi

    echo "$dir" >>"$CDGITROOT_FILE"
  fi
}

_echo_gitroot() {
  local tac
  if which tac > /dev/null; then
      tac="tac"
  else
      tac="tail -r"
  fi
  cat "$CDGITROOT_FILE" | eval $tac
}

