//
//  main.swift
//  BitwiseOperations
//
//  Created by Emiko Clark on 12/5/17.
//  Copyright © 2017 Emiko Clark. All rights reserved.
//

import Foundation


// 5.4 find next smallest and largest number while keeping the number of 1 bits the same

let maxNumOfBits = 12

func getOnesBitCount(num: Int) -> Int {
    var bitIndex = 0
    var totalOnesBitCount = 0

    while (bitIndex < maxNumOfBits) {
        // count the number of 1 bits

        if (num & (1 << bitIndex) == (1 << bitIndex)) {
            totalOnesBitCount += 1
        }
        bitIndex += 1
    }
    print("Number:",num, (String(num, radix:2)), "bitCount(1s):",totalOnesBitCount)
    return totalOnesBitCount
}

// find next smallest number with the same number of 1s bit
func findNextSmallest(num: Int) -> Int {
    var found = false
    var nextSmallest = num

    let totalOnesBitCount = getOnesBitCount(num: num)

    while (!found) {
        nextSmallest -= 1
        let bitCount = getOnesBitCount(num: nextSmallest)
        if  (bitCount == totalOnesBitCount) {
            found = true
        }
        //        print("next smallest number (with same # of 1s bit):",nextSmallest, (String(nextSmallest, radix:2)))
    }
    return nextSmallest
}

// find next largest number with the same number of 1s bit
func findNextLargest(num: Int) -> Int {
    var found = false
    var nextLargest = num

    let totalOnesBitCount = getOnesBitCount(num: num)

    while (!found) {
        nextLargest += 1
        let bitCount = getOnesBitCount(num: nextLargest)
        if  (bitCount == totalOnesBitCount) {
            found = true
        }
        //        print("next largest number (with same # of 1s bit):", "Number:",nextLargest, (String(nextLargest, radix:2)))
    }
    return nextLargest
}
print("Find next smallest and largest number with same number of 1 bits algorithm")

let number2 = 394
let nextSmallest = findNextSmallest(num: number2)
print("next smallest number (with same # of 1s bit):",nextSmallest, (String(nextSmallest, radix:2)))

let nextLargest = findNextLargest(num: number2)
print("next largest number  (with same # of 1s bit):",nextLargest, (String(nextLargest, radix:2)))


//===================================

// 5.1 Insertion. givent 32 bit numbers, N and M, and two bit positions, i and j. Write a method to insert M into N such that M starts at bit j and ends at bit i. Input: N = 10000000000, M = 10011, i = 2, j = 6
print("\n=======================\nInsertion algorithm")
var N = 0b1000110100
let M = 0b10011
let i = 2
let j = 6

print("i: \(i), j:\(j)\nN:")
print(String(N, radix: 2))
print("M:")
print(String(M, radix: 2))

var bitIndex = i
while (bitIndex <= j) {
    // clear all the bits within this range
    N = (N & (~(1 << bitIndex)))
    bitIndex += 1
}

// insert the M value into N
N = (N | (M << i))
print("\nResulting insertion:")
print(String(N, radix: 2))


//===================================

//5.7 pairwise swap  bit 1&2 swapped, 3&4 swapped etc

print("\n=======================\nPairwise swap algorithm")

var num1 = 359

var index1: Int = 0
print(String(num1, radix: 2))

while index1 < 64 {
    if (((num1 & (1 << index1) == (1 << index1)) && (num1 & (1 << (index1 + 1)) == 0)) ||
        ((num1 & (1 << index1) == 0) && (num1 & (1 << (index1 + 1)) == (1 << (index1 + 1))))) {

        num1 = num1 ^ (1 << index1)
        num1 = num1 ^ (1 << (index1 + 1))
    }
    index1 += 2
}
print(String(num1, radix: 2))


