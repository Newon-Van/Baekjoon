//import java.util.*
//
//data class Result(var time: Int, var way:Int)
//var position = Array(100001){0}
//
//fun bfs(N: Int, K: Int):Result{
//    if(N == K)
//        return Result(0, 1)
//    var queue: Queue<Int> = LinkedList()
//    var direction:Array<Int>
//    var now:Int
//    var result = Result(0, 0)
//    queue.add(N)
//
//    while(queue.isNotEmpty()){
//        now = queue.poll()
//        direction = arrayOf(now - 1, now + 1, now * 2)
//
//        for (next in direction){
//            if (next < 0 || next > 100000)
//                continue
//            if (position[next] != 0 && position[next] < position[now] + 1)
//                continue
//            if (next == K && (position[next] == 0 || position[now] + 1 <= position[next])){
//                if (position[next] == 0)
//                    result = Result(position[now] + 1, 1)
//                else if (position[now] + 1 == position[next])
//                    result = Result(result.time, result.way + 1)
//                else if (position[now] + 1 < position[next])
//                    result = Result(position[now] + 1, 1)
//            }
//
//            queue.add(next)
//            position[next] = position[now] + 1
//        }
//    }
//
//    return result
//}
//
//fun main(){
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    val (N, K) = br.readLine().split(" ").map{it.toInt()}
//    var result = bfs(N,K)
//    bw.append("${result.time}\n${result.way}")
//    bw.flush()
//    bw.close()
//}