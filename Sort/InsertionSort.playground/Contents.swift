import Foundation

//All sort algorithms come with same array
let list: [Int] = [1, 3, 6, 2, 4, 8, 5, 9, 7]

func insertionSort(arrayToSort: [Int]) -> [Int] {
    //We set our array to local variable which we will sort
    var sortedList = arrayToSort
    //External loop to iterate over all numbers in array
    for (index, number) in sortedList.enumerated() {
        //Remember index of current element
        var iterator = index
        //Go back till the begining
        while iterator > -1 {
            //If number is smaller
            if number < sortedList[iterator] {
                //Remove number from it current position
                sortedList.remove(at: iterator + 1)
                //And add it current iterator
                sortedList.insert(number, at: iterator)
            }
            //Go to previous element
            iterator = iterator - 1
        }
    }
    return sortedList
}

print(insertionSort(arrayToSort: list))


