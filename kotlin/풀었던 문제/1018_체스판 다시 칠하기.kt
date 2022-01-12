//import java.lang.Integer.min
//
//lateinit var graph: Array<Array<Char>>
//
//data class Coordinate(val row: Int, val cul: Int)
//
//fun solve(firstPosition: Coordinate, firstBoard: Char, N: Int, M: Int): Int {
//    var blackCount = 0
//    var whiteCount = 0
//
//    for (i in firstPosition.row..firstPosition.row + 7) {
//        for (j in firstPosition.cul..firstPosition.cul + 7) {
//            if (i >= N || j >= M)
//                return -1
//
//            if ((i + j) % 2 == 0 && graph[i][j] != firstBoard)
//                blackCount++
//            else if ((i + j) % 2 == 1 && graph[i][j] == firstBoard)
//                whiteCount++
//        }
//    }
//
//    return blackCount + whiteCount
//}
//
//fun main() {
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    val (N, M) = br.readLine().split(" ").map { it.toInt() }
//    graph = Array(N) { Array(M) { '0' } }
//    for (i in 0 until N)
//        graph[i] = br.readLine().toCharArray().toTypedArray()
//
//    var standard = 64
//    var temp: Int
//    for (i in 0 until N) {
//        for (j in 0 until M) {
//            temp = solve(Coordinate(i, j), graph[i][j], N, M)
//            temp = min(temp, 64 - temp)
//
//            if (temp != -1 && temp < standard)
//                standard = temp
//        }
//    }
//
//    bw.append("$standard")
//    bw.flush()
//    bw.close()
//}