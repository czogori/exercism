fun twofer(name: String = "noName"): String {
    return when (name) {
        "noName" -> "One for you, one for me."
        "" -> "One for , one for me."
        else -> "One for $name, one for me."
    }
}
