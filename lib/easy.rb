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

# Number of Segments in a String
#
# Count the number of segments in a string, where a segment is defined to be a contiguous sequence of non-space characters.
#
# Please note that the string does not contain any non-printable characters.
#
# Example:
#
# Input: "Hello, my name is John"
# Output: 5

# @param {String} s
# @return {Integer}
def count_segments(s)
    s.split(' ').length
end

# Isomorphic Strings
#
# Given two strings s and t, determine if they are isomorphic.
#
# Two strings are isomorphic if the characters in s can be replaced to get t.
#
# All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character but a character may map to itself.
#
# Example 1:
#
# Input: s = "egg", t = "add"
# Output: true
# Example 2:
#
# Input: s = "foo", t = "bar"
# Output: false
# Example 3:
#
# Input: s = "paper", t = "title"
# Output: true
# Note:
# You may assume both s and t have the same length.

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
    s_hash = Hash.new{[]}
    s.chars.each_with_index do |x, i|
        s_hash[x] = s_hash[x].push(i)
    end

    t_hash = Hash.new{[]}
    t.chars.each_with_index do |x,i|
        t_hash[x] = t_hash[x].push(i)
    end

    t_hash.values.sort == s_hash.values.sort
end

# Goat Latin
#
#
# A sentence S is given, composed of words separated by spaces. Each word consists of lowercase and uppercase letters only.
#
# We would like to convert the sentence to "Goat Latin" (a made-up language similar to Pig Latin.)
#
# The rules of Goat Latin are as follows:
#
# If a word begins with a vowel (a, e, i, o, or u), append "ma" to the end of the word.
# For example, the word 'apple' becomes 'applema'.
#
# If a word begins with a consonant (i.e. not a vowel), remove the first letter and append it to the end, then add "ma".
# For example, the word "goat" becomes "oatgma".
#
# Add one letter 'a' to the end of each word per its word index in the sentence, starting with 1.
# For example, the first word gets "a" added to the end, the second word gets "aa" added to the end and so on.
# Return the final sentence representing the conversion from S to Goat Latin.
#
# Example 1:
#
# Input: "I speak Goat Latin"
# Output: "Imaa peaksmaaa oatGmaaaa atinLmaaaaa"
# Example 2:
#
# Input: "The quick brown fox jumped over the lazy dog"
# Output: "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa"
#
#
# Notes:
#
# S contains only uppercase, lowercase and spaces. Exactly one space between each word.
# 1 <= S.length <= 150.
#
# # @param {String} s
# # @return {String}
def to_goat_latin(s)
    s.split(' ').map.with_index{|x, i| translate(x, i)}.join(' ')
end


def translate(str, idx)
    v = "aeiouAEIOU".chars
    res = ""
    if v.include?(str[0])
       res = str + 'ma'
    else
        res = str[1..-1] + str[0] + 'ma'
    end

    (idx + 1).times do
        res += 'a'
    end

    res
end

# Keyboard Row
# Given a List of words, return the words that can be typed using letters of alphabet on only one row's of American keyboard like the image below.
#
# Example 1:
# Input: ["Hello", "Alaska", "Dad", "Peace"]
# Output: ["Alaska", "Dad"]
# Note:
# You may use one character in the keyboard more than once.
# You may assume the input string will only contain letters of alphabet.
#
# # @param {String[]} words
# # @return {String[]}
def find_words(words)
    words.select{|x| in_same_row?(x)}
end

def in_same_row?(str)
   r1 = "qwertyuiop"
    r2 = "asdfghjkl"
    r3 = "zxcvbnm"

    if r1.include?(str[0].downcase)
        str.downcase.chars[1..-1].each do |l|
            return false unless r1.include?(l)
        end
        return true
    elsif r2.include?(str[0].downcase)
        str.downcase.chars[1..-1].each do |l|
            return false unless r2.include?(l)
        end
        return true
    elsif r3.include?(str[0].downcase)
        str.downcase.chars[1..-1].each do |l|
            return false unless r3.include?(l)
        end
        return true
    end
end

# Baseball Game
# You're now a baseball game point recorder.
#
# Given a list of strings, each string can be one of the 4 following types:
#
# Integer (one round's score): Directly represents the number of points you get in this round.
# "+" (one round's score): Represents that the points you get in this round are the sum of the last two valid round's points.
# "D" (one round's score): Represents that the points you get in this round are the doubled data of the last valid round's points.
# "C" (an operation, which isn't a round's score): Represents the last valid round's points you get were invalid and should be removed.
# Each round's operation is permanent and could have an impact on the round before and the round after.
#
# You need to return the sum of the points you could get in all the rounds.
#
# Example 1:
# Input: ["5","2","C","D","+"]
# Output: 30
# Explanation:
# Round 1: You could get 5 points. The sum is: 5.
# Round 2: You could get 2 points. The sum is: 7.
# Operation 1: The round 2's data was invalid. The sum is: 5.
# Round 3: You could get 10 points (the round 2's data has been removed). The sum is: 15.
# Round 4: You could get 5 + 10 = 15 points. The sum is: 30.
# Example 2:
# Input: ["5","-2","4","C","D","9","+","+"]
# Output: 27
# Explanation:
# Round 1: You could get 5 points. The sum is: 5.
# Round 2: You could get -2 points. The sum is: 3.
# Round 3: You could get 4 points. The sum is: 7.
# Operation 1: The round 3's data is invalid. The sum is: 3.
# Round 4: You could get -4 points (the round 3's data has been removed). The sum is: -1.
# Round 5: You could get 9 points. The sum is: 8.
# Round 6: You could get -4 + 9 = 5 points. The sum is 13.
# Round 7: You could get 9 + 5 = 14 points. The sum is 27.
# Note:
# The size of the input list will be between 1 and 1000.
# Every integer represented in the list will be between -30000 and 30000.

# @param {String[]} ops
# @return {Integer}
def cal_points(ops)
    arr = []
    ops.each do |x|
       if x == '+'
           arr.push(arr[-1] + arr[-2])
       elsif x == 'D'
           arr.push(arr[-1] * 2)
       elsif x == 'C'
           arr.pop
       else
           arr.push(x.to_i)
       end
    end

    arr.reduce(:+)
end

# Distribute Candies
# Given an integer array with even length, where different numbers in this array represent different kinds of candies. Each number means one candy of the corresponding kind. You need to distribute these candies equally in number to brother and sister. Return the maximum number of kinds of candies the sister could gain.
# Example 1:
# Input: candies = [1,1,2,2,3,3]
# Output: 3
# Explanation:
# There are three different kinds of candies (1, 2 and 3), and two candies for each kind.
# Optimal distribution: The sister has candies [1,2,3] and the brother has candies [1,2,3], too.
# The sister has three different kinds of candies.
# Example 2:
# Input: candies = [1,1,2,3]
# Output: 2
# Explanation: For example, the sister has candies [2,3] and the brother has candies [1,1].
# The sister has two different kinds of candies, the brother has only one kind of candies.
# Note:
#
# The length of the given array is in range [2, 10,000], and will be even.
# The number in given array is in range [-100,000, 100,000].
# @param {Integer[]} candies
# @return {Integer}
def distribute_candies(candies)
    hash = Hash.new(0)
    candies.each do |el|
        hash[el] += 1
    end

    if hash.keys.length >= candies.length/2
        return candies.length / 2
    else
        return hash.keys.length
    end
end

# 412. Fizz Buzz
#
# Write a program that outputs the string representation of numbers from 1 to n.
#
# But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.
#
# Example:
#
# n = 15,
#
# Return:
# [
#     "1",
#     "2",
#     "Fizz",
#     "4",
#     "Buzz",
#     "Fizz",
#     "7",
#     "8",
#     "Fizz",
#     "Buzz",
#     "11",
#     "Fizz",
#     "13",
#     "14",
#     "FizzBuzz"
# ]
# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
    arr = []
    (1..n).each do |i|
       if i % 15 == 0
           arr.push("FizzBuzz")
       elsif i % 3 == 0
           arr.push("Fizz")
       elsif i % 5 == 0
           arr.push("Buzz")
       else
           arr.push(i.to_s)
       end
    end

    arr
end

# 807. Max Increase to Keep City Skyline
# In a 2 dimensional array grid, each value grid[i][j] represents the height of a building located there. We are allowed to increase the height of any number of buildings, by any amount (the amounts can be different for different buildings). Height 0 is considered to be a building as well.
#
# At the end, the "skyline" when viewed from all four directions of the grid, i.e. top, bottom, left, and right, must be the same as the skyline of the original grid. A city's skyline is the outer contour of the rectangles formed by all the buildings when viewed from a distance. See the following example.
#
# What is the maximum total sum that the height of the buildings can be increased?
#
# Example:
# Input: grid = [[3,0,8,4],[2,4,5,7],[9,2,6,3],[0,3,1,0]]
# Output: 35
# Explanation:
# The grid is:
# [ [3, 0, 8, 4],
#   [2, 4, 5, 7],
#   [9, 2, 6, 3],
#   [0, 3, 1, 0] ]
#
# The skyline viewed from top or bottom is: [9, 4, 8, 7]
# The skyline viewed from left or right is: [8, 7, 9, 3]
#
# The grid after increasing the height of buildings without affecting skylines is:
#
# gridNew = [ [8, 4, 8, 7],
#             [7, 4, 7, 7],
#             [9, 4, 8, 7],
#             [3, 3, 3, 3] ]
#
# Notes:
#
# 1 < grid.length = grid[0].length <= 50.
# All heights grid[i][j] are in the range [0, 100].
# All buildings in grid[i][j] occupy the entire grid cell: that is, they are a 1 x 1 x grid[i][j] rectangular prism.
# @param {Integer[][]} grid
# @return {Integer}
def max_increase_keeping_skyline(grid)
    x = []
    y = []
    n = 0
    sum = 0
    while n < grid.length
        y.push(grid[n].max)
        cur = []
        m = 0
        while m < grid.length
            cur.push(grid[m][n])
            m += 1
        end
        x.push(cur.max)
        n += 1
    end

    p x
    p y

    n = 0
    while n < grid.length
        m = 0
        while m < grid.length
            dif = [x[m], y[n]].min - grid[n][m]
            sum += dif if dif > 0
            m += 1
        end
        n += 1
    end

    sum
end

# 654. Maximum Binary Tree
# Given an integer array with no duplicates. A maximum tree building on this array is defined as follow:
#
# The root is the maximum number in the array.
# The left subtree is the maximum tree constructed from left part subarray divided by the maximum number.
# The right subtree is the maximum tree constructed from right part subarray divided by the maximum number.
# Construct the maximum tree by the given array and output the root node of this tree.
#
# Example 1:
# Input: [3,2,1,6,0,5]
# Output: return the tree root node representing the following tree:
#
#       6
#     /   \
#    3     5
#     \    /
#      2  0
#        \
#         1
# Note:
# The size of the given array will be in the range [1,1000].
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} nums
# @return {TreeNode}
def construct_maximum_binary_tree(nums)
    if nums.length == 1
        return TreeNode.new(nums[0])
    elsif nums.empty?
        return nil
    end

    max_idx = 0
    i = 0
    while i < nums.length
        if nums[i] > nums[max_idx]
            max_idx = i
        end
        i += 1
    end

    new_tree = TreeNode.new(nums[max_idx])
    new_tree.left = construct_maximum_binary_tree(nums[0...max_idx])
    new_tree.right = construct_maximum_binary_tree(nums[max_idx+1..-1])

    new_tree
end

# 821. Shortest Distance to a Character
# Given a string S and a character C, return an array of integers representing the shortest distance from the character C in the string.
#
# Example 1:
#
# Input: S = "loveleetcode", C = 'e'
# Output: [3, 2, 1, 0, 1, 0, 0, 1, 2, 2, 1, 0]
#
#
# Note:
#
# S string length is in [1, 10000].
# C is a single character, and guaranteed to be in string S.
# All letters in S and C are lowercase.
# @param {String} s
# @param {Character} c
# @return {Integer[]}
def shortest_to_char(s, c)
    res = []
    s.length.times do |i|
        count = 0
        while true
            if (s[i+count] == c && i + count < s.length) || (s[i-count] == c && i - count >= 0)
                res.push(count)
                break
            end
            count += 1
        end
    end

    res
end
