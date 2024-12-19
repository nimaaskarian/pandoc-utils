[ $# -lt 1 ]  && {
  >&2 echo "Usage: pandoc-server.sh init INITDIR"
  exit 1
}

OPTS_FILE=${PANDOC_SERVER_OPTS_FILE:-pandoc-opts}
OPTS=${PANDOC_SERVER_OPTS:---citeproc}
NAME=${PANDOC_SERVER_NAME:-main.md}
HEADERS=${PANDOC_SERVER_HEADERS:-"---\ntitle:\nauthor:\n---\n"}

if [ -f "$OPTS_FILE" ]; then
  >&2 echo \"$OPTS_FILE\" exists
  exit 1
fi

if [ -f "$NAME" ]; then
  >&2 echo \"$NAME\" exists
  exit 1
fi

echo "$OPTS" > "$OPTS_FILE"
printf "%s" "$HEADERS" > "$NAME"