# string = input()
# answer = []
# changePoint = -1
# isAngleBucket = False
#
# for index in range(0, len(string)):
#
#     if string[index] == '<':
#         isAngleBucket = True
#         answer.append(string[index])
#         continue
#     elif isAngleBucket == True and string[index] != '>':
#         answer.append(string[index])
#         continue
#     elif isAngleBucket == True and string[index] == '>':
#         answer.append(string[index])
#         isAngleBucket = False
#         continue
#
#     if isAngleBucket == False and string[index] != ' ' and string[index] != '<' and changePoint == -1:
#         changePoint = index
#     elif isAngleBucket == False and (index == len(string) - 1 or (index != len(string) - 1 and (string[index + 1] == '<' or string[index + 1] == ' '))):
#         for i in range(0, index - changePoint + 1):
#             answer.append(string[index - i])
#         changePoint = -1
#         if index != len(string) - 1 and string[index + 1] != '<':
#             answer.append(' ')
#
# for element in answer:
#     print(element, end='')