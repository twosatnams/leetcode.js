var permutations = function (array) {
    if (array.length <= 1) {
        return [array];
    } else {
        var result = [];
        for (var i = 0; i < array.length; i++) {
            var copy = array.slice(0, array.length);
            var fix = copy.splice(i, 1);
            var subPermutations = permutations(copy);
            for (var j = 0; j < subPermutations.length; j++) {
                result.push(fix.concat(subPermutations[j]));
            }
        }
        return result;
    }
};

console.log(permutations([1,2,3, 4]));
