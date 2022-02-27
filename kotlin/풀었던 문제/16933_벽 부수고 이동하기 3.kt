lateinit var board: Array<Array<Int>>

data class Coordinate(val row: Int, val cul: Int, val chanceTimes: Int, val isNight: Boolean)

fun bfs(N: Int, M: Int, K: Int): Int {
    if (N == 1 && M == 1)
        return 1

    val queue = ArrayDeque<Coordinate>()
    var now: Coordinate
    var next: Coordinate
    var nextWall: Int
    var count = 1
    val directionArray = arrayOf(
        Coordinate(-1, 0, 0),
        Coordinate(1, 0, 0),
        Coordinate(0, -1, 0),
        Coordinate(0, 1, 0)
    )
    var visit = Array(N) { Array(M) { Array(12) { false } } }
    queue.add(Coordinate(0, 0, 0))
    visit[0][0][0] = true

    while (queue.isNotEmpty()) {
        count += 1

        repeat(queue.size) {
            now = queue.first()
            queue.removeFirst()

            for (direction in directionArray) {
                next = Coordinate(now.row + direction.row, now.cul + direction.cul, now.chanceTimes)

                if (next.row < 0 || next.row >= N || next.cul < 0 || next.cul >= M)
                    continue

                nextWall = board[next.row][next.cul]

                if ((nextWall == 0 && visit[next.row][next.cul][now.chanceTimes])
                    || (nextWall == 1 && visit[next.row][next.cul][now.chanceTimes + 1])
                )
                    continue

                if (nextWall == 1 && next.chanceTimes >= K)
                    continue

                if (next.row == N - 1 && next.cul == M - 1)
                    return count

                when (nextWall) {
                    1 -> {
                        queue.add(Coordinate(next.row, next.cul, next.chanceTimes + 1))
                        visit[next.row][next.cul][next.chanceTimes + 1] = true
                    }
                    0 -> {
                        queue.add(next)
                        visit[next.row][next.cul][next.chanceTimes] = true
                    }
                }
            }
        }
    }

    return -1
}

fun main() {
    val br = System.`in`.bufferedReader()

    val (N, M, K) = br.readLine().split(" ").map { it.toInt() }
    board = Array(N) { Array(M) { 0 } }
    for (i in 0 until N)
        board[i] = br.readLine().map { it.code - 48 }.toTypedArray()

    print(bfs(N, M, K))
}