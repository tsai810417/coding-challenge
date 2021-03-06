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
def group_anagrams(strs)
    hash = Hash.new{[]}
    strs.each do |word|
        rearrange = word.chars.sort
       hash[rearrange] = hash[rearrange].push(word)
    end

    hash.values
end

# 7. Reverse Integer
# Given a 32-bit signed integer, reverse digits of an integer.
#
# Example 1:
#
# Input: 123
# Output: 321
# Example 2:
#
# Input: -123
# Output: -321
# Example 3:
#
# Input: 120
# Output: 21
# Note:
# Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
# @param {Integer} x
# @return {Integer}
def reverse(num)
    if num == 0
        return 0
    end
    if num < 0
        new_num = -1 * (change(num * -1))
    else
        new_num = change(num)
    end

    if new_num < -(2**31) || new_num >= (2**31)
        return 0
    else
        return new_num
    end

end

def change(num)
    until num % 10 != 0
        num /= 10
    end

    num.to_s.reverse.to_i
end

# 189. Rotate Array
#
# Given an array, rotate the array to the right by k steps, where k is non-negative.
#
# Example 1:
#
# Input: [1,2,3,4,5,6,7] and k = 3
# Output: [5,6,7,1,2,3,4]
# Explanation:
# rotate 1 steps to the right: [7,1,2,3,4,5,6]
# rotate 2 steps to the right: [6,7,1,2,3,4,5]
# rotate 3 steps to the right: [5,6,7,1,2,3,4]
# Example 2:
#
# Input: [-1,-100,3,99] and k = 2
# Output: [3,99,-1,-100]
# Explanation:
# rotate 1 steps to the right: [99,-1,-100,3]
# rotate 2 steps to the right: [3,99,-1,-100]
# Note:
#
# Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
# Could you do it in-place with O(1) extra space?
# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums, k)
    k = k % nums.length
    nums.reverse!
    nums[k..-1] = nums[k..-1].reverse
    nums[0...k] = nums[0...k].reverse
end

# 238. Product of Array Except Self
#
# Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
#
# Example:
#
# Input:  [1,2,3,4]
# Output: [24,12,8,6]
# Note: Please solve it without division and in O(n).
#
# Follow up:
# Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)
# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
    # solution with division
    # total = nums.reduce(:*)
    # nums.each_index do |i|
    #    nums[i] = total / nums[i]
    # end

    # solution with O(n^2) worst case
    # res = []
    # nums.each_index do |i|
    #    res.push((nums[0...i] + nums[i+1..-1]).reduce(:*))
    # end
    # res

    prod_after_me = []
    a = 1
    nums.each do |n|
        prod_after_me.push(a)
        a *= n

    end
    prod_before_me = []
    b = 1
    ((nums.length)-1).downto(0) do |i|
       prod_before_me.unshift(b)
        b *= nums[i]

    end
    res = []
    nums.length.times do |i|
       res.push(prod_after_me[i] * prod_before_me[i])
    end

    res
end

# Is Unique: Implement a menthod to determine if a string has all unique characters.

def is_uniq?(str)
  hash = Hash.new{false}
  str.length.times do |i|
    if hash[str[i]] == false
      hash[str[i]] = true
    else
      return false
    end
  end

  return true
end

# Is Permutation: Given 2 strings, write a method to decide if one is a permutaiton of the other

def is_permutation?(s1, s2)
  return false if s1.length != s2.length
  sort(s1) == sort(s2)
end

def sort(str)
  str.chars.sort.join
end

# 125. Valid Palindrome
# Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
#
# Note: For the purpose of this problem, we define empty string as valid palindrome.
#
# Example 1:
#
# Input: "A man, a plan, a canal: Panama"
# Output: true
# Example 2:
#
# Input: "race a car"
# Output: false
# @param {String} s
# @return {Boolean}
def is_palindrome(s)
    alp = ('a'..'z').to_a + (0..9).to_a.map{|x| x.to_s}
    arr = s.downcase.chars.select{|x| alp.include?(x)}
    p arr
    arr.reverse == arr
end

# 69. Sqrt(x)
# Implement int sqrt(int x).
#
# Compute and return the square root of x, where x is guaranteed to be a non-negative integer.
#
# Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.
#
# Example 1:
#
# Input: 4
# Output: 2
# Example 2:
#
# Input: 8
# Output: 2
# Explanation: The square root of 8 is 2.82842..., and since
#              the decimal part is truncated, 2 is returned.
# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
   (x**0.5).floor
end

# 28. Implement strStr()
# Implement strStr().
#
# Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
#
# Example 1:
#
# Input: haystack = "hello", needle = "ll"
# Output: 2
# Example 2:
#
# Input: haystack = "aaaaa", needle = "bba"
# Output: -1
# Clarification:
#
# What should we return when needle is an empty string? This is a great question to ask during an interview.
#
# For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().
# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
    return 0 if haystack == needle
    return -1 if haystack.length == 0
    l = needle.length
    (haystack.length).times do |i|
       return i if haystack[i...i+l] == needle
    end

    return -1
end

# 88. Merge Sorted Array
# Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
#
# Note:
#
# The number of elements initialized in nums1 and nums2 are m and n respectively.
# You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
# Example:
#
# Input:
# nums1 = [1,2,3,0,0,0], m = 3
# nums2 = [2,5,6],       n = 3
#
# Output: [1,2,2,3,5,6]
# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
    arr1 = nums1[0...m]
    (m+n).times do |i|
       if arr1.empty?
           nums1[i] = nums2.shift
       elsif nums2.empty?
           nums1[i] = arr1.shift
       elsif arr1[0] < nums2[0]
           nums1[i] = arr1.shift
       else
           nums1[i] = nums2.shift
       end
    end
end

# 14. Longest Common Prefix
# Write a function to find the longest common prefix string amongst an array of strings.
#
# If there is no common prefix, return an empty string "".
#
# Example 1:
#
# Input: ["flower","flow","flight"]
# Output: "fl"
# Example 2:
#
# Input: ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.
# Note:
#
# All given inputs are in lowercase letters a-z.
# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
    return "" if strs.length == 0
    return strs[0] if strs.length == 1
    i = 0
    while i <= strs[0].length
       if strs.all?{|x| x[0..i] == strs[0][0..i]}
           i += 1
       else
           break
       end
    end
    return strs[0][0...i]
end

# 268. Missing Number
# Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.
#
# Example 1:
#
# Input: [3,0,1]
# Output: 2
# Example 2:
#
# Input: [9,6,4,2,3,5,7,0,1]
# Output: 8
# Note:
# Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?
# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  # this is O(n logn) solution
    sorted = nums.sort
    nums.length.times do |i|
        return i if sorted[i] != i
    end
end

# 108. Convert Sorted Array to Binary Search Tree
# Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
#
# For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
#
# Example:
#
# Given the sorted array: [-10,-3,0,5,9],
#
# One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:
#
#       0
#      / \
#    -3   9
#    /   /
#  -10  5

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
def sorted_array_to_bst(nums)
    return nil if nums.length == 0
    mid = nums.length / 2
    root = TreeNode.new(nums[mid])
    cur_node = root
    i = 1
    until mid-i < 0
        cur_node.left = TreeNode.new(nums[mid-i])
        cur_node = cur_node.left
        i += 1
    end
    cur_node = root
    i = 1
    until mid + i == nums.length
        cur_node.right = TreeNode.new(nums[mid+i])
        cur_node = cur_node.right
        i += 1
    end

    root
end

# 628. Maximum Product of Three Numbers
# Given an integer array, find three numbers whose product is maximum and output the maximum product.
#
# Example 1:
# Input: [1,2,3]
# Output: 6
# Example 2:
# Input: [1,2,3,4]
# Output: 24
# Note:
# The length of the given array will be in range [3,104] and all elements are in the range [-1000, 1000].
# Multiplication of any three numbers in the input won't exceed the range of 32-bit signed integer.
# @param {Integer[]} nums
# @return {Integer}
def maximum_product(nums)
    sorted = nums.sort
    if (sorted[0] * sorted[1] * sorted[-1]) > sorted[-3..-1].reduce(:*)
        return (sorted[0] * sorted[1] * sorted[-1])
    else
        return sorted[-3..-1].reduce(:*)
    end
end

# 350. Intersection of Two Arrays II
# Given two arrays, write a function to compute their intersection.
#
# Example:
# Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2, 2].
#
# Note:
# Each element in the result should appear as many times as it shows in both arrays.
# The result can be in any order.
# Follow up:
# What if the given array is already sorted? How would you optimize your algorithm?
# What if nums1's size is small compared to nums2's size? Which algorithm is better?
# What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
    arr1 = nums1.dup
    arr2 = nums2.dup
    arr1.sort!
    arr2.sort!
    res = []
    until arr1.empty? || arr2.empty?
       if  arr1[0] == arr2[0]
           res.push(arr1.shift)
           arr2.shift
       elsif arr1[0] < arr2[0]
           arr1.shift
       elsif arr2[0] < arr1[0]
           arr2.shift
       end
    end

    res
end

# 504. Base 7
# Given an integer, return its base 7 string representation.
#
# Example 1:
# Input: 100
# Output: "202"
# Example 2:
# Input: -7
# Output: "-10"
# Note: The input will be in range of [-1e7, 1e7].
# @param {Integer} num
# @return {String}
def convert_to_base7(num)
    n = num.abs
    str = num < 0 ? "-" : ""

    if n < 7
        return num.to_s
    else
        return str + convert(n)
    end
end

def convert(n)
    str = ""
    if n < 7
        return n.to_s
    else
        str = (n%7).to_s + str
        str = convert(n/7) + str
    end
    return str
end

# 94. Binary Tree Inorder Traversal
# Given a binary tree, return the inorder traversal of its nodes' values.
#
# Example:
#
# Input: [1,null,2,3]
#    1
#     \
#      2
#     /
#    3
#
# Output: [1,3,2]
# Follow up: Recursive solution is trivial, could you do it iteratively?
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal(root)
  # this is recursive solution
  return [] if root.nil?
  inorder_traversal(root.left) + [root.val] + inorder_traversal(root.right)
end

# 13. Roman to Integer
# Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
#
# Symbol       Value
# I             1
# V             5
# X             10
# L             50
# C             100
# D             500
# M             1000
# For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.
#
# Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
#
# I can be placed before V (5) and X (10) to make 4 and 9.
# X can be placed before L (50) and C (100) to make 40 and 90.
# C can be placed before D (500) and M (1000) to make 400 and 900.
# Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.
# Example 1:
#
# Input: "III"
# Output: 3
# Example 2:
#
# Input: "IV"
# Output: 4
# Example 3:
#
# Input: "IX"
# Output: 9
# Example 4:
#
# Input: "LVIII"
# Output: 58
# Explanation: C = 100, L = 50, XXX = 30 and III = 3.
# Example 5:
#
# Input: "MCMXCIV"
# Output: 1994
# Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
# @param {String} s
# @return {Integer}
def roman_to_int(s)
    hash = {
        I: 1,
        V: 5,
        X: 10,
        L: 50,
        C: 100,
        D: 500,
        M: 1000
        }
    sum = 0
    s.chars.each_with_index do |x, i|
        next if i == s.length - 1
       if hash[s[i+1].to_sym] > hash[x.to_sym]
           sum -= hash[x.to_sym]
       else
           sum += hash[x.to_sym]
       end
    end

    sum += hash[s[-1].to_sym]
end

# 100. Same Tree
# Given two binary trees, write a function to check if they are the same or not.
#
# Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
#
# Example 1:
#
# Input:     1         1
#           / \       / \
#          2   3     2   3
#
#         [1,2,3],   [1,2,3]
#
# Output: true
# Example 2:
#
# Input:     1         1
#           /           \
#          2             2
#
#         [1,2],     [1,null,2]
#
# Output: false
# Example 3:
#
# Input:     1         1
#           / \       / \
#          2   1     1   2
#
#         [1,2,1],   [1,1,2]
#
# Output: false
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(p, q)
    return true if p.nil? && q.nil?
    return false if q.nil? || p.nil?

    return false if p.val != q.val
    is_same_tree(p.right, q.right) && is_same_tree(p.left, q.left)


end

# 46. Permutations
# Given a collection of distinct integers, return all possible permutations.
#
# Example:
#
# Input: [1,2,3]
# Output:
# [
#   [1,2,3],
#   [1,3,2],
#   [2,1,3],
#   [2,3,1],
#   [3,1,2],
#   [3,2,1]
# ]
# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
    return [[]] if nums.empty?
    to_add = nums[-1]
    prev = permute(nums[0...-1])
    res = []
    prev.each do |el|
        res.push(el+[to_add])
        el.length.times do |i|
           res.push(el[0...i] + [to_add] + el[i..-1])
        end
    end

    res.sort
end

# 242. Valid Anagram
# Given two strings s and t , write a function to determine if t is an anagram of s.
#
# Example 1:
#
# Input: s = "anagram", t = "nagaram"
# Output: true
# Example 2:
#
# Input: s = "rat", t = "car"
# Output: false
# Note:
# You may assume the string contains only lowercase alphabets.
#
# Follow up:
# What if the inputs contain unicode characters? How would you adapt your solution to such case?

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
    s.chars.sort == t.chars.sort
end

# 136. Single Number
# Given a non-empty array of integers, every element appears twice except for one. Find that single one.
#
# Note:
#
# Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
#
# Example 1:
#
# Input: [2,2,1]
# Output: 1
# Example 2:
#
# Input: [4,1,2,1,2]
# Output: 4
# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
    sorted = nums.sort
    i = 0
    while i < sorted.length
        return sorted[i] if sorted[i+1] != sorted[i]
        i += 2
    end
end

# 104. Maximum Depth of Binary Tree
# Given a binary tree, find its maximum depth.
#
# The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
#
# Note: A leaf is a node with no children.
#
# Example:
#
# Given binary tree [3,9,20,null,null,15,7],
#
#     3
#    / \
#   9  20
#     /  \
#    15   7
# return its depth = 3.
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
    return 0 if root.nil?
    return 1 if root.left.nil? && root.right.nil?
    left = max_depth(root.left)
    right = max_depth(root.right)
    return [left, right].max + 1
end

# 292. Nim Game
# You are playing the following Nim Game with your friend: There is a heap of stones on the table, each time one of you take turns to remove 1 to 3 stones. The one who removes the last stone will be the winner. You will take the first turn to remove the stones.
#
# Both of you are very clever and have optimal strategies for the game. Write a function to determine whether you can win the game given the number of stones in the heap.
#
# Example:
#
# Input: 4
# Output: false
# Explanation: If there are 4 stones in the heap, then you will never win the game;
#              No matter 1, 2, or 3 stones you remove, the last stone will always be
#              removed by your friend.
# @param {Integer} n
# @return {Boolean}
def can_win_nim(n)
   return false if n % 4 == 0

   true
end

# 226. Invert Binary Tree
# Invert a binary tree.
#
# Example:
#
# Input:
#
#      4
#    /   \
#   2     7
#  / \   / \
# 1   3 6   9
# Output:
#
#      4
#    /   \
#   7     2
#  / \   / \
# 9   6 3   1
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode}
def invert_tree(root)
    return nil if root.nil?
    return root if root.left.nil? && root.right.nil?
    node = TreeNode.new(root.val)
    node.right = invert_tree(root.left)
    node.left = invert_tree(root.right)

    node
end

# 260. Single Number III
# Given an array of numbers nums, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once.
#
# Example:
#
# Input:  [1,2,1,3,2,5]
# Output: [3,5]
# Note:
#
# The order of the result is not important. So in the above example, [5, 3] is also correct.
# Your algorithm should run in linear runtime complexity. Could you implement it using only constant space complexity?
# @param {Integer[]} nums
# @return {Integer[]}
def single_number(nums)
    hash = Hash.new{false}
    dup = []
    nums.each do |el|
        hash[el] ? dup.push(el) : hash[el] = true
    end

    nums - dup
end

# 258. Add Digits
# Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.
#
# Example:
#
# Input: 38
# Output: 2
# Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2.
#              Since 2 has only one digit, return it.
# Follow up:
# Could you do it without any loop/recursion in O(1) runtime?
# @param {Integer} num
# @return {Integer}
def add_digits(num)
  # this is recursive solution
  return num if num < 10
  return add_digits(num % 10 + num / 10)
end

# 283. Move Zeroes
# Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
#
# Example:
#
# Input: [0,1,0,3,12]
# Output: [1,3,12,0,0]
# Note:
#
# You must do this in-place without making a copy of the array.
# Minimize the total number of operations.
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  # this solution runtime is 1000ms => too slow
  # check = false
  # while check == false
  #     check = true
  #    nums.each_index do |i|
  #        next if i == nums.length - 1
  #       if nums[i] == 0 && nums[i+1] != 0
  #           check = false
  #           nums[i+1], nums[i] = nums[i], nums[i+1]
  #           next
  #       end
  #    end
  # end

  # this solution runtime is 48ms => faster
  count = nums.count{|x| x == 0}
  nums.delete(0)
  count.times do
    nums.push(0)
  end
end

# 171. Excel Sheet Column Number
# Given a column title as appear in an Excel sheet, return its corresponding column number.
#
# For example:
#
#     A -> 1
#     B -> 2
#     C -> 3
#     ...
#     Z -> 26
#     AA -> 27
#     AB -> 28
#     ...
# Example 1:
#
# Input: "A"
# Output: 1
# Example 2:
#
# Input: "AB"
# Output: 28
# Example 3:
#
# Input: "ZY"
# Output: 701
# @param {String} s
# @return {Integer}
def title_to_number(s)
#     this solution runtime is 52ms
#     alp = ('A'..'Z').to_a
#     hash = Hash.new
#     26.times do |i|
#        hash[alp[i]] = i+1
#     end

#     arr = s.chars.reverse
#     sum = 0
#     arr.each_with_index do |x,i|
#        sum += hash[x] * (26 ** i)
#     end

#     sum

#     this solution runtime improve to 40ms
    sum = 0
    s.chars.reverse.each_with_index do |x,i|
        sum += (x.ord - 64) * (26 ** i)
    end

    sum
end

# 169. Majority Element
# Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
#
# You may assume that the array is non-empty and the majority element always exist in the array.
#
# Example 1:
#
# Input: [3,2,3]
# Output: 3
# Example 2:
#
# Input: [2,2,1,1,1,2,2]
# Output: 2
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
    # solution before optimization
    # hash = Hash.new{0}
    # half = nums.length / 2.0
    # nums.each do |el|
    #    hash[el] += 1
    #     return el if hash[el] >= half
    # end

    # optimized solution
    nums.sort[nums.length / 2]
end

# 26. Remove Duplicates from Sorted Array
# Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.
#
# Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
#
# Example 1:
#
# Given nums = [1,1,2],
#
# Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.
#
# It doesn't matter what you leave beyond the returned length.
# Example 2:
#
# Given nums = [0,0,1,1,1,2,2,3,3,4],
#
# Your function should return length = 5, with the first five elements of nums being modified to 0, 1, 2, 3, and 4 respectively.
#
# It doesn't matter what values are set beyond the returned length.
# Clarification:
#
# Confused why the returned value is an integer but your answer is an array?
#
# Note that the input array is passed in by reference, which means modification to the input array will be known to the caller as well.
#
# Internally you can think of this:
#
# // nums is passed in by reference. (i.e., without making a copy)
# int len = removeDuplicates(nums);
#
# // any modification to nums in your function would be known by the caller.
# // using the length returned by your function, it prints the first len elements.
# for (int i = 0; i < len; i++) {
#     print(nums[i]);
# }
# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
    i = 0
    while i < nums.length
        break if nums.length == 1
        if nums[i-1] == nums[i]
            nums.delete_at(i)
        else
            i += 1
        end
    end
    return nums.length
end

# 66. Plus One
# Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
#
# The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
#
# You may assume the integer does not contain any leading zero, except the number 0 itself.
#
# Example 1:
#
# Input: [1,2,3]
# Output: [1,2,4]
# Explanation: The array represents the integer 123.
# Example 2:
#
# Input: [4,3,2,1]
# Output: [4,3,2,2]
# Explanation: The array represents the integer 4321.
# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
    (digits.join.to_i + 1).to_s.chars.map{|x| x.to_i}
end

# 118. Pascal's Triangle
# Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
# In Pascal's triangle, each number is the sum of the two numbers directly above it.
#
# Example:
#
# Input: 5
# Output:
# [
#      [1],
#     [1,1],
#    [1,2,1],
#   [1,3,3,1],
#  [1,4,6,4,1]
# ]
# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
    return [] if num_rows == 0
    return [[1]] if num_rows == 1
    return [[1],[1,1]] if num_rows == 2

    prev = generate(num_rows - 1)

    prev.push(create_new(prev[-1]))

    prev
end

def create_new(arr)
   new_arr = []
    arr.each_index do |i|
       break if i == arr.length - 1
        new_arr.push(arr[i] + arr[i+1])
    end

    new_arr.unshift(1).push(1)
end

# 215. Kth Largest Element in an Array
# Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.
#
# Example 1:
#
# Input: [3,2,1,5,6,4] and k = 2
# Output: 5
# Example 2:
#
# Input: [3,2,3,1,2,4,5,5,6] and k = 4
# Output: 4
# Note:
# You may assume k is always valid, 1 ≤ k ≤ array's length.
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
    sorted = nums.sort
    sorted[-k]
end

# 648. Replace Words
# In English, we have a concept called root, which can be followed by some other words to form another longer word - let's call this word successor. For example, the root an, followed by other, which can form another word another.
#
# Now, given a dictionary consisting of many roots and a sentence. You need to replace all the successor in the sentence with the root forming it. If a successor has many roots can form it, replace it with the root with the shortest length.
#
# You need to output the sentence after the replacement.
#
# Example 1:
# Input: dict = ["cat", "bat", "rat"]
# sentence = "the cattle was rattled by the battery"
# Output: "the cat was rat by the bat"
# Note:
# The input will only have lower-case letters.
# 1 <= dict words number <= 1000
# 1 <= sentence words number <= 1000
# 1 <= root length <= 100
# 1 <= sentence words length <= 1000
# @param {String[]} dict
# @param {String} sentence
# @return {String}
def replace_words(dict, sentence)
    arr = sentence.split(' ')
    arr.each_with_index do |el, i|
        dict.each do |x|
           if el[0...x.length] == x
               arr[i] = x
               break
           end
        end
    end

    arr.join(' ')
end

# 492. Construct the Rectangle
# For a web developer, it is very important to know how to design a web page's size. So, given a specific rectangular web page’s area, your job by now is to design a rectangular web page, whose length L and width W satisfy the following requirements:
#
# 1. The area of the rectangular web page you designed must equal to the given target area.
#
# 2. The width W should not be larger than the length L, which means L >= W.
#
# 3. The difference between length L and width W should be as small as possible.
# You need to output the length L and the width W of the web page you designed in sequence.
# Example:
# Input: 4
# Output: [2, 2]
# Explanation: The target area is 4, and all the possible ways to construct it are [1,4], [2,2], [4,1].
# But according to requirement 2, [1,4] is illegal; according to requirement 3,  [4,1] is not optimal compared to [2,2]. So the length L is 2, and the width W is 2.
# Note:
# The given area won't exceed 10,000,000 and is a positive integer
# The web page's width and length you designed must be positive integers.
# @param {Integer} area
# @return {Integer[]}
def construct_rectangle(area)
    arr = pairs(area)
    arr = arr.sort_by{|x| x[0]-x[1]}
    return arr[0]
end

def pairs(n)
   arr = []
    ((n**0.5).to_i.downto(1)).each do |el|
       arr.push([n/el, el]) if n % el == 0 && n/el >= el
    end

    arr
end

# 448. Find All Numbers Disappeared in an Array
# Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
#
# Find all the elements of [1, n] inclusive that do not appear in this array.
#
# Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
#
# Example:
#
# Input:
# [4,3,2,7,8,2,3,1]
#
# Output:
# [5,6]
# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
    l = nums.length

    (1..l).to_a - nums
end

# 453. Minimum Moves to Equal Array Elements
# Given a non-empty integer array of size n, find the minimum number of moves required to make all array elements equal, where a move is incrementing n - 1 elements by 1.
#
# Example:
#
# Input:
# [1,2,3]
#
# Output:
# 3
#
# Explanation:
# Only three moves are needed (remember each move increments two elements):
#
# [1,2,3]  =>  [2,3,3]  =>  [3,4,3]  =>  [4,4,4]
# @param {Integer[]} nums
# @return {Integer}
def min_moves(nums)
    big = nums.max
    small = nums.min
    return 0 if big == small
    big - small + 1
end

# 371. Sum of Two Integers
# Calculate the sum of two integers a and b, but you are not allowed to use the operator + and -.
#
# Example:
# Given a = 1 and b = 2, return 3.
# @param {Integer} a
# @param {Integer} b
# @return {Integer}
def get_sum(a, b)
    arr = [a,b]
    arr.sum
end

# 347. Top K Frequent Elements
# Given a non-empty array of integers, return the k most frequent elements.
#
# For example,
# Given [1,1,1,2,2,3] and k = 2, return [1,2].
#
# Note:
# You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
# Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
    hash = Hash.new(0)
    nums.each do |el|
        hash[el] += 1
    end
    hash.keys.sort_by{|x| -hash[x]}[0...k]
end

# 217. Contains Duplicate
# Given an array of integers, find if the array contains any duplicates.
#
# Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
#
# Example 1:
#
# Input: [1,2,3,1]
# Output: true
# Example 2:
#
# Input: [1,2,3,4]
# Output: false
# Example 3:
#
# Input: [1,1,1,3,3,4,3,2,4,2]
# Output: true
# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
    nums.uniq.length != nums.length
end

# 21. Merge Two Sorted Lists
# Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
#
# Example:
#
# Input: 1->2->4, 1->3->4
# Output: 1->1->2->3->4->4
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
def merge_two_lists(l1, l2)
    new_list = ListNode.new(nil)
    cur = new_list
    node1 = l1
    node2 = l2
    while node1 || node2
       if node1 && node2
          if node1.val > node2.val
              cur.val = node2.val
              node2 = node2.next
          else
              cur.val = node1.val
              node1 = node1.next
          end
       elsif node1
           cur.val = node1.val
           node1 = node1.next
       else
           cur.val = node2.val
           node2 = node2.next
       end

        if node1 || node2
           cur.next = ListNode.new(nil)
            cur = cur.next
        end
    end

    new_list
end

# 104. Maximum Depth of Binary Tree
# Given a binary tree, find its maximum depth.
#
# The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
#
# Note: A leaf is a node with no children.
#
# Example:
#
# Given binary tree [3,9,20,null,null,15,7],
#
#     3
#    / \
#   9  20
#     /  \
#    15   7
# return its depth = 3.
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
    return 0 if root.nil?
    return 1 if root.left.nil? && root.right.nil?
    left = max_depth(root.left)
    right = max_depth(root.right)
    return [left, right].max + 1
end

# 771. Jewels and Stones
# You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.
#
# The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".
#
# Example 1:
#
# Input: J = "aA", S = "aAAbbbb"
# Output: 3
# Example 2:
#
# Input: J = "z", S = "ZZ"
# Output: 0
# Note:
#
# S and J will consist of letters and have length at most 50.
# The characters in J are distinct.
# @param {String} j
# @param {String} s
# @return {Integer}
def num_jewels_in_stones(j, s)
    count = 0
    s.chars.each do | x |
        count += 1 if j.include?(x)
    end

    count
end

# 268. Missing Number
# Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.
#
# Example 1:
#
# Input: [3,0,1]
# Output: 2
# Example 2:
#
# Input: [9,6,4,2,3,5,7,0,1]
# Output: 8
# Note:
# Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?
# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
    sorted = nums.sort
    nums.length.times do |i|
        return i if sorted[i] != i
    end
end

#Create my quickSort
# @param {Interger[]} arr
# @return {Interger[]}
def my_quick_sort(arr)
  return arr if arr.length <= 1
  p = arr[0]
  left = []
  right = []
  arr[1..-1].each do |el|
    if el > p
      right.push(el)
    else
      left.push(el)
    end
  end

  return my_quick_sort(left) + [p] + my_quick_sort(right)
end
