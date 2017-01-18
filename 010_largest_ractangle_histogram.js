// Find the largest rectangular area possible in a given histogram where the largest rectangle can be made of a number of contiguous bars.
//
// For simplicity, assume that all bars have same width and the width is 1 unit.
//
// http://www.geeksforgeeks.org/largest-rectangle-under-histogram/

// SOLUTION
// 1. Initiate a stack for storing positions of possible rectangle initiations.
// 2. Initiate another variable called maxArea = 0, which points to the maximum area seen so far.
// 3. Iterate from left to right. At any iteration -
//     3.1. If the seen height is greater or equal to the previous one, push its position onto the stack.
//             3.1.1. Hopefully, this is the start of a new largest rectangle.
//     3.2. If the new height is < the previous one
//             3.2.1. Keep popping off the positions until we see a lower height on the stack.
//                      3.2.1.1. Calculate the area of the possible rectange with
//                                  - height as the height of the position that was popped of.
//                                  - width is still confusing.
//                      3.2.1.2. Update maxArea if the area in the previous step was greater than maxArea.
// 4. If the stack is non-empty, repeat the steps of 3.2 for each remaining item.
//
// CODE

function largestRectange(histogram) {
    var stack = [];
    var maxArea = 0;

    for (var i = 0; i < histogram.length; i++) {
        var barHeight = histogram[i];
        var previousStartingPosition = stack[stack.length - 1];
        var previousHeight = histogram[previousStartingPosition];

        if (barHeight >= previousHeight || stack.length === 0) {
            stack.push(i);
        } else {
            while (barHeight < previousHeight && stack.length !== 0) {
                var topOfStack = stack.pop();
                var height = histogram[topOfStack];
                if (stack.length === 0) {
                    var breadth = i;
                } else {
                    var breadth = i - stack[stack.length - 1] - 1;
                }
                var newMaxArea = height * breadth;
                if (newMaxArea > maxArea) maxArea = newMaxArea;

                previousStartingPosition = stack[stack.length - 1];
                previousHeight = histogram[previousStartingPosition];
            }
            stack.push(i);
        }
    }

    while (stack.length > 0) {
        var topOfStack = stack.pop();
        var height = histogram[topOfStack];
        if (stack.length === 0) {
            var breadth = i;
        } else {
            var breadth = i - stack[stack.length - 1] - 1;
        }
        var newMaxArea = height * breadth;
        if (newMaxArea > maxArea) maxArea = newMaxArea;
    }

    return maxArea;
};

function getMaxArea(hist) {
    var stack = [];
    var max_area = 0;
    var top;
    var area_with_top;
    var i = 0;

    while (i < hist.length) {
        if (stack.length === 0 || hist[stack[stack.length - 1]] <= hist[i]) {
            stack.push(i);
            i = i + 1;
        } else {
            top = stack[stack.length - 1];
            stack.pop();
            area_with_top = hist[top] * (stack.length === 0 ? i : i - stack[stack.length - 1] - 1);
            if (area_with_top > max_area) max_area = area_with_top;
        }
    }

    while (stack.length > 0) {
        top = stack[stack.length - 1];
        stack.pop();
        area_with_top = hist[top] * (stack.length === 0 ? i : i - stack[stack.length - 1] - 1);
        if (area_with_top > max_area) max_area = area_with_top;
    }

    return max_area;
}

var largestRectangleArea = function(heights) {
    var stack = [];
    var maxArea = 0;

    var i = 0;
    while (i < heights.length) {
        debugger
        var newHeight = heights[i];
        var previousHeight = heights[stack[stack.length - 1]] || 0;
        if (stack.length === 0 || newHeight >= previousHeight) {
            stack.push(i);
            i = i + 1;
        } else {
            stack.pop();
            var breadth;
            if (stack.length === 0) {
                breadth = i;
            } else {
                breadth = i - stack[stack.length - 1] - 1;
            }
            if (previousHeight * breadth > maxArea) maxArea = previousHeight * breadth;
        }
    }

    while (stack.length > 0) {
        previousHeight = stack.pop();
        if (stack.length === 0) {
            breadth = i;
        } else {
            breadth = i - stack[stack.length - 1] - 1;
        }
        if (previousHeight * breadth > maxArea) maxArea = previousHeight * breadth;
    }

    return maxArea;
};

console.log(largestRectangleArea([6, 2, 5, 4, 5, 1, 6]) === 12);
// console.log(largestRectange([2, 5, 4, 2, 3, 2, 5]) === 14);
// console.log(largestRectange([2, 5, 2, 2, 6, 6, 6, 3]) === 18);
