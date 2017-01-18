var twoSum = function(nums, target) {
    var set = {};
    for (var i = 0; i < nums.length; i++) {
        if (set[nums[i]]) {
            set[nums[i]].push(i);
        } else {
            set[nums[i]] = [i];
        }
    }

    for (var i = 0; i < nums.length; i++) {
        var item = nums[i];
        var pairIndices = set[target - item];
        if (pairIndices) {
            if (pairIndices.length === 1 && pairIndices[0] !== i) {
                return [i, pairIndices[0]];
            } else if (pairIndices.length > 1) {
                for (var j = 0; j < pairIndices.length; j++) {
                    if (pairIndices[j] !== i) return [i, pairIndices[j]];
                }
            }

        }
    }
};

console.log(twoSum([0,4,3,0], 0));
