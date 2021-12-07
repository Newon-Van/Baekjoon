//import java.util.*
//import kotlin.collections.ArrayList
//
//data class Coordinate(var row: Int, var cul: Int)
//
//lateinit var graph: Array<Array<Int>>
//lateinit var copyOfGraph: Array<Array<Int>>
//
//val direction = arrayOf(
//    Coordinate(-1, 0),
//    Coordinate(1, 0),
//    Coordinate(0, -1),
//    Coordinate(0, 1)
//)
//var safezone = 0
//var copySafeZone = 0
//
//fun copyToGraph(N: Int, M: Int) {
//    for (i in 0 until N) {
//        for (j in 0 until M) {
//            graph[i][j] = copyOfGraph[i][j]
//        }
//    }
//}
//
//fun graphToCopy(N: Int, M: Int) {
//    for (i in 0 until N) {
//        for (j in 0 until M) {
//            copyOfGraph[i][j] = graph[i][j]
//        }
//    }
//}
//
//fun bfs(N: Int, M: Int, virusZone: ArrayList<Coordinate>) {
//    var queue: Queue<Coordinate> = LinkedList()
//    var now: Coordinate
//    var next: Coordinate
//    for (i in 0..virusZone.lastIndex) {
//        queue.add(virusZone[i])
//    }
//
//    while (queue.isNotEmpty()) {
//        now = queue.poll()
//
//        for (i in 0..direction.lastIndex) {
//            next = Coordinate(now.row + direction[i].row, now.cul + direction[i].cul)
//
//            if (next.row < 0 || next.row >= N || next.cul < 0 || next.cul >= M)
//                continue
//            if (copyOfGraph[next.row][next.cul] != 0)
//                continue
//
//            copyOfGraph[next.row][next.cul] = 2
//            queue.add(next)
//        }
//    }
//
//    for (i in 0 until N) {
//        for (j in 0 until M) {
//            if (copyOfGraph[i][j] == 0)
//                copySafeZone++
//        }
//    }
//}
//
//fun dfs(N: Int, M: Int, virusZone: ArrayList<Coordinate>, count: Int) {
//    if (count == 3) {
//        copyToGraph(N, M)
//        copySafeZone = 0
//        bfs(N, M, virusZone)
//        graphToCopy(N, M)
//
//        if (safezone < copySafeZone)
//            safezone = copySafeZone
//
//        return
//    }
//
//    for (i in 0 until N) {
//        for (j in 0 until M) {
//            if (copyOfGraph[i][j] == 0) {
//                copyOfGraph[i][j] = 1
//                dfs(N, M, virusZone, count + 1)
//                copyOfGraph[i][j] = 0
//            }
//        }
//    }
//}
//
//fun solve(N: Int, M: Int) {
//    val virusZone = ArrayList<Coordinate>()
//
//    for (i in 0 until N) {
//        for (j in 0 until M) {
//            if (graph[i][j] == 2)
//                virusZone.add(Coordinate(i, j))
//        }
//    }
//
//    graphToCopy(N, M)
//    dfs(N, M, virusZone, 0)
//}
//
//fun main() {
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    val (N, M) = br.readLine().split(" ").map { it.toInt() }
//
//    graph = Array(N) { Array(M) { 0 } }
//    for (i in 0 until N) {
//        graph[i] = br.readLine().split(" ").map { it.toInt() }.toTypedArray()
//    }
//    copyOfGraph = Array(N) { Array(M) { 0 } }
//
//    solve(N, M)
//    bw.write("$safezone")
//    bw.flush()
//    bw.close()
//}