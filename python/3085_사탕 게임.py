from dataclasses import dataclass

@dataclass
class Coordinate:
    row: int
    cul: int
    
    def __post_init__(self):
        row = self.row
        cul = self.cul


def searching():
    temp = 1
    global count
    for standard in range(N):
        for checkCul in range(N - 1):
            if board[standard][checkCul] == board[standard][checkCul + 1]:
                temp += 1
            else:
                temp = 1

            if count < temp:
                count = temp

        temp = 1

        for checkRow in range(N - 1):
            if board[checkRow][standard] == board[checkRow + 1][standard]:
                temp += 1
            else:
                temp = 1

            if count < temp:
                count = temp

        temp = 1


def changing(color):
    for i in range(4):
        nextMove = Coordinate(now.row + direction[i].row, now.cul + direction[i].cul)
        if nextMove.row < 0 or nextMove.row >= N or nextMove.cul < 0 or nextMove.cul >= N:
            continue
        elif color == board[nextMove.row][nextMove.cul]:
            continue
        board[now.row][now.cul] = board[nextMove.row][nextMove.cul]
        board[nextMove.row][nextMove.cul] = color
        searching()
        board[nextMove.row][nextMove.cul] = board[now.row][now.cul]
        board[now.row][now.cul] = color


N = int(input())
board = [list(list(input())) for _ in range(N)]

direction = [Coordinate(-1, 0), Coordinate(1, 0), Coordinate(0, -1), Coordinate(0, 1)]
count = 0
now = Coordinate(0, 0)

while True:
    changing(board[now.row][now.cul])

    now.cul += 1
    if now.cul == N:
        now.row += 1
        now.cul = 0
    if now.row == N:
        break


print(count, end='')