//import java.util.*
//import kotlin.collections.ArrayList
//
//val br = System.`in`.bufferedReader()
//val bw = System.`out`.bufferedWriter()
//
//
//fun bfs(linkedList: Array<ArrayList<Int>>, V: Int) {
//    var bfsTeam = BooleanArray(V + 1) { false }
//    var bfsVisit = BooleanArray(V + 1) { false }
//    var team = true
//    var queue: Queue<Int> = LinkedList()
//
//    for (i in 1..V) {
//        if (linkedList[i].isNotEmpty() && !bfsVisit[i]) {
//            queue.add(i)
//            bfsVisit[i] = true
//            bfsTeam[i] = team
//        }
//    }
//
//    while (queue.isNotEmpty()) {
//        var front = queue.poll()
//        team = !team
//
//        for (i in linkedList[front]) {
//            if (!bfsVisit[i]) {
//                bfsVisit[i] = true
//                bfsTeam[i] = team
//                queue.add(i)
//            } else if (bfsTeam[front] == bfsTeam[i]) {
//                bw.append("NO")
//                return
//            }
//        }
//    }
//    bw.append("YES")
//}
//
//fun solve(k: Int) {
//    var K = k
//
//    while (K-- > 0) {
//        var (V, E) = br.readLine().split(" ").map { it.toInt() }
//        var linkedList = Array(V + 1) { ArrayList<Int>() }
//
//        while (E-- > 0) {
//            var input = br.readLine().split(" ")
//            linkedList[input[0].toInt()].add(input[1].toInt())
//        }
//
//        bfs(linkedList, V)
//        if (K >= 1) bw.newLine()
//    }
//    bw.flush()
//    bw.close()
//}
//
//fun main() {
//    var K = br.readLine().toInt()
//    solve(K)
//}