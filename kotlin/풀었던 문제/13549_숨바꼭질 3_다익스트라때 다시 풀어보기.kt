//import java.util.*
//
//var position = Array(100001){0}
//
//fun bfs(N: Int, K: Int):Int{
//    if(N == K)
//        return 0
//    var queue: Deque<Int> = LinkedList()
//    var result = -1
//    var now:Int
//    var direction:Array<Int>
//
//    queue.add(N)
//    while(queue.isNotEmpty()){
//        now = queue.poll()
//        direction = arrayOf(now - 1, now + 1, now * 2)
//
//        for(next in direction){
//            if (next < 0 || next > 100000 || next * 2 > 100000)
//                continue
//            if (position[next] != 0 && position[now] + 1 <= position[next])
//                continue
//            if (position[next] == K && (position[next] == 0 || position[next] < position[now] + 1))
//                result = position[now] + 1
//
//            if(next == direction[2]){
//                queue.addFirst(next)
//                position[next] = position[now]
//            } else {
//                queue.add(next)
//                position[next] = position[now] + 1
//            }
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
//    bw.append("${bfs(N, K)}")
//    bw.flush()
//    bw.close()
//}