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
        match JsonParser.parse_json(chunk)
        | let x: JsonObject => print_details(x)
        | let x: None => _env.out.print("Unparseable response")
        end
      end
    end

    fun print_details(json: JsonObject) =>
      let message = try (json.data("message") as String) else "" end
      if (message != "") then
        _env.out.print("--  Api Error: " + message)
      else
        let user = GithubUser.create(json)
        _env.out.print("--  " + user.greet())
      end
