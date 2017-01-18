// Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
//
// For example, given the array [-2,1,-3,4,-1,2,1,-5,4], the contiguous subarray [4,-1,2,1] has the largest sum = 6.

function maximumContiguousSum(nums) {
    var maxSoFar = nums[0];
    var maxEndingHere = nums[0];

    for (var i = 0; i < nums.length; i++) {
        maxEndingHere = Math.max(maxEndingHere + nums[i], nums[i]);
        maxSoFar = Math.max(maxEndingHere, maxSoFar);
    }
    return maxSoFar;
}

console.log(maximumContiguousSum([1]) === [1]) // this is not true
