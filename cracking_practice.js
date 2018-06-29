// Is Uniq? -- Implement an algorithm to determine if a
// sting has all unique characters. What if you cannot
// use additional data structures?
const isUnique = (str) => {
  let h = new Object();
  let i = 0;
  while (i < str.length) {
    if (h[str[i]] === true) {
      return false;
    } else {
      h[str[i]] = true;
    }
    i += 1;
  }

  return true;
}
// This solution's time complexity is O(n), space
// complexity is O(n)
