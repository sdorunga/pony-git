use "json"

class GithubUser
  let _json : JsonObject
  let login : String
  let avatar_url : String
  let url : String
  let id : String
  let name : String
  let followers_url : String

  new create(json: JsonObject) =>
    _json = json
    let get_field = lambda(field: String)(json): String => try json.data(field) as String else "" end end
    followers_url = get_field("followers_url")
    avatar_url = get_field("avatar_url")
    url = get_field("url")
    id = get_field("id")
    name = get_field("name")
    login = get_field("login")

  fun greet(): String =>
    "You can find " + name + " at " + url + "\nHis name is " + name + " and login is: " +login

