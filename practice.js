function mergeSort(array) {
    if (array.length <= 1) return array;
  
    var middle = Math.floor(array.length/2);
    var left = array.slice(0, middle);
    var right = array.slice(middle, array.length);
    return merge(mergeSort(left), mergeSort(right));
}

function merge(first, second) {
    var result = [];
    while (first.length >= 1 && second.length >= 1) {
      var smaller = (first[0] < second[0] ? first.shift() : second.shift());
      result.push(smaller);
    }
    result = result.concat(first).concat(second);
    return result;
}

console.log(mergeSort([5,2,7,1]));