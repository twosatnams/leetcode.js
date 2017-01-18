function binarySearch(array, target) {
    if (array.length < 1) return;
    var middleIdx = Math.floor(array.length / 2);

    if (array[middleIdx] === target) {
        return middleIdx;
    } else if (array[middleIdx] > target) {
        return binarySearch(array.slice(0, middleIdx), target);
    } else {
        return middleIdx + binarySearch(array.slice(middleIdx, array.length), target);
    }
}

console.log(binarySearch([3, 5, 9, 11, 14, 20, 25, 29, 41], 20) === 5);
console.log(binarySearch([3, 5], 3) === 0);
