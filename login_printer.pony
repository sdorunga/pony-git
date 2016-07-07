use "net/http"
use "json"

class LoginPrinter
  var _env : Env
  new val create(env: Env) =>
    _env = env

  fun apply(request: Payload val, response: Payload val) =>
    if response.status != 0 then
      let chunks = response.body().values()
      try
        for chunk in chunks do
          match JsonParser.parse_json(chunk)
          | let x: JsonObject => _env.out.print(x.data("name") as String)
          | let x: None => _env.out.print("Hello")
          end
        end
      end
    end
