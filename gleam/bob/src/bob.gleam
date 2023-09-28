import gleam/string

pub fn hey(remark: String) -> String {
  let remark = string.trim(remark)
  let phrase_with_question = string.ends_with(remark, "?")
  let phrase_with_exclamation = remark == string.uppercase(remark) && remark != string.lowercase(remark)

  case phrase_with_question, phrase_with_exclamation, string.is_empty(remark) {
    True, True, _ -> "Calm down, I know what I'm doing!"
    True, _, _ -> "Sure."
    _, True, _ -> "Whoa, chill out!"
    _, _, True -> "Fine. Be that way!"
    _, _, _ -> "Whatever." 
  }
}
