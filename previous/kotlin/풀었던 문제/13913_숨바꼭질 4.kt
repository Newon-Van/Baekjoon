//import java.util.*
//import kotlin.collections.ArrayList
//
//data class Position(var time:Int, var previousPosition:Int)
//var position = Array(100001){ Position(0, 0) }
//var resultTime = 0
//var resultTraces = ArrayList<Int>()
//
//fun bfs(N: Int, K: Int){
//
//    if(N == K){
//        resultTime = 0
//        return
//    }
//
//    var queue:Queue<Int> = LinkedList()
//    var now:Int
//    var direction:Array<Int>
//    var history = ArrayList<Int>()
//    queue.add(N)
//
//    while(queue.isNotEmpty()){
//        now = queue.poll()
//        history.add(now)
//        direction = arrayOf(now - 1, now + 1, now * 2)
//
//        for (next in direction){
//            if (next < 0 || next > 100000)
//                continue
//            if (position[next].previousPosition != 0 || position[next].time != 0 && position[next].time < position[now].time + 1)
//                continue
//            if (next == K && (position[next].time == 0 || position[now].time + 1 < position[next].time)){
//                resultTime = position[now].time + 1
//                position[next].previousPosition = now
//
//                var trace = next
//                while(trace != N){
//                    resultTraces.add(trace)
//                    trace = position[trace].previousPosition
//                }
//                return
//            }
//
//            queue.add(next)
//            position[next].time = position[now].time + 1
//            position[next].previousPosition = now
//        }
//    }
//
//}
//
//fun main(){
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    val (N, K) = br.readLine().split(" ").map{it.toInt()}
//
//    bfs(N, K)
//    bw.append("$resultTime\n")
//    bw.append("$N ")
//    for (i in resultTraces.lastIndex downTo 0){
//        bw.append("${resultTraces[i]}")
//        if(i != 0)
//            bw.append(" ")
//    }
//    bw.flush()
//    bw.close()
//}