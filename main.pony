use "net/http"
use "json"

actor Main
  new create(env: Env) =>
    let usernames = env.args.values()
    for username in usernames do
      Request.create(env).get(username)
    end

