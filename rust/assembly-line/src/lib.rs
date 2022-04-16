// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

const CARS_PER_HOUR: u8 = 221;
const SUCCES_RATE_77_PERCENT: f64 = 77.0 / 100.0;
const SUCCES_RATE_90_PERCENT: f64 = 90.0 / 100.0;

pub fn production_rate_per_hour(speed: u8) -> f64 {
		let speed_per_hour: f64 = speed as f64 * CARS_PER_HOUR as f64;

		match speed {
			1..=4 => speed_per_hour,
			5..=8 => speed_per_hour * SUCCES_RATE_90_PERCENT,
			9|10  => speed_per_hour * SUCCES_RATE_77_PERCENT,
			_     => 0.0
		}
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    production_rate_per_hour(speed) as u32 / 60
}
