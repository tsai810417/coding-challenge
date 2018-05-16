# Given an array of integers, return indices of the two numbers such that they add up to a specific target.

# You may assume that each input would have exactly one solution, and you may not use the same element twice.
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    nums.each_with_index do |x,i|
        j = i + 1
        while j < nums.length
            return [i,j] if nums[i] + nums[j ]== target
            j += 1
        end
    end
end

# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
#
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    res = (list_to_num(l1) + list_to_num(l2)).to_s.chars
    i = res.length - 2
    list = ListNode.new(res[-1])
    node = list
    i.downto(0) do | j |
        cur = ListNode.new(res[j])
        node.next = cur
        node = cur
    end

    return list
end

def list_to_num(l1)
    arr = []
    cur = l1
    until cur.nil?
       arr.unshift(cur.val.to_s)
       cur = cur.next
    end
    arr.join('').to_i
end

# Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
# @param {String} s
# @return {Integer}
def first_uniq_char(s)
    hash = Hash.new([])
    i = 0
    while i < s.length
       hash[s[i]] = hash[s[i]] + [i]
        i += 1
    end

    idx = hash.values.select{|x| x.length == 1}
    return -1 if idx.length == 0
    p idx
    idx.sort_by{|x| x[0]}[0][0]

end

# Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.
#
# Example 1:
#
# Input: num1 = "2", num2 = "3"
# Output: "6"
# Example 2:
#
# Input: num1 = "123", num2 = "456"
# Output: "56088"
# Note:
#
# The length of both num1 and num2 is < 110.
# Both num1 and num2 contain only digits 0-9.
# Both num1 and num2 do not contain any leading zero, except the number 0 itself.
# You must not use any built-in BigInteger library or convert the inputs to integer directly.

# @param {String} num1
# @param {String} num2
# @return {String}
def multiply(num1, num2)
    return "0" if num1 == "0" || num2 == "0"

    res = str_to_i(num1) * str_to_i(num2)

    i_to_str(res)
end

def str_to_i(str)
    hash = {
        '0' => 0,
        '1' => 1,
        '2' => 2,
        '3' => 3,
        '4' => 4,
        '5' => 5,
        '6' => 6,
        '7' => 7,
        '8' => 8,
        '9' => 9
        }
    sum = 0
    str.chars.reverse.each_with_index do |n, i|
        sum += (hash[n] * 10**i)
    end

    sum
end

def i_to_str(num)
    hash = {
        '0' => 0,
        '1' => 1,
        '2' => 2,
        '3' => 3,
        '4' => 4,
        '5' => 5,
        '6' => 6,
        '7' => 7,
        '8' => 8,
        '9' => 9
        }
    str = ""
    power = 0
    while num / (10**power) > 0
       power += 1
    end

    (power - 1).downto(0) do |i|
        str += hash.key(num / 10**i)
        num = num % 10**i
    end

    str
end

# Reverse Words in a String III
# Given a string, you need to reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.
#
# Example 1:
# Input: "Let's take LeetCode contest"
# Output: "s'teL ekat edoCteeL tsetnoc"
# Note: In the string, each word is separated by single space and there will not be any extra space in the string.

# @param {String} s
# @return {String}
def reverse_words(s)
    s.split(' ').map{|x| reverse_word(x)}.join(' ')
end

def reverse_word(str)
   i = 0
    res = ""
    while i < str.length
        res = str[i] + res
        i += 1
    end

    res
end

# Rotate String
#
# We are given two strings, A and B.
#
# A shift on A consists of taking string A and moving the leftmost character to the rightmost position. For example, if A = 'abcde', then it will be 'bcdea' after one shift on A. Return True if and only if A can become B after some number of shifts on A.
#
# Example 1:
# Input: A = 'abcde', B = 'cdeab'
# Output: true
#
# Example 2:
# Input: A = 'abcde', B = 'abced'
# Output: false
# Note:
#
# A and B will have length at most 100.

# @param {String} a
# @param {String} b
# @return {Boolean}
def rotate_string(a, b)
    return true if a == b && a == ""

    a.length.times do
       return true if a == b
        a = rotate(a)
    end

    false
end

def rotate(a)
    a = a[1..-1] + a[0]
end

# Reverse String II
#
# Given a string and an integer k, you need to reverse the first k characters for every 2k characters counting from the start of the string. If there are less than k characters left, reverse all of them. If there are less than 2k but greater than or equal to k characters, then reverse the first k characters and left the other as original.
# Example:
# Input: s = "abcdefg", k = 2
# Output: "bacdfeg"
# Restrictions:
# The string consists of lower English letters only.
# Length of the given string and k will in the range [1, 10000]

# @param {String} s
# @param {Integer} k
# @return {String}
def reverse_str(s, k)
    group = [[]]
    (0...s.length).to_a.each do |i|
       if group[-1].length < 2*k
           group[-1].push(s[i])
       else
           group.push([s[i]])
       end
    end

    group.map{|x| swap(x.join, k)}.join
end

def swap(s, k)
    if s[k..-1]
        s[0...k].reverse + s[k..-1]
    else
        s[0...k].reverse
    end
end
