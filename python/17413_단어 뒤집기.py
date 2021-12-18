string = list(input())
string.append('')
answer = []
changePoint = -1
isAngleBucket = False

for index in range(0, len(string)):

    if string[index] == '<':
        isAngleBucket = True
        answer.append(string[index])
        continue
    elif isAngleBucket == True and string[index] != '>':
        answer.append(string[index])
        continue
    elif isAngleBucket == True and string[index] == '>':
        answer.append(string[index])
        if index != len(string) - 1 and string[index + 1] == ' ':
            answer.append(' ')
        isAngleBucket = False
        continue

    if isAngleBucket == False and string[index] != '<' and string[index] != ' ' and changePoint == -1:
        changePoint = index
        if index != len(string) - 1 and (string[index + 1] == ' ' or string[index + 1] == '<'):
            answer.append(string[index])
            if string[index + 1] == ' ':
                answer.append(' ')
            changePoint = -1
    elif isAngleBucket == False and (index == len(string) - 1 or (index != len(string) - 1 and (string[index + 1] == '<' or string[index + 1] == ' '))):
        for i in range(0, index - changePoint + 1):
            answer.append(string[index - i])
        if index != len(string) - 1 and string[index + 1] != '<':
            answer.append(' ')
        changePoint = -1


for element in answer:
    print(element, end='')