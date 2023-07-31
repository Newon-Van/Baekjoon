//import java.util.*
//
//lateinit var graph: Array<Array<Int>>
//lateinit var visit: BooleanArray
//
//fun clear(N: Int){
//    for(i in 0 until N){
//        visit[i] = false
//    }
//}
//
//fun bfs(N: Int, start: Int, goal: Int): Int{
//    clear(N)
//
//    var queue: Queue<Int> = LinkedList()
//    var now: Int
//
//    queue.add(start)
//    visit[start] = true
//
//    while(queue.isNotEmpty()){
//        now = queue.poll()
//
//        for(i in 0 until N){
//            if(graph[now][i] == 1 && i == goal)
//                return 1
//            if(visit[i] || graph[now][i] == 0)
//                continue
//
//            visit[i] = true
//            queue.add(i)
//        }
//    }
//    return 0
//}
//
//fun main(){
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//    var input: Array<Int>
//
//    val N = br.readLine().toInt()
//
//    graph = Array(N){ Array(N){ 0 } }
//    for(i in 0 until N){
//        graph[i] = br.readLine().split(" ").map{it.toInt()}.toTypedArray()
//    }
//    visit = BooleanArray(N)
//
//
//    for(i in 0 until N){
//        for(j in 0 until N){
//            bw.write("${bfs(N, i, j)}")
//            if(j != N -1)
//                bw.write(" ")
//        }
//        if(i != N - 1)
//            bw.newLine()
//    }
//    bw.flush()
//    bw.close()
//}