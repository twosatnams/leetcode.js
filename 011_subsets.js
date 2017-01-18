var subsets = function(nums) {
    if (nums.length === 0) {
        return [[]];
    } else {
        var element = [nums.pop()];
        var previousSubsets = subsets(nums);
        var copyOfPreviousSubsets = JSON.parse(JSON.stringify(previousSubsets));
        var newSubsets = [];

        for (var i = 0; i < previousSubsets.length; i++) {
            newSubsets.push(previousSubsets[i].concat(element));
        }

        return copyOfPreviousSubsets.concat(newSubsets);
    }
};

console.log(subsets([1, 2, 3]));
