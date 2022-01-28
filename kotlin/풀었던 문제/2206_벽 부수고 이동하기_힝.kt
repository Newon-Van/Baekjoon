import java.util.*

data class Graph(var map: Int, var position: Int)
data class Coordinate(var row: Int, var cul: Int, var breakChance: Boolean)
data class Visit(var normalVisit: Boolean, var chanceVisit: Boolean)

lateinit var graph: Array<Array<Graph>>
val directionArray = arrayOf(
    Coordinate(-1, 0, true),
    Coordinate(1, 0, true),
    Coordinate(0, -1, true),
    Coordinate(0, 1, true)
)

fun bfs(N: Int, M: Int): Int {
    if (N == 1 && M == 1)
        return 1
    var queue: Queue<Coordinate> = LinkedList()
    var now: Coordinate
    var next: Coordinate
    var visit = Array(N) { Array(M) { Visit(false, false) } }
    queue.add(Coordinate(0, 0, true))
    graph[0][0].position = 1
    visit[0][0].normalVisit = true
    visit[0][0].chanceVisit = true

    while (queue.isNotEmpty()) {
        now = queue.poll()

        for (direction in directionArray) {
            next = Coordinate(now.row + direction.row, now.cul + direction.cul, now.breakChance)

            if (next.row < 0 || next.row >= N || next.cul < 0 || next.cul >= M) // 벗어났어요??
                continue

            if (graph[next.row][next.cul].map == 1 && (visit[next.row][next.cul].chanceVisit || !now.breakChance)) // 벽인데 부숴서 온 적 있거나 부술 기회 있나요??
                continue

            if (graph[next.row][next.cul].map == 0 && visit[next.row][next.cul].normalVisit && visit[next.row][next.cul].chanceVisit) // 벽 아닌데, 그냥으로도 부숴서도 온 적 있음?
                continue

            if (next.row == N - 1 && next.cul == M - 1)  // 정답인가요?
                return graph[now.row][now.cul].position + 1


            if (graph[next.row][next.cul].map == 1) {           // 벽이면, 벽부술 찬스 없애고 chancevisit 에 true 방문처리 핸들
                next.breakChance = false
                visit[next.row][next.cul].chanceVisit = true
            } else if (graph[next.row][next.cul].map == 0 && now.breakChance)  // 벽이 아닌데, 찬스 아직 안 썻으면 normalVisit 로 방문철;
                visit[next.row][next.cul].normalVisit = true
            else if (graph[next.row][next.cul].map == 0 && !now.breakChance) // 벽이 아닌데, 찬스 썻으면 chanveVisit 로 방문처리
                visit[next.row][next.cul].chanceVisit = true

            queue.add(next)
            graph[next.row][next.cul].position = graph[now.row][now.cul].position + 1
        }
    }
    return -1
}

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val (N, M) = br.readLine().split(" ").map { it.toInt() }
    graph = Array(N) { Array(M) { Graph(0, 0) } }
    for (i in 0 until N)
        graph[i] = br.readLine().map { Graph(it.code - 48, 0) }.toTypedArray()

    val result = bfs(N, M)
    bw.append("$result")
    bw.flush()
    bw.close()
}