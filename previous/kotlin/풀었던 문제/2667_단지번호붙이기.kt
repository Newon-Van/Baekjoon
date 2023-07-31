import java.util.*

lateinit var graph: Array<Array<Int>>
lateinit var visit: Array<BooleanArray>
var count = 0

fun bfs(N: Int, row: Int, col: Int): Int {
    count++
    var queue: Queue<Pair<Int, Int>> = LinkedList()
    var dir: Array<Pair<Int, Int>> = arrayOf(Pair(-1, 0), Pair(1, 0), Pair(0, -1), Pair(0, 1))
    var numberHouse = 0

    visit[row][col] = true
    numberHouse++
    queue.add(Pair(row, col))

    while (queue.isNotEmpty()) {
        var front = queue.poll()

        for (i in 0..dir.lastIndex) {

            var nextRow = front.first + dir[i].first
            var nextCol = front.second + dir[i].second
            if (nextRow < 0 || nextRow >= N || nextCol < 0 || nextCol >= N)
                continue
            if (graph[nextRow][nextCol] == 0 || visit[nextRow][nextCol])
                continue

            queue.add(Pair(nextRow, nextCol))
            visit[nextRow][nextCol] = true
            numberHouse++
        }
    }

    return numberHouse
}

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val N = br.readLine().toInt()
    graph = Array(N) { Array(N) { 0 } }
    visit = Array(N + 1) { BooleanArray(N) }
    var result: ArrayList<Int> = arrayListOf()

    for (i in 0 until N) {
        graph[i] = br.readLine().map { it.code - 48 }.toTypedArray()
    }

    for (i in 0 until N) {
        for (j in 0 until N) {
            if (graph[i][j] == 1 && !visit[i][j]) {
                result.add(bfs(N, i, j))
            }
        }
    }
    result.sort()

    bw.append("$count")
    bw.newLine()
    for (i in 0..result.lastIndex){
        bw.append("${result[i]}")
        if(i != result.lastIndex)
            bw.newLine()
    }
    bw.flush()
    bw.close()
}