import java.util.*
import kotlin.math.max

data class Coordinate(val row: Int, val cul: Int)

lateinit var graph: Array<Array<Int>>

fun bfs(N: Int, M: Int, coordinate: Coordinate): Int {
    val queue: Queue<Coordinate> = LinkedList()
    val visit = Array(N) { Array(M) { false } }
    val directionArray = arrayOf(
        Coordinate(-1, 0),
        Coordinate(1, 0),
        Coordinate(0, -1),
        Coordinate(0, 1)
    )
    var now = coordinate
    var next: Coordinate
    var count = 1
    queue.add(coordinate)
    visit[now.row][now.cul] = true

    while (queue.isNotEmpty()) {
        now = queue.poll()

        for (direction in directionArray) {
            next = Coordinate(now.row + direction.row, now.cul + direction.cul)

            if (next.row < 0 || next.row >= N || next.cul < 0 || next.cul >= M)
                continue
            if (graph[next.row][next.cul] == 0 || visit[next.row][next.cul])
                continue
            queue.add(next)
            visit[next.row][next.cul] = true
            graph[next.row][next.cul] = 0
            count += 1
        }
    }

    return count
}

fun main() {
    val br = System.`in`.bufferedReader()

    val (N, M, K) = br.readLine().split(" ").map { it.toInt() }
    var tokenizer: StringTokenizer
    var result = 0

    graph = Array(N) { Array(M) { 0 } }
    repeat(K){
        tokenizer = StringTokenizer(br.readLine())
        graph[tokenizer.nextToken().toInt() - 1][tokenizer.nextToken().toInt() - 1] = -1
    }

    for (i in graph.indices) {
        for (j in graph[i].indices) {
            if (graph[i][j] == -1){
                graph[i][j] = 0
                result = max(bfs(N, M, Coordinate(i, j)), result)
            }
        }
    }

    print(result)
}