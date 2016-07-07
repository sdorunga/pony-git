use "net/http"

actor Request
  let _env : Env
  new create(env: Env) =>
    _env = env

  be get(username: String) =>
    try
      let url = URL.build("https://api.github.com/users/" + username)
      var handler = LoginPrinter.create(_env)
      let request = Payload.request("GET", url, handler)
      request.update("User-Agent", "Pony")
      Client.create(_env.root as AmbientAuth).apply(consume request)
    end
  
