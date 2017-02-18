// http://www.ardendertat.com/2011/09/27/programming-interview-questions-4-find-missing-element/
//
// There is an array of non-negative integers.
// A second array is formed by shuffling the elements of the first array
// and deleting a random element.
// Given these two arrays, find which element is missing in the second array.

// SOLUTION
// 1. Brute-force/naive - Time - O(N + M). Space - O(N)
//       a. Create a map of all the elements and their counts in the second array.
//       b. Iterate over the first array, decrementing the counts in the map.
//       c. Return the element whose count is already zero but exits in the first array.
//
// 2. Optimized. Time - O(NlogN + MlogM + N). Space - O(1)
//       a. Sort the arrays and then iterate over both using two pointers.
//       b. Return the element which does not exist in the second array.
//
// 3. Best. Time - O(N + M). Space - O(1)
//       a. Get the sum of all the elements in both of the arrays.
//       b. The difference will be equal to the missing element.
