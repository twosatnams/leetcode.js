// Given a non-negative integer num represented as a string.
// Remove k digits from the number so that the new number is the smallest possible.

function removeKDigits(nums, k) {
    if (nums.length - k === 0) return '0';
    var stack = [];
    var numPops = 0;
    var i = 0;
    while (i < nums.length) {
        let digit = parseInt(nums[i]);

        if (parseInt(stack[stack.length - 1]) > digit && numPops < k && (nums.length - i + stack.length) >= (nums.length - k) && stack.length > 0) {
            stack.pop();
            numPops = numPops + 1;
        } else {
            stack.push(digit);
            i = i + 1;
        }
    }

    var result = stack.join('');
    while (result[0] === '0') result = result.slice(1, result.length);
    result = result.slice(0, nums.length - k);
    return result;
}

console.log(removeKDigits('1432219', 3));
console.log(removeKDigits('10200', 1));
console.log(removeKDigits('112', 1));
