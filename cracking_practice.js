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
