use "net/http"
use "json"

class LoginPrinter
  var _env : Env
  new val create(env: Env) =>
    _env = env

  fun apply(request: Payload val, response: Payload val) =>
    if response.status != 0 then
      let chunks = response.body().values()
      for chunk in chunks do
        _env.out.print("**")
        _env.out.print(chunk)
        match JsonParser.parse_json(chunk)
        | let x: JsonObject => print_details(x)
        | let x: None => _env.out.print("Hello")
        end
      end
    end

    fun print_details(user: JsonObject) =>
      try
        _env.out.print("--  " + (user.data("followers_url") as String))
        _env.out.print("--  " + (user.data("created_at") as String))
      else
        _env.out.print("--  FAIL")
      end
