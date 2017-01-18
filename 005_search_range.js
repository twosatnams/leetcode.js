var searchRange = function(nums, target) {
    var idx = binarySearch(nums, target, 0, nums.length - 1);
    if (idx !== undefined) {
        return findSideways(nums, idx);
    } else {
        return [-1, -1];
    }
};

var findSideways = function(nums, idx) {
    var start = idx;
    var end = idx;
    var target = nums[idx];

    var difference = 1;
    while(nums[idx - difference] === target || nums[idx + difference] === target) {
        if (nums[idx - difference] === target) start = idx - difference;
        if (nums[idx + difference] === target) end = idx + difference;
        difference = difference + 1;
    }

    return [start, end];
};

var binarySearch = function (nums, target, start, end) {
    if (start > end) {
        return;
    }
    var middleIdx = Math.floor((start + end) / 2);
    if (nums[middleIdx] === target) {
        return middleIdx;
    }
    if (nums[middleIdx] > target) {
        return binarySearch(nums, target, start, middleIdx - 1);
    } else {
        return binarySearch(nums, target, middleIdx + 1, end);
    }
};
