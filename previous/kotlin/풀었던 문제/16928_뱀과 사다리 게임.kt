//import java.util.*
//
//data class Graph(val spot:Int, var ladderTo:Int, var turn:Int)
//
//lateinit var graph:Array<Graph>
//
//fun bfs(){
//    var queue:Queue<Int> = LinkedList()
//    var now: Int
//    var next: Int
//    var diceMove = Array(6){i -> i + 1}
//
//    queue.add(1)
//
//    while(queue.isNotEmpty()){
//        now = queue.poll()
//
//        for (i in diceMove){
//            next = now + i
//
//            if (next > 100 || graph[next].ladderTo > 100)
//                continue
//            if (graph[next].turn != 0 || graph[graph[next].ladderTo].turn != 0)
//                continue
//            if (next == 100 || graph[next].ladderTo == 100){
//                graph[100].turn += graph[now].turn + 1
//                return
//            }
//
//            if (graph[next].ladderTo == 0){
//                queue.add(next)
//                graph[next].turn = graph[now].turn + 1
//            } else {
//                graph[next].turn = graph[now].turn + 1
//                queue.add(graph[next].ladderTo)
//                graph[graph[next].ladderTo].turn = graph[now].turn + 1
//            }
//
//        }
//    }
//}
//
//fun main(){
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    val (N, M) = br.readLine().split(" ").map{it.toInt()}
//    graph = Array(101){ i -> Graph(i + 1, 0, 0) }
//
//    for (i in 1..N + M){
//        var (spot, move) = br.readLine().split(" ").map{it.toInt()}
//        graph[spot].ladderTo = move
//    }
//
//    bfs()
//    bw.append("${graph[100].turn}")
//    bw.flush()
//    bw.close()
//}