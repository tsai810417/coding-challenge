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

# 791. Custom Sort String
# S and T are strings composed of lowercase letters. In S, no letter occurs more than once.
#
# S was sorted in some custom order previously. We want to permute the characters of T so that they match the order that S was sorted. More specifically, if x occurs before y in S, then x should occur before y in the returned string.
#
# Return any permutation of T (as a string) that satisfies this property.
#
# Example :
# Input:
# S = "cba"
# T = "abcd"
# Output: "cbad"
# Explanation:
# "a", "b", "c" appear in S, so the order of "a", "b", "c" should be "c", "b", and "a".
# Since "d" does not appear in S, it can be at any position in T. "dcba", "cdba", "cbda" are also valid outputs.
#
#
# Note:
#
# S has length at most 26, and no character is repeated in S.
# T has length at most 200.
# S and T consist of lowercase letters only.

# @param {String} s
# @param {String} t
# @return {String}
def custom_sort_string(s, t)
   res = ""
    s.length.times do |i|
       if t.include?(s[i])
           t.count(s[i]).times do
               res += s[i]
           end
           t.delete!(s[i])
       end
    end
    res += t
end

# 566. Reshape the Matrix
# In MATLAB, there is a very useful function called 'reshape', which can reshape a matrix into a new one with different size but keep its original data.
#
# You're given a matrix represented by a two-dimensional array, and two positive integers r and c representing the row number and column number of the wanted reshaped matrix, respectively.
#
# The reshaped matrix need to be filled with all the elements of the original matrix in the same row-traversing order as they were.
#
# If the 'reshape' operation with given parameters is possible and legal, output the new reshaped matrix; Otherwise, output the original matrix.
#
# Example 1:
# Input:
# nums =
# [[1,2],
#  [3,4]]
# r = 1, c = 4
# Output:
# [[1,2,3,4]]
# Explanation:
# The row-traversing of nums is [1,2,3,4]. The new reshaped matrix is a 1 * 4 matrix, fill it row by row by using the previous list.
# Example 2:
# Input:
# nums =
# [[1,2],
#  [3,4]]
# r = 2, c = 4
# Output:
# [[1,2],
#  [3,4]]
# Explanation:
# There is no way to reshape a 2 * 2 matrix to a 2 * 4 matrix. So output the original matrix.
# Note:
# The height and width of the given matrix is in range [1, 100].
# The given r and c are all positive.

# @param {Integer[][]} nums
# @param {Integer} r
# @param {Integer} c
# @return {Integer[][]}
def matrix_reshape(nums, r, c)
    total = nums.flatten.length
    return nums if r * c > total
    res = Array.new(r) {Array.new(c)}
    flattened = nums.flatten
    r.times do |i|
     res[i] = flattened.shift(c)
    end

    res
end

# 766. Toeplitz Matrix
# A matrix is Toeplitz if every diagonal from top-left to bottom-right has the same element.
#
# Now given an M x N matrix, return True if and only if the matrix is Toeplitz.
#
#
# Example 1:
#
# Input: matrix = [[1,2,3,4],[5,1,2,3],[9,5,1,2]]
# Output: True
# Explanation:
# 1234
# 5123
# 9512
#
# In the above grid, the diagonals are "[9]", "[5, 5]", "[1, 1, 1]", "[2, 2, 2]", "[3, 3]", "[4]", and in each diagonal all elements are the same, so the answer is True.
# Example 2:
#
# Input: matrix = [[1,2],[2,2]]
# Output: False
# Explanation:
# The diagonal "[1, 2]" has different elements.
# Note:
#
# matrix will be a 2D array of integers.
# matrix will have a number of rows and columns in range [1, 20].
# matrix[i][j] will be integers in range [0, 99].

# @param {Integer[][]} matrix
# @return {Boolean}
def is_toeplitz_matrix(matrix)
    x = matrix.length
    y = matrix[0].length
    i = 0
    while i < x - 1
        j = 0
        while j < y - 1
            return false if matrix[i][j] != matrix[i+1][j+1]
            j += 1
        end
        i += 1
    end

    true
end

# 75. Sort Colors
# Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.
#
# Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
#
# Note: You are not suppose to use the library's sort function for this problem.
#
# Example:
#
# Input: [2,0,2,1,1,0]
# Output: [0,0,1,1,2,2]
# Follow up:
#
# A rather straight forward solution is a two-pass algorithm using counting sort.
# First, iterate the array counting number of 0's, 1's, and 2's, then overwrite array with total number of 0's, then 1's and followed by 2's.
# Could you come up with a one-pass algorithm using only constant space?
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
    check = false
    while check == false
        i = 0
        check = true
        while i < nums.length-1
            if nums[i] > nums[i+1]
                nums[i], nums[i+1] = nums[i+1], nums[i]
                check = false
            end
            i += 1
        end
    end

    nums
end

# 162. Find Peak Element
# A peak element is an element that is greater than its neighbors.
#
# Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.
#
# The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.
#
# You may imagine that nums[-1] = nums[n] = -∞.
#
# Example 1:
#
# Input: nums = [1,2,3,1]
# Output: 2
# Explanation: 3 is a peak element and your function should return the index number 2.
# Example 2:
#
# Input: nums = [1,2,1,3,5,6,4]
# Output: 1 or 5
# Explanation: Your function can return either index number 1 where the peak element is 2,
#              or index number 5 where the peak element is 6.
# Note:
#
# Your solution should be in logarithmic complexity.

# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
    return 0 if nums.length == 1

    i = 0
    while i < nums.length - 1
        if nums[i+1] < nums[i]
            return i
        elsif nums[i+1] > nums[i]
            i += 1
        end
    end

    return i
end

# 240. Search a 2D Matrix II
# Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
#
# Integers in each row are sorted in ascending from left to right.
# Integers in each column are sorted in ascending from top to bottom.
# Consider the following matrix:
#
# [
#   [1,   4,  7, 11, 15],
#   [2,   5,  8, 12, 19],
#   [3,   6,  9, 16, 22],
#   [10, 13, 14, 17, 24],
#   [18, 21, 23, 26, 30]
# ]
# Example 1:
#
# Input: matrix, target = 5
# Output: true
# Example 2:
#
# Input: matrix, target = 20
# Output: false
# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
    rows = []

    (matrix.length).times do |i|
        next if matrix[i].empty?
       if matrix[i][0] <= target && matrix[i][-1] >= target
           rows.push(i)
       end
    end
    p rows
    rows.each do |row|
       return true if matrix[row].include?(target)
    end

    return false
end

# 49. Group Anagrams
# Given an array of strings, group anagrams together.
#
# Example:
#
# Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
# Output:
# [
#   ["ate","eat","tea"],
#   ["nat","tan"],
#   ["bat"]
# ]
# Note:
#
# All inputs will be in lowercase.
# The order of your output does not matter.
# @param {String[]} strs
# @return {String[][]}
