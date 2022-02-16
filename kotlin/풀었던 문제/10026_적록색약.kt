import java.util.*

lateinit var board: Array<CharArray>
lateinit var visit: Array<Array<Boolean>>
lateinit var visitColorWeak: Array<Array<Boolean>>
val directionArray = arrayOf(
    Coordinate(-1, 0),
    Coordinate(1, 0),
    Coordinate(0, -1),
    Coordinate(0, 1),
)

data class Coordinate(val row: Int, val cul: Int)
data class Result(var common: Int, var colorWeak: Int)

fun bfs(start: Coordinate, startColor: Char, N: Int) {
    val queue: Queue<Coordinate> = LinkedList()
    var now: Coordinate
    var next: Coordinate

    queue.add(start)
    visit[start.row][start.cul] = true
    visitColorWeak[start.row][start.cul] = true

    while (queue.isNotEmpty()) {
        now = queue.poll()

        for (direction in directionArray) {
            next = Coordinate(now.row + direction.row, now.cul + direction.cul)

            if (next.row < 0 || next.row >= N || next.cul < 0 || next.cul >= N)
                continue

            // BFS 접근 2회차 때, startColor == board[now] 인데 visit 안했음에도 넘어가는건 방지
            if (visit[next.row][next.cul] || (startColor != board[next.row][next.cul] && visitColorWeak[next.row][next.cul]))
                continue

            // 서로 다를 때, 색약 대상이 아닌 B 라면 무조건 패스
            if (board[now.row][now.cul] != board[next.row][next.cul] && (board[now.row][now.cul] == 'B' || board[next.row][next.cul] == 'B'))
                continue

            // if -> 서로 다른데, 색약이라면
            // else if -> 서로 같은 색깔인데, 뛰어넘지 않았을 경우(visit 여부로 체크)
            if (board[now.row][now.cul] != board[next.row][next.cul] || (board[now.row][now.cul] == board[next.row][next.cul] && !visit[now.row][now.cul] && !visitColorWeak[next.row][next.cul])) {
                queue.add(next)
                visitColorWeak[next.row][next.cul] = true
            } else if (visit[now.row][now.cul] && board[now.row][now.cul] == board[next.row][next.cul]) {
                queue.add(next)
                visit[next.row][next.cul] = true
                visitColorWeak[next.row][next.cul] = true
            }
        }
    }
}

fun main() {
    val br = System.`in`.bufferedReader()

    val N = br.readLine().toInt()
    val result = Result(0, 0)

    board = Array(N) { CharArray(N) }
    for (i in 0 until N)
        board[i] = br.readLine().toCharArray()
    visit = Array(N) { Array(N) { false } }
    visitColorWeak = Array(N) { Array(N) { false } }

    for (i in 0 until N) {
        for (j in 0 until N) {
            // 동시에 방문체크를 할 경우 visitColorWeek 은 언제나 visit 보다 같거나 많은 true 를 갖는다.
            if (!visit[i][j] && !visitColorWeak[i][j]) {
                bfs(Coordinate(i, j), board[i][j], N)
                result.common += 1
                result.colorWeak += 1
            } else if (!visit[i][j] && visitColorWeak[i][j]) {
                bfs(Coordinate(i, j), board[i][j], N)
                result.common += 1
            }
        }
    }
    print("${result.common} ${result.colorWeak}")
}