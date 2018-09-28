import Foundation

//All sort algorithms come with same array
let list: [Int] = [1, 3, 6, 2, 4, 8, 5, 9, 7]

func bubbleSort(arrayToSort: [Int]) -> [Int] {
    //We set our array to local variable which we will sort
    var sortedList = arrayToSort
    //External loop to pass over all values
    for (index, _) in sortedList.enumerated() {
        //Count number of passes for current element
        let passes = (sortedList.count - 1) - index
        //Set iterator for nested loop
        var iterator = 0
        //We need to iterate one more time(pretty slow algorithm)
        while iterator < passes {
            //We need to remember this value to swap values
            let num = sortedList[iterator]
            //If remembered value is bigger then next
            if num > sortedList[iterator + 1] {
                //Next two strings are used to swap values
                sortedList[iterator] = sortedList[iterator + 1]
                sortedList[iterator + 1] = num
            }
            //Update iterator
            iterator = iterator + 1
        }
    }
    return sortedList
}

print(bubbleSort(arrayToSort: list))
