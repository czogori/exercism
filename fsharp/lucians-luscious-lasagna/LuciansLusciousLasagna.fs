module LuciansLusciousLasagna

let expectedMinutesInOven = 40
let remainingMinutesInOven minutes = expectedMinutesInOven - minutes
let preparationTimeInMinutes numberOfLayers = numberOfLayers * 2
let elapsedTimeInMinutes numberOfLayers minutes = preparationTimeInMinutes(numberOfLayers) + minutes

