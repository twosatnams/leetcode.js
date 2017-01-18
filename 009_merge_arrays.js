// 88 Leet Code

var merge = function(nums1, m, nums2, n) {

    var nums1Pointer = 0;
    var nums2Pointer = 0;

    while (nums1Pointer < nums1.length && nums2Pointer < nums2.length) {
        if (nums1[nums1Pointer] >= nums2[nums2Pointer]) {
            nums1.splice(nums1Pointer, 0, nums2[nums2Pointer]);
            nums2Pointer = nums2Pointer + 1;
        } else {
            nums1Pointer = nums1Pointer + 1;
        }
    }

    nums1 = nums1.slice(0, m + n);
    return nums1;
};

console.log(merge([0], 0, [1], 1));
