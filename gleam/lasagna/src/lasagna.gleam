const oven_time = 40

pub fn expected_minutes_in_oven() -> Int {
  oven_time
}

pub fn remaining_minutes_in_oven(minutes: Int) -> Int {
  expected_minutes_in_oven() - minutes
}

pub fn preparation_time_in_minutes(number_of_layers: Int) -> Int {
  number_of_layers * 2
}

pub fn total_time_in_minutes(number_of_layers: Int, minutes: Int) -> Int {
  preparation_time_in_minutes(number_of_layers) + minutes
}

pub fn alarm() -> String {
  "Ding!"
}