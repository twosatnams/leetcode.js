// URL - https://www.careercup.com/question?id=16759664

// Question
// You have k lists of sorted integers. Find the smallest range that includes at least one number from each of the k lists. 

// For example, 
// List 1: [4, 10, 15, 24, 26] 
// List 2: [0, 9, 12, 20] 
// List 3: [5, 18, 22, 30] 

// The smallest range here would be [20, 24] as it contains 24 from list 1, 20 from list 2, and 22 from list 3.

// Answer
// This can be solved easily as below. 
// 1. initialize smallest_range as MAX_INT 
// 2. keep 3 pointers/index p1, p2 and p3 which points to the first elements of lists L1, L2 and L3 respectively. 
// 3. find the max value and min value pointed/indexed by p1, p2 and p3 
// 4. difference of max value and min value discovered in step 3 is the current range. compare it with smallest_range and update it, if found smaller. 
// 5. increment the pointer/index of min value found in step 3. 
// 6. repeat step 3 to 5 until the pointer/index of min value is in range. 

// constant space and O(n) time.

function shortestRange(lists, k) {
	var rangeSize = Number.MAX_SAFE_INTEGER;
	var range = [];
	for (var i = 0; i < k; i++) {
		range.push(k[i].shift());
	}
	

}

var lists = [
	[4, 10, 15, 24, 26],
	[0, 9, 12, 20],
	[5, 18, 22, 30]
]

console.log(shortestRange(lists, 3) === [20, 24])