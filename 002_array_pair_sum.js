// URL -
// http://www.ardendertat.com/2011/09/17/programming-interview-questions-1-array-pair-sum/

function arrayPairSum(array, sum) {
    var set = {};
    for (var i = 0; i < array.length; i++) {
        set[array[i]] = true;
    }

    var result = [];
    for (var i = 0; i < array.length; i++) {
        var item = array[i];
        if (set[sum - item] === true) result.push([item, sum - item]);
    }

    return result;
};

console.log(arrayPairSum([4, 1, 9, 6, 0, 5], 9));
