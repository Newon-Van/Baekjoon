import java.util.*

data class Coordinate(var row: Int, var cul: Int, var canChance: Boolean, var time: Int)
data class Visit(var normalVisit: Boolean, var chancedVisit: Boolean)

lateinit var graph: Array<Array<Int>>
val directionArray = arrayOf(
    Coordinate(-1, 0, true, 1),
    Coordinate(1, 0, true, 1),
    Coordinate(0, -1, true, 1),
    Coordinate(0, 1, true, 1)
)

fun bfs(N: Int, M: Int): Int {
    if (N == 1 && M == 1)
        return 1
    val queue: Queue<Coordinate> = LinkedList()
    var visit = Array(N) { Array(M) { Visit(normalVisit = false, chancedVisit = false) } }
    var now: Coordinate
    var next: Coordinate
    var nextGraph: Int
    queue.add(Coordinate(0, 0, true, 1))
    visit[0][0] = Visit(normalVisit = true, chancedVisit = true)

    while (queue.isNotEmpty()) {
        now = queue.poll()

        for (direction in directionArray) {
            next = Coordinate(
                now.row + direction.row, now.cul + direction.cul,
                now.canChance, now.time + direction.time
            )

            // 범위 넘어가면 컷
            if (next.row < 0 || next.row >= N || next.cul < 0 || next.cul >= M)
                continue

            // 도착하면 return
            if (next.row == N - 1 && next.cul == M - 1)
                return now.time + 1

            nextGraph = graph[next.row][next.cul]

            // 벽이 아닌데 능력써서도 방문해보고, 능력 안쓰고도 방문 해봤다면 컷
            // 2번 오는거 어떻게 처리?
            if (nextGraph == 0 && (visit[next.row][next.cul].normalVisit && visit[next.row][next.cul].chancedVisit))
                continue

            // 벽인데 방문해봤거나, 벽을 뿌술 능력이 없다면 컷
            if (nextGraph == 1 && (visit[next.row][next.cul].chancedVisit || !next.canChance))
                continue

            when {
                nextGraph == 1 && next.canChance -> {
                    next.canChance = false
                    queue.add(next)
                    visit[next.row][next.cul] =
                        Visit(normalVisit = visit[next.row][next.cul].normalVisit, chancedVisit = true)
                }
                nextGraph == 0 && next.canChance && !visit[next.row][next.cul].normalVisit -> {
                    queue.add(next)
                    visit[next.row][next.cul] =
                        Visit(normalVisit = true, chancedVisit = visit[next.row][next.cul].chancedVisit)
                }
                nextGraph == 0 && !next.canChance && !visit[next.row][next.cul].chancedVisit -> {
                    queue.add(next)
                    visit[next.row][next.cul] =
                        Visit(normalVisit = visit[next.row][next.cul].normalVisit, chancedVisit = true)
                }
            }
        }
    }

    return -1
}

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val (N, M) = br.readLine().split(" ").map { it.toInt() }
    graph = Array(N) { Array(M) { 0 } }
    for (i in 0 until N)
        graph[i] = br.readLine().map { it.code - 48 }.toTypedArray()

    bw.append("${bfs(N, M)}")
    bw.flush()
    bw.close()
}