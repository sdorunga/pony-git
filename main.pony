use "net/http"
use "json"

actor Main
  new create(env: Env) =>
    let usernames = env.args.slice(1)
    for username in usernames.values() do
      Request.create(env).get(username)
    end

