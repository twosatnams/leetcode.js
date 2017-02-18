// Find Next Higher Number With Same Digits
// Given a number, find the next higher number using only the digits in the given number.
// For example if the given number is 1234, next higher number with same digits is 1243.

// SOLUTION
// 1. We want to change the digits that are on right as much as possible.
// 2. Also, we cannot just change the digit at the ones place without replacing it with another.
// 3. Which means that the digit will have to come from the tenth or hundredth or other place.
// 4. But just replacing is not enough to ensure that the number would be the next largest.
// 5. We know that if a group of digits are arranged in descending order. There cannot be a bigger number.
// 6. But if they are not, then how can we get the next highest number?
// 7. ...

// ALGORITHM
// 1. Iterate from the right to the left. Skip the last digit.
// 2. If the digit to the right is less than or equal to current. Keep going left.
// 3. If the digit to the right is greater current. Stop.
// 4. We found the digit that is not maintaining the descending order.
// 5. Get the smallest number from the right of the current digit.
// 6. Replace current with the smallest digit found in the previous step.
// 7. Sort all the digits to the right in ascending order. Excluding the last but including the replaced.
// 8. Attach them after the current.

function nextHighest(num) {
  var givenNum = num.toString();
  var currentIdx = givenNum.length - 2;
  var rightDigits = [givenNum[givenNum.length - 1]];

  while (currentIdx >= 0) {
    var currentDigit = givenNum[currentIdx];
    var rightDigit = givenNum[currentIdx + 1];

    if (parseInt(currentDigit) < parseInt(rightDigit)) {
      break;
    } else {
      currentIdx = currentIdx - 1;
      rightDigits.push(currentDigit);
    }
  }

  if (currentIdx < 0) {
    return false;
  } else {
    var replacementDigit = rightDigits.shift();
    var idx = 0;
    while (parseInt(rightDigits[idx]) < parseInt(currentDigit)) {
      idx = idx + 1;
    }

    var sortedDigits = rightDigits.slice(0, idx);
    sortedDigits.push(currentDigit);
    sortedDigits = sortedDigits.concat(rightDigits.slice(idx, rightDigits.length));
  }

  return givenNum.slice(0, currentIdx) + replacementDigit + sortedDigits.join();
}


console.log(nextHighest(12543));
