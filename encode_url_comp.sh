# Returns a string in which all non-alphanumeric characters except -_.~ have
# been replaced with a percent (%) sign followed by two hex digits.
#
# Original author: https://github.com/sfinktah
# References:
# - https://stackoverflow.com/questions/296536/how-to-urlencode-data-for-curl-command
# - https://github.com/sfinktah/bash/blob/master/rawurlencode.inc.sh
encode_url_comp() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for ((pos = 0; pos < strlen; pos++)); do
    c=${string:$pos:1}
    case "$c" in
    [-_.~a-zA-Z0-9]) o="${c}" ;;
    *) printf -v o '%%%02x' "'$c" ;;
    esac
    encoded+="${o}"
  done
  echo "${encoded}"
}
