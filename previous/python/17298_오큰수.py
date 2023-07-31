n = int(input())
values = list(map(int, input().split()))
answer = [-1] * n
stack = []

stack.append(0)
for i in range(1, n):
    while stack and values[stack[-1]] < values[i]:
        answer[stack.pop()] = values[i]
    stack.append(i)

print(*answer, end='')