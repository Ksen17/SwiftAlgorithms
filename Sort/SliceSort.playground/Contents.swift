import Foundation

//All sort algorithms come with same array
let list: [Int] = [1, 3, 6, 2, 4, 8, 5, 9, 7]

func sliceSort(arrayToSort: [Int]) -> [Int] {
    //We set our array to local variable which we will sort
    var sortedList = arrayToSort
    //We need to check lenght of array to end recursion
    guard arrayToSort.count > 1 else {return sortedList}
    //Find "middle" number of array
    let centralNumber = sortedList[sortedList.count / 2]
    //Now we are ready to slice our array
    //.filter function is basic for Cocoa and it return array with elements from given list only which conforms to given function
    //Let's start with left part of array
    let smaller = sortedList.filter { $0 < centralNumber }
    //Keep in mind that we can have equal numbers in array
    let middle = sortedList.filter { $0 == centralNumber }
    //Then filter right part of array
    let greater = sortedList.filter { $0 > centralNumber }
    //Now we should recursively use this function on letf and right part of array.
    //After everything ready we need to connect 
    return sliceSort(arrayToSort: smaller) + middle + sliceSort(arrayToSort: greater)
}

print(sliceSort(arrayToSort: list))
