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


// Check Permutation -- Given two strings, write a method
// to decide if one is a permutation of the other.
const isPermutation = (str1, str2) => {
  if(str1.length != str2.length) {
    return false;
  } else {
    console.log(str1.split('').sort().join('') == str2.split('').sort().join(''))
  }
}

class LRUCache {
  constructor(capacity){
    this.capacity = capacity;
    this.map = new Map();
  }

  get(key) {
    let value = this.map.get(key);
    if (typeof value === 'undefined'){
      return -1
    } else {
      this.map.delete(key);
      this.map.set(key, value);
      return value;
    }
  }

  put(key, value) {
    if (this.map.has(key)){
      this.map.delete(key);
    }
    this.map.set(key, value);
    let keys = this.map.keys();
    while(this.map.size > this.capacity){
      this.map.delete(keys.next().value)
    }
  }
}

class MinStack {
  constructor(){
    this.stack = new Array();
    this.length = 0;
  }

  push(num){
    let min;
    if(this.length === 0) {min = num;}
    else if(this.getMin() > num) {min = num;}
    else {min = this.getMin();};
    this.stack.push([num, min]);
    this.length = this.stack.length;
  }

  pop(){
    this.stack.pop();
    this.length = this.stack.length;
  }

  top(){
    return this.stack[this.length - 1][0];
  }

  getMin(){
    return this.stack[this.length - 1][1];
  }
}

class ListNode{
  constructor(val){
    this.val = val;
    this.next = null;
  }
}

const mergeKLists = function(lists) {
  if(lists.length === 0){
    return [];
  }
  let temp;
  let i = 0;
  while(i < lists.length){
    temp = mergeTwo(temp, lists[i]);
    i ++;
  }

  return temp;
}

const mergeTwo = function(list1, list2) {
  if (!list2) { return list1 };
  if (!list1) { return list2 };
  let res = new ListNode();
  if (list1.val < list2.val) {
    res.val = list1.val;
    res.next = mergeTwo(list1.next, list2);
  } else {
    res.val = list2.val;
    res.next = mergeTwo(list1, list2.next);
  }

  return res;
}

const findPair = function(arr, sum) {
	let hash = {};
	let i = 0;
	while (i < arr.length){
		if(hash[(sum - arr[i])] === true){
			return true;
		} else {
			hash[arr[i]] = true;
		}
		i += 1;
	}

	return false;
}

const letterCombinations = function(digits){
  let hash = {
    "2": ['a','b','c'],
    "3": ['d', 'e', 'f'],
    "4": ['g', 'h', 'i'],
    "5": ['j', 'k', 'l'],
    "6": ['m', 'n', 'o'],
    "7": ['p', 'q', 'r', 's'],
    "8": ['t', 'u', 'v'],
    "9": ['w', 'x', 'y', 'z']
  };

  if(digits.length === 0) { return [] };
  if(digits.length === 1) { return hash[digits] };
  let i = 1;
  let res = hash[digits[0]];
  while(i < digits.length){
    res = combineTwo(res, hash[digits[i]]);
    i ++;
  }

  return res;
}

const combineTwo = function(arr1, arr2){
  let res = [];
  arr1.forEach(el1 => {
    arr2.forEach(el2 => {
      res.push(el1.concat(el2));
    });
  });

  return res;
}

const generateParentheses = function(n){
  let res = [];
  const backtrack = function(str = '', left = 0, right = 0){
    if (str.length === 2 * n) {
      res.push(str);
    }
    if (left < n) {
      backtrack(str.concat('('), left+1, right);
    }
    if (right < left) {
      backtrack(str.concat(')'), left, right+1);
    }
  }

  backtrack();
  return res;
}

const myPow = function(x,y){
  if (y === 0) {
    return 1;
  } else if (y % 2 === 0) {
    let half = myPow(x,y/2);
    return half * half;
  } else if (y > 0) {
    return myPow(x, y-1) * x;
  } else if (y < 0) {
    return myPow(x, y+1) / x;
  }
}

const numIslands = function(grid){
  if (grid.length === 0) {return 0;}
  let height = grid.length;
  let width = grid[0].length;
  let sum = 0;
  const clearNeighbors = function(i, j){
    if (i >= 0 && j >= 0 && i < height && j < width && grid[i][j] === '1'){
      grid[i][j] = '0'
      clearNeighbors(i+1, j);
      clearNeighbors(i-1, j);
      clearNeighbors(i, j+1);
      clearNeighbors(i, j-1);
    }
  }

  for(h = 0; h < height; h++){
    for(w = 0; w < width; w++){
      if(grid[h][w] === '1'){
        sum += 1;
        clearNeighbors(h,w);
      }
    }
  }

  return sum;
}

const findAnagram = function(a, b){
  hash = new Object();
  b.forEach((el, idx) => {
    hash[el] = idx;
  });
  return a.map(el => hash[el]);
}

const islandPerimeter = function(grid){
  if (grid.length === 0){ return 0; }
  let sticks = 0;
  let height = grid.length;
  let width = grid[0].length;

  const checkNeighbor = function(h, w){
    if (h === 0) {
      sticks += 1;
    }
    if (h === height - 1) {
      sticks += 1;
    }
    if (w === 0) {
      sticks += 1;
    }
    if (w === width - 1){
      sticks += 1;
    }
    if (w - 1 >= 0 && grid[h][w-1] === 0) {
      sticks += 1;
    }
    if (h - 1 >= 0 && grid[h-1][w] === 0) {
      sticks += 1;
    }
    if (w + 1 < width && grid[h][w+1] === 0) {
      sticks += 1;
    }
    if (h + 1 < height && grid[h+1][w] === 0) {
      sticks += 1;
    }
  }

  for(i = 0; i < height; i++){
    for(j = 0; j < width; j++){
      if (grid[i][j] === 1){
        checkNeighbor(i,j);
      }
    }
  }

  return sticks;
}

const findTheDifference = function(str1, str2){
  let hash = new Object();
  let diff;

  str1.split('').forEach(el => {
    if (typeof hash[el] === 'undefined') {
      hash[el] = 1;
    } else {
      hash[el] += 1;
    }
  });

  str2.split('').forEach(el => {
    if (typeof hash[el] === 'undefined' || hash[el] <= 0) {
      diff = el;
    } else {
      hash[el] -= 1;
    }
  });

  return diff;
}

const isPowerOfTwo = function(n){
  if (n === 1){
    return true;
  } else if(n === 0 || n % 2 != 0){
    return false;
  } else {
    return isPowerOfTwo(n / 2);
  }
}

const reverseVowels = function(str){
  let stack = [];
  let vowels = ['a','e','i','o','u','A','E','I','O','U'];
  for (i = 0; i < str.length; i++){
    if (vowels.includes(str[i])){
      stack.push(str[i]);
    }
  }
  let res = "";
  for (i = 0; i < str.length; i++){
    if (vowels.includes(str[i])){
      res = res.concat(stack.pop());
    } else{
      res = res.concat(str[i]);
    }
  }
  return res;
}

const isIsomorphic = function(s, t){
  const translate = function(str){
    let hash = new Object();
    let newStr = "";
    let id = 1;
    for(i = 0; i < str.length; i++){
      if (!hash[str[i]]) {
        hash[str[i]] = id;
        id += 1
      }
      newStr = newStr.concat(hash[str[i]]);
    }
    return newStr;
  }

  return translate(s) === translate(t);
}

const mergeTrees = function(t1, t2){
  if(t1 === null && t2 === null) return null;
  if(t1 === null) return t2;
  if(t2 === null) return t1;

  t1.val += t2.val;
  t1.left = mergeTrees(t1.left, t2.left);
  t1.right = mergeTrees(t1.right, t2.right);

  return t1;
}

const maxArea = function(height){
  let begin = 0;
  let end = height.length - 1;
  let max = 0;
  let temp = 0;
  const area = function(a, b){
    if(height[a] > height[b]){
      return height[b] * (b-a);
    } else {
      return height[a] * (b-a);
    }
  }
  while(begin < end){
    temp = area(begin, end);
    if(height[begin] < height[end]){
      begin += 1;
    } else {
      end -= 1;
    }
    if (temp > max) max = temp;
  }

  return max;
}

const lengthOfLongestSubstring = function(s){
  let startIdx = 0;
  let hash = new Object();
  let maxLength = 0;
  for (i = 0; i < s.length; i++){
    let seenIdx = hash[s[i]];
    if (seenIdx !== 'undefined' && seenIdx >= startIdx){
      startIdx = seenIdx + 1;
    }
    hash[s[i]] = i;
    maxLength = Math.max(maxLength, i - startIdx + 1);
  }
  return maxLength;
  // if (s.length <= 1){
  //   return s.length;
  // }
  // let longest = 1;
  // let begin = 0;
  // let end = begin + longest;
  // const isUniq = function(str){
  //   let hash = new Object();
  //   for (i = 0; i < str.length; i++){
  //     if (typeof hash[str[i]] === 'undefined'){
  //       hash[str[i]] = true;
  //     } else {
  //       return false;
  //     }
  //   }
  //   return true;
  // }
  // while(begin < s.length - 1 && end < s.length){
  //   if (isUniq(s.slice(begin, end+1))){
  //     longest += 1;
  //     end += 1;
  //   } else {
  //     begin += 1;
  //     end = begin + longest;
  //   }
  // }
  //
  // return longest;
}

const deleteNode = function(node){
  node.val = node.next.val;
  node.next = node.next.next;
}

const rob = functino(nums){
  if (nums.length === 0) return 0;
  if (nums.length === 1) return nums[0];
  let arr = [nums[0]];
  if (nums[1] > nums[0]){
    arr.push(nums[1]);
  } else {
    arr.push(nums[0]);
  }
  let i = 2;
  while (i < nums.length){
    if (arr[i-2] + nums[i] > arr[i-1]){
      arr.push(arr[i-2] + nums[i]);
    } else {
      arr.push(arr[i-1]);
    }
    i += 1;
  }
  return arr[arr.length-1];
// let hash = new Object();
// let selected = [];
// let sum = 0;
// nums.forEach((el, idx) => {
//   if (typeof hash[el] === 'undefined'){ hash[el] = [idx] }
//   else { hash[el].push(idx) }
// });
// let sorted = nums.sort().reverse();
// const validHouse = function(idx){
//   let check = true;
//   selected.forEach(el => {
//     if (Math.abs(idx - el) <= 1) { check = false }
//   })
//   return check;
// }
// sorted.forEach(el => {
//   if (validHouse(hash[el][0]) === true){
//     sum += el;
//     selected.push(hash[el][0])
//   }
//   hash[el].shift();
// });
//
// return sum;
}

class MovingAverage{
  constructor(size){
    this.maxLength = size;
    this.arr = [];
  }

  next(val){
    this.arr.push(val);
    if (this.arr.length > this.maxLength){
      this.arr.shift();
    }

    return this.arr.reduce((el, sum) => sum += el) / this.arr.length;
  }
}
