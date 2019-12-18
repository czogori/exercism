import Foundation

class Gigasecond {
    let description : String
    
    init?(from dateString: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        let initialDate = dateFormatter.date(from: dateString)
        let finalDate = initialDate!.addingTimeInterval(1000_000_000)
        
        self.description = dateFormatter.string(from: finalDate)
    }
}
