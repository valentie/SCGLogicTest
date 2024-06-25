import UIKit

///1
func findMiddleIndex(_ nums: [Int]) -> String {
    let totalSum = nums.reduce(0, +)
    var leftSum = 0
    
    for i in 0..<nums.count {
        if leftSum == totalSum - leftSum - nums[i] {
            return "middle index is \(i)"
        }
        leftSum += nums[i]
    }
    
    return "index not found"
}

findMiddleIndex([1, 3, 5, 7, 9])
findMiddleIndex([3, 6, 8, 1, 5, 10, 1, 7])
findMiddleIndex([3, 5, 6])


///2
func isPalindrome(_ input: String) -> String {
    let lowercaseInput = input.lowercased()
    let n = lowercaseInput.count
    var isPalindrome = true
    
    for i in 0..<n/2 {
        if lowercaseInput[lowercaseInput.index(lowercaseInput.startIndex, offsetBy: i)] != lowercaseInput[lowercaseInput.index(lowercaseInput.endIndex, offsetBy: -1 - i)] {
            isPalindrome = false
            break
        }
    }
    
    if isPalindrome {
        return "\(input) is a palindrome"
    } else {
        return "\(input) isn't a palindrome"
    }
}

isPalindrome("aka")
isPalindrome("Level")
isPalindrome("Hello")

///3
func threeSum(_ nums: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    let sortedNums = nums.sorted()
    let n = sortedNums.count
    
    for i in 0..<n {
        if i > 0 && sortedNums[i] == sortedNums[i - 1] {
            continue
        }
        
        var left = i + 1
        var right = n - 1
        
        while left < right {
            let sum = sortedNums[i] + sortedNums[left] + sortedNums[right]
            if sum == 0 {
                result.append([sortedNums[i], sortedNums[left], sortedNums[right]])
                repeat { left += 1 } while left < right && sortedNums[left] == sortedNums[left - 1]
                repeat { right -= 1 } while left < right && sortedNums[right] == sortedNums[right + 1]
            } else if sum < 0 {
                left += 1
            } else {
                right -= 1
            }
        }
    }
    
    return result
}

threeSum([-1, -5, -3, 0, 1, 2, -1])
threeSum([1, 1, 2])
threeSum([1])
