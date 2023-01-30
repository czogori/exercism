import gleam/option.{Option, Some, None}
import gleam/string.{append}

pub fn two_fer(name: Option(String)) -> String {
	case name {
		Some(s) -> message(s)
		None -> message("you")
	}
}
fn message(name: String) {
	"One for "
	|> append(name) 
	|> append(", one for me." <> "")
}