class Year {
    var isLeapYear: Bool {
        return
            self.calendarYear % 4 == 0 &&
            self.calendarYear % 100 != 0 ||
            self.calendarYear % 400 == 0
    }
    
    private var calendarYear: Int
    
    init(calendarYear: Int) {
        self.calendarYear = calendarYear
    }
}
