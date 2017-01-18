// Longest Substring Without Repeating Characters
//
// Given a string, find the length of the longest substring without repeating characters.
//
// Examples:
// Given "abcabcbb", the answer is "abc", which the length is 3.
// Given "bbbbb", the answer is "b", with the length of 1.
// Given "pwwkew", the answer is "wke", with the length of 3.
// Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

function lengthOfLongestSubstring(string) {
    if (string === '') return 0;
    var breakdown = {};
    var maxDistance = 1;
    for (var i = 0; i < string.length; i++) {
        if (breakdown[string[i]]) {
            var indices = breakdown[string[i]];
            var lastEntry = indices[indices.length - 1];
            var difference = i - lastEntry;
            if (difference > maxDistance) {
                maxDistance = difference;
            }
            breakdown[string[i]].push(i);
        } else {
            breakdown[string[i]] = [i];
        }
    }

    return maxDistance;
};

console.log(lengthOfLongestSubstring('aab'));
