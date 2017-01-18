// Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0?
// Find all unique triplets in the array which gives the sum of zero.

// function threeSum(elements) {
//
// };
//
// console.log(threeSum[-1, 0, 1, 2, -1, -4]);

// [
//   [-1, 0, 1],
//   [-1, -1, 2]
// ]

var myPow = function(x, n) {
    debugger
    if (n === 0) {
        return 1;
    } else if (n === 1) {
        return x;
    } else {
        var temp = myPow(x, Math.floor(n/2));
        if (n % 2 === 0) {
            return temp*temp;
        } else {
            if (n < 0) {
                return -x*temp*temp;
            } else {
                return x*temp*temp;
            }
        }
    }
};

console.log(myPow(8, -3));
