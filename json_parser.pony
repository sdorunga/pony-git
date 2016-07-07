use "json"

class JsonParser
  fun parse_json(json_response: ByteSeq): (JsonObject | None) =>
    let json_string = parse_response(json_response)
    try
      let json: JsonDoc = JsonDoc
      json.parse(json_string)

      json.data as JsonObject
    end

  fun parse_response(response: ByteSeq): String =>
    match response 
    | let x: String => x
    | let x: Array[U8 val] val => String.from_array(x)
    else ""
    end
