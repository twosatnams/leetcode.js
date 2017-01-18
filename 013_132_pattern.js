// https://leetcode.com/problems/132-pattern/

// Given a sequence of n integers a1, a2, ..., an, a 132 pattern is a subsequence ai, aj, ak
// such that i < j < k and ai < ak < aj.

// Design an algorithm that takes a list of n numbers as input and checks whether there is a 132 pattern in the list.

// Input: [1, 2, 3, 4]
// Output: False
// Explanation: There is no 132 pattern in the sequence.

// Input: [3, 1, 4, 2]
// Output: True
// Explanation: There is a 132 pattern in the sequence: [1, 4, 2].

function patternMatch(elements) {
    debugger
    var stack = [];
    for (var i = 0; i < elements.length; i++) {
        var stackTop = stack[stack.length - 1];
        if (elements[i] >= stackTop || stack.length === 0) {
            stack.push(elements[i]);
        } else {
            var tempHolder = [stack.pop()];
            while (elements[i] <= stack[stack.length - 1]) {
                tempHolder.unshift(stack.pop());
            }

            if (stack.length === 0) {
                stack.push(elements[i]);
            } else {
                return true;
            }
        }
    }

    // while (stack.length > 0) {
    //     var element = stack.pop();
    //     if (element <= stack[stack.length - 1]) {
    //
    //     }
    //
    //     if (stack.length === 0) {
    //         stack.push(elements[i]);
    //     } else {
    //         return true;
    //     }
    // }
    return false;
}

console.log(patternMatch([3, 5, 0, 3, 4]));
// console.log(patternMatch([3, 1, 4, 2]));
// console.log(patternMatch([-1, 3, 2, 0]));
