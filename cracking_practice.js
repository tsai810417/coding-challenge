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

const nextClosestTime = function(str){
	let tempMin;
	let tempTime = "";
	tempMin = str.slice(0,2)*60 + str.slice(3)*1;

	// function to convert minutes to time string
	const minToTime = function(num){
        if(num >= 1440) num -= 1440;
		let time = Math.floor(num/60) + ":" + num%60
		if(num < 600) time = "0" + time;
		if(num%60 < 10) time = time.slice(0,3) + "0" + time.slice(3)
		return time;
	}

	// function to check if new time string is formed by the digits
	const validTime = function(){
		for(i = 0; i < tempTime.length; i++){
			if(!str.includes(tempTime[i])) return false;
		}
		return true;
	}

	// a loop that keep adding 1min then check if valid
	while(true){
		tempMin += 1;
		tempTime = minToTime(tempMin);
		if(validTime()) return tempTime
	}

	// test case
	console.log(tempTime)
	return validTime();
}

var licenseKeyFormatting = function(S, K) {
  // get all the chars into an array except the dash
  let arr = S.split('').filter(el => el !== '-' && el !== '_');

  // determine the first part of new license key
  if (arr.length === 0) return ""
  let firstPart = arr.length % K;
  if (firstPart === 0) firstPart = K;

  // create var to store result
  let newS = "";
  for (i = 0; i < firstPart; i++){
    newS += arr.shift().toUpperCase();
  }
    if (arr.length/K >= 1) newS = newS.concat('-');

  // create var to keep track on when to add dash
  let c = 0;
  while (arr.length > 0){
    if (c === K){
      c = 0;
      newS = newS.concat('-');
    } else {
      c += 1;
      newS += arr.shift().toUpperCase();
    }
  }
  return newS;
};

const backspaceCompare = function(str1, str2){
  const process = function(str){
    let newStr = "";
    for (i = 0; i < str.length; i++){
      if(i !== 0 && str[i] === '#'){
        newStr = newStr.slice(0,(str.length-1));
      } else if (str[i] !== '#'){
        newStr = newStr.concat(str[i]);
      }
    }
    return newStr;
  }

  return process(str1, str2);
}

class ValidWordAbbr{
  constructor(dictionary){
    this.dictionary = dictionary
  }

  isUnique(str){
    // const abbr = function(str){
    //   if (str.length > 2){
    //     return str[0] + `${str.length-2}` + str[str.length-1];
    //   } else {
    //     return str;
    //   }
    // }
    // let arr = [];
    // let strAbbr= abbr(str);
    // this.dictionary.forEach(el => {
    //   if (el !== str){arr.push(el)}
    // });
    // let check = true;
    // arr.map(el => abbr(el)).forEach(el => {
    //   if(el === strAbbr){
    //     check = false;
    //   }
    // })
    //
    // return check;
    let check = true;
    this.dictionary.forEach(el => {
      if(el.length === str.length && el !== str && el[0] = str[0] && el[el.length-1] === str[str.length-1]){
        check = false;
      }
    });

    return check;
  }
}

const longestConsecutive = function(root){
  let maxLength = 0;
  const dfs = function(node, currentLength, targetVal){
    if(!node) return;
    if(node.val === targetVal){
      currentLength += 1;
    } else {
      currentLength = 1;
    }
    maxLength = Math.max(currentLength, maxLength);
    dfs(node.left, currentLength, node.val+1);
    dfs(node.right, currentLength, node.val+1);
  }
  dfs(root, 0,0);
  return maxLength;
}

const anagramMappings = function(A, B){
  // create a hash to store key as B's element value as index
  let hash = new Object();
  for (i = 0; i < B.length; i++){
    hash[B[i]] = i;
  }

  // map through A and replace to hash's value, which is the idx of that el in B
  return A.map(el => hash[el])
}

const flipAndInverImage = function(arr){
  // helper that will do the flip and invert work for each el
  const process = function(subArr){
    let res = [];
    for(i = subArr.length-1; i >= 0; i--){
      if (subArr[i] === 1){
        res.push(0);
      } else {
        res.push(1);
      }
    }
    return res;
  }

  return arr.map(el => process(el));
}

const peakIndexInMountainArray = function (arr){
  for (i = 0; i < arr.length; i++){
    if (arr[i] > arr[i-1] && arr[i+1] < arr[i]){
      return i;
    }
  }
}

const judgeCircle = function(moves){
  // create a hash key is L, D iterate through moves if L -1, R +1, D -1, U +1. if at the end all keys is 0 means it made a circle
  let hash = {'L': 0, 'D':0};
  moves.forEach(el => {
    if (el === 'L') hash['L'] -= 1
    if (el === 'R') hash['L'] += 1
    if (el === 'D') hash['D'] -= 1
    if (el === 'U') hash['D'] += 1
  })

  return Object.values(hash)[0] === 0 && Object.values(hash)[1] === 0;
}

class Logger {
  constructor(){
    this.history = new Object();
  }

  shouldPrintMessage(timestamp, message){
    if (typeof this.history[message] === 'undefined'){
      this.history[message] = timestamp;
      return true;
    } else if (timestamp - this.history[message] >= 10) {
      this.history[message] = timestamp;
      return true;
    } else {
      return false;
    }
  }
}

const canPermutePalindrome = function(str){
  // create a hash to track each character
  // a palindrome is when even length same amount of all characters, when odd length only one character can have 1 extra than while all the other charaters having same amount
  hash = new Object();
  for (i = 0; i < str.length; i++){
    if (typeof hash[str[i]] === 'undefined'){
      hash[str[i]] = 1;
    } else if (hash[str[i]] === 0){
      hash[str[i]] += 1;
    } else {
      hash[str[i]] -= 1;
    }
  }

  notEvenCount = Object.values.filter(el => el !== 0).length;
  if (str.length%2 === 0){
    return notEvenCount === 0;
  } else {
    return notEvenCount === 1;
  }
}

const islandPerimeter = function(grid){
  let height = grid.length;
  let width = grid[0].length;
  let sticks = 0;
		// helper to determine how many sticks around a block
  const countSticks = function(i, j){
    // cases to add a stick:
    // the beginning or ending block or if the block's top, down, left or right is 0
    if (i === 0) sticks += 1;
    if (i === height-1) sticks += 1;
    if (j === 0) sticks += 1;
    if (j === width-1) sticks += 1;
    // top
    if (i-1 >= 0 && grid[i-1][j] === 0) sticks += 1;
    // down
    if (i+1 < height && grid[i+1][j] === 0) sticks += 1;
    // left
    if (j-1 >= 0 && grid[i][j-1] === 0) sticks += 1;
    // right
    if (j+1 < width && grid[i][j+1] === 0) sticks += 1;
  }

  for (h = 0; h < height; h++){
    for (w = 0; w < width; w++){
      if (grid[h][w] === 1) countSticks(h, w);
    }
  }

  return sticks;
}

const isToeplitzMatrix = function(matrix){
  let lastI = matrix.length - 1;
  let lastJ = matrix[0].length - 1;
  // write a helper to check a node with all its diagonal elements
  const checkDiagonal = function(i, j){
    if (i === lastI || j === lastJ) return true;
    let val = matrix[i][j];
    while (i <= lastI && j <= lastJ){
      if(matrix[i][j] !== val) return false;
      i += 1;
      j +=1 ;
    }
    return true;
  };

  // create to loop to run helper on the element in first row or first column only
  for (j = 0; j <= lastJ; j++){
    if (checkDiagonal(0,j) === false) return false;
  };
  for (i = 0; i <= lastI; i++){
    if (checkDiagonal(i, 0) === false) return false;
  };

  return true;
}

const generatePossibleNextMoves = function(s) {
  // helper method generate new string when giving the idx to flip
  const flip = function(idx){
    return s.slice(0,idx) + '--' + s.slice(idx+2);
    // let res = "";
    // for(i = 0; i < s.length; i++){
    //   if (idx === i || idx+1 === i){
    //     if (s[i] === '+'){
    //       res = res.concat('-');
    //     }
    //   } else {
    //     res = res.concat(s[i]);
    //   }
    // }
    // return res;
  }
  let possible = [];
  for (idx = 0; idx < s.length-1; idx++){
    if (s[idx] === '+' && s[idx] === s[idx+1]){
      possible.push(flip(idx));
    }
  }

  return possible;
}

const findLUSlength = function(a, b) {
  if (a === b) return -1;
  return Math.max(a.length, b.length);
}

const findMaxConsecutiveOnes = function(nums){
  // have a var to keep track longest consecutive ones
  let maxOnes = 0;
  // loop through the array, increament the temp and update the maxOnes. when you see 1, reset temp when you see 0
  let temp = 0;
  nums.forEach(el => {
    if (el === 1){
      temp += 1;
      maxOnes = Math.max(temp, maxOnes);
    } else {
      temp = 0;
    }
  })
  // nums.forEach((el, idx) => {
  //   if(el === 1 && temp = 0){
  //     temp = 1;
  //   } else if (el === 1 && temp !== 0){
  //     temp += 1;
  //     maxOnes = Math.max(maxOnes, temp);
  //   }
  //   else {
  //     temp = 0;
  //   }
  // });

  return maxOnes;
}

const detectCapitalUse = function(word){
  return word.toUpperCase() === word || word.slice(1).toLowerCase() === word.slice(1);
}

const findDisappearedNumbers = function(nums){
  let res = [];
  nums.forEach((el, idx) => {
    if (el < 0){
      temp = - el;
    } else {
      temp = el
    }
    if (nums[temp-1] > 0){
      nums[temp-1] *= -1;
    }
  });
  nums.forEach((el, idx) => {
    if (el > 0){
      res.push(idx+1);
    }
  })

  return res;
}

const rotatedDigits = function(num){
  let sum = 0;
  let hash = {2, 5, 6, 9}
  const checkNumber = function(n){
    let str = n.toString();
    for(i = 0; i<str.length; i++){
      if(typeof hash[str[i]] === 'undefined') return false;
    }

    return true;
  }
  for (i = 1; i <= num; i++){
    if (checkNumber(i)) sum += 1;
  }

  return sum;
}

const getMinimumDifference = function(root){
  // traverse the BST and put them in an array, then compare the neighbor elements to find the minimum difference.
  let nums;
  let minimum;
  // helper to traverse the BST
  const process = function(node){
    if (node){
      return process(node.left).concat([node.val], process(node.right));
    } else {
      return [];
    }
  }

  nums = process(root);
  for(i = 0; i < nums.length-1; i++){
    if(typeof minimum === 'undefined' || nums[i+1] - nums[i] < minimum){
      minimum = nums[i+1]-nums[i];
    }
  }

  return minimum;
}

const firstUniqChar = function(str){
  // create a hash to store the chars and its correspoding indecies
  let hash = new Object();
  for(i = 0; i < str.length; i++){
    if (typeof hash[str[i]] === 'undefined'){
      hash[str[i]] = 1;
    } else {
      hash[str[i]]+=1;
    }
  }

  // iterate the str again and if the value in the hash is 1 return that index
  for(i = 0; i < str.length; i++){
    if(hash[s[i]] === 1){
      return i;
    }
  }

  return -1;
}

const numberOfBoomerangs = function(points){
  // helper to find the distance square between 2 points
  const distance = function(p1, p2){
    return ((p1[0] - p2[0])**2 + (p1[1] - p2[1])**2) ** 0.5;
  }
  let res = 0;
  let hash = {};
  for(i = 0; i < points.length; i++){
    // reset the hash
    hash = {};
    for(j = 0; j < points.length; j++){
      let temp = distance(points[i], points[j]);
      hash[temp] = (hash[temp] || 0) + 1;
    }
    // add how many possible ans to res
    Object.values(hash).forEach(el => {
      res += el * (el-1);
    })
  }

  return res;
}

const findRelativeRanks = function(nums){
  // create a hash to store their points and their index
  let hash = new Object();
  let res = [];
  nums.forEach((el, idx) => {
    hash[el] = idx;
  });

  // sort the nums then update the res with their places
  nums.sort((a,b) => a - b).forEach((el, idx) => {
    if (idx === nums.length-1){
      res[hash[el]] = 'Gold Medal';
    } else if (idx === nums.length-2){
      res[hash[el]] = 'Silver Medal';
    } else if (idx === nums.length -3){
      res[hash[el]] = 'Bronze Medal';
    } else {
      res[hash[el]] = (nums.length - idx).toString();
    }
  });



  return res;
}

const largeGroupPositions = function(s){
  let res = [];
  let beginIdx = 0;
  let count = 1;
  for(i = 1; i <= s.length; i++){
    if (s[i] != s[i-1]){
      if (count >= 3) res.push([beginIdx, i-1])
      beginIdx = i;
      count = 1;
    } else {
      count += 1;
    }
  }

  return res;
}

const longestPalindrome = function(s){
  // a palindrom has to have even number of a char
  // at most can have 1 char that is odd count
  // a true or false var to check if there's a odd number char
  let length = 0;
  let single = false;
  // iterate every cahrs in the string and keep the count of each chars to a hash
  let hash = new Object();
  for (i = 0; i < s.length; i++){
    hash[s[i]] = (hash[s[i]] || 0) + 1;
  }
  // iterate the hash's values get the even amount of char add them to the length;
  Object.values(hash).forEach(el => {
    length += Math.floor(el/2) * 2;
    if (el % 2 === 1){
      single = true;
    }
  });
  if (single === true) length += 1;
  return length;
}

const diameterOfBinaryTree = function(root){
  // create a var to hold the maxLength found
  let maxLength = 0;
  // helper function to find out the depth of a node and also update the maxLength if found by current node (node.left depth + node.right depth)
  const depth = function(node){
    if (node === null) return 0; //this is the base case
    let left = depth(node.left);
    let right = depth(node.right);
    // update the maxLength if left depth + right depth is greater
    maxLength = Math.max(maxLength, left+right);
    return Math.max(left, right) + 1;
  }
  // call the helper function with the root
  depth(root);
  return maxLength;
}

const readBinaryWatch = function(num){
  // for all the possible time, calculate how many lights will be on, if the lights on === num given, push that time to the returning arr
  let res = [];
  // helper to calculate how many lights will be on at a given hour and minutes
  const calLight = function(hr, min){
    let light = 0
    light += hr.toString(2).split('').filter(el => el == 1).length;
    light += min.toString(2).split('').filter(el => el == 1).length;
    return light;
  }
  // helper to turn the hours and minutes to a valid time string
  const toValidTime = function(hr, min){
    if (min < 10){
      return hr.toString() + ':0' + min.toString();
    } else {
      return hr.toString() + ':' + min.toString();
    }
  }
  // loop to process all the possible time
  for(h = 0; h < 12; h++){
    for(m = 0; m < 60; m++){
      if (calLight(h,m) === num){
        res.push(toValidTime(h,m));
      }
    }
  }

  return res;
}

const checkRecord = function(s){
  // iterate the given s keep track on how many A total once reach 2 return false; for continuous L when you see L mark 1 if another L follwing return false otherwise reset L to 0
  let A = 0;
  let L = 0;
  for (i = 0; i < s.length; i++){
    if (s[i] === 'A'){
      A += 1;
      if (A > 1) return false;
    }
    if (s[i] === 'L'){
      if (L === 2){
        return false;
      } else{
        L += 1;
      }
    } else {
      L = 0;
    }
  }
  return true;
}

const reverseStr = function(s,k){
  let newStr = "";
  for (i = 0; i < s.length; i += 2*k){
    newStr += s.slice(i, i+k).split('').reverse().join('') + s.slice(i+k, i+(2*k))
  }
  return newStr;
}

const binaryTreePaths = function(node){
  if (node === null) return [];
  if (node.left === null && node.right === null){
    return [`${node.val}`];
  } else {
    let left = binaryTreePaths(node.left);
    let right = binaryTreePaths(node.right);
    return (left.concat(right)).map(el => `${node.val}->${el}`);
  }
}

const findContestMatch = function(n){
  // create a teams array to hold the teams that are going to be matched
  let teams = [];
  // before any matches, teams should be 1..n
  for(i = 1; i <= n; i++){
    teams.push(i);
  }
  // create a helper function to match 2 teams(in an array)
  const match = function(t){
    return `(${t[0]},${t[1]})`;
  }
  // while the teams.length > 1 means there are more than one teams need to be matched
  while (teams.length > 1){
    // create a var to hold the result after match, update the teams array after each iteration
    let temp = [];
    // pass the 1st vs last teams and so on in the teams to the match and push the result to the temp
    for(i = 0; i<teams.length/2; i++){
      temp.push(match([teams[i], teams[teams.length-1-i]]));
    }
    // update the matched to the teams
    teams = temp;
  };
  // when there is only one element in the teams array means all teams are matched so return the first element
  return teams[0];
}

const wiggleSort = function(nums){
  // create a boolean to check if requirements met
  let check = false;
  // a helper function to swap the elements in two indecies in the given array
  const swap = function(i1, i2){
    let temp = nums[i1];
    nums[i1] = nums[i2];
    nums[i2] = temp;
  }
  while(check === false){
    check = true;
    // every time we only have to pick odd idx and check its neighbors
    for (i = 1; i < nums.length; i += 2){
      if (nums[i] < nums[i-1]){
        swap(i, i-1);
        check = false;
      }
      if (nums[i] < nums[i+1]){
        swap(i, i+1);
        check = false;
      }
    }
  }

  return nums;
}

const canVisitAllRooms = function(rooms){
  // create a hash key is the room# and value is visited or not
  let hash = new Object();
  // create an arr to store which room to check next begin with room 0
  let arr = [0];
  // if the arr is not empty means theres other rooms that you can visit
  while (arr.length > 0){
    // skip the first room in the arr if it was visited by checking the hash
    if (hash[arr[0]] !== true) {
      // put the key that you found in the first room of the arr
      arr = arr.concat(rooms[arr[0]]);
      // also set the value of first room in the hash to true;
      hash[arr[0]] = true;
      // then shift to remove visited room from the arr
    }
    arr.shift()
  }
  // iterate the given # of rooms to see if all the rooms are visited
  for(i = 0; i < rooms.length; i++){
    if(typeof hash[i] === 'undefined') return false;
  }

  return true;
}

const getModifiedArray = function(length, updates){
  // initialize the array with all 0's and given length
  let arr = new Array(length).fill(0);

  // create a helper to handle one operation at a time
  const operation = function(start, end, inc){
    // for (i = start; i <= end; i++){
    //   arr[i] += inc;
    // }
    // instead of updating all the elements in the range, only update the start and end+1 position
    arr[start] += inc;
    if (end+1 < length){
      arr[end+1] -= inc;
    }
  }
  updates.forEach(el => operation(el[0], el[1], el[2]));

  // return arr;
  // iterate through the arr and update each element by adding the previous element
  for(i = 1; i < length; i++){
    arr[i] += arr[i-1];
  }

  return arr;
}

const findLonelyPixel = function(picture){
  let count = 0;
  let height = picture.length;
  let width = picture[0].length;
  // create a col hash to store the col vs how many 'B' in that col
  col = new Object();
  // create a row hash to store the row vs how many 'B' in that row
  row = new Object();
  // iterate the picture and update the hashes when 'B' appears
  for(i=0; i<height; i++){
    for(j=0; j<width; j++){
      if (picture[i][j] === 'B'){
        col[j] = (col[j] || 0) + 1;
        row[i] = (row[i] || 0) + 1;
      }
    }
  }
  // iterate the picture again and if the el is 'B' check for that row and col if its the only 'B' then count += 1
  for(i=0; i<height; i++){
    for(j=0; j<width; j++){
      if (picture[i][j] === 'B' && col[j] === 1 && row[i] === 1) {
        count += 1;
      }
    }
  }
  return count;
}

/**
 * Initialize your data structure here.
 */
var HitCounter = function() {
    this.bank = [];
};

/**
 * Record a hit.
        @param timestamp - The current timestamp (in seconds granularity).
 * @param {number} timestamp
 * @return {void}
 */
HitCounter.prototype.hit = function(timestamp) {
    this.bank.push(timestamp);
};

/**
 * Return the number of hits in the past 5 minutes.
        @param timestamp - The current timestamp (in seconds granularity).
 * @param {number} timestamp
 * @return {number}
 */
HitCounter.prototype.getHits = function(timestamp) {
    return this.bank.filter(el => timestamp - el < 5*60).length;
};

/**
 * Your HitCounter object will be instantiated and called as such:
 * var obj = Object.create(HitCounter).createNew()
 * obj.hit(timestamp)
 * var param_2 = obj.getHits(timestamp)
**/

class ZigzagIterator{
  constructor(v1,v2){
    let res = [];
    let i = 0;
    while (i < v1.length && i < v2.length){
      res.push(v1[i]);
      res.push(v2[i]);
      i++;
    };
    if (v1.length > v2.length){
      res = res.concat(v1.slice(i));
    } else {
      res = res.concat(v2.slice(i));
    };
    this.translated = res;
    this.counter = 0;
  }
  hasNext(){
    return this.counter < this.translated.length;
  }

  next(){
    this.counter += 1;
    return this.translated[this.counter - 1];
  }
}

const dailyTemperatures = function(temperatures){
  // create an array to store the result and initialize to 0
  let res = new Array(temperatures.length).fill(0);
  // create an array to store the temperature index stack initialize to the last element in the temperatures
  let tempStack = [temperatures.length-1];
  // start to iterate the given temperatures from the second to the last element
  for (i = temperatures.length-2; i >= 0; i--){
    // if the stack is not empty and the last element in the stack is not larger than the current temp then pop from stack
    while (tempStack.length > 0 && temperatures[tempStack[tempStack.length-1]] <= temperatures[i]){
      tempStack.pop();
    }
    if (tempStack.length > 0){
      res[i] = tempStack[tempStack.length-1] - i
    }
    tempStack.push(i);
  }

  return res;
};

const frequencySort = function(s){
  // create a hash table to store the chars and their frequencies
  let hash = new Object();
  let res = "";
  for (i = 0; i < s.length; i++){
    hash[s[i]] = (hash[s[i]] || 0) + 1;
  }
  // sort the keys by the decending order of the values
  // each of the keys push the same amount of the frequencies to the result string
  Object.keys(hash).sort((a, b) => hash[b] - hash[a]).forEach(el => {
    for(i = 0; i < hash[el]; i++){
      res.push(el);
    }
  });
  return res;
}

const escapeGhosts = function(ghosts, target){
  // calculate the move for both player and ghosts
  let playerMoves;
  let ghostsMoves;
  let check = true;

  // helper function to calculate the moves from a point to target
  const calculateMoves = function(i, j){
    return Math.abs(target[0] - i) + Math.abs(target[1] - j);
  };
  playerMoves = calculateMoves(0,0);
  ghostsMoves = ghosts.map(el => calculateMoves(el[0], el[1]));
  ghostsMoves.forEach(el => {
    if (el <= playerMoves) check = false;
  });

  return check;
}


























//
