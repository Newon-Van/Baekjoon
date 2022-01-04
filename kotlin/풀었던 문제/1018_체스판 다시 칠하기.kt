//lateinit var graph: Array<Array<Char>>
//
//fun solve(startRow:Int, startCul: Int, N: Int, M: Int, standard: Int): Int {
//    var countNow = 0
//
//    for(i in startRow..startRow + 7){
//        for(j in startCul..startCul + 6){
//            if (i >= N || j >= M)
//                return -2
//
//            if ((j + 1 < M && graph[i][j] == graph[i][j + 1]) || (i + 1 < N && i != startRow + 7 && graph[i][j] == graph[i + 1][j])){
//                countNow++
//
//            if (standard < countNow)
//                return -1
//        }
//    }
//
//    return countNow
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
//    var standard = 0
//    var temp: Int
//    var result = 64
//
//    for (i in 0 until N){
//        for (j in 0 until M){
//            temp = solve(i, j, N, M, standard)
//            if (temp == -1)
//                standard++
//            else if (temp < result && temp != -2)
//                result = temp
//        }
//    }
//    bw.append("$result")
//    bw.flush()
//    bw.close()
//}