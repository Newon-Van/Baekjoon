N, M = map(int, input().split())

array = [list(map(int, input().split())) for _ in range(2)]
result = []
for i in range(2):
    result += array[i]

result.sort()
for i in range(len(result)):
    print(result[i], end='')
    if i != len(result) - 1:
        print(' ', end='')