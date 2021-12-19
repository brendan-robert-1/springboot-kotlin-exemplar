function handle_lint {
  ./gradlew ktlintFormat
  ./gradlew ktlintCheck
}

function handle_up {
  ./gradlew build -x test
  docker-compose -f docker/local/docker-compose.yaml up -d db 1>/dev/null 2>/dev/null
  docker-compose -f docker/local/docker-compose.yaml build "$1"
  docker-compose -f docker/local/docker-compose.yaml up -d --force-recreate --no-deps "$1"
  handle_ps
  docker logs -f "$1"
}

function handle_ps {
  echo
  docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
  echo
}


function handle_input {
  case $1 in
      l) handle_lint ;;
      up) handle_up "$2" ;;
  esac
}

handle_input "$1" exemplar