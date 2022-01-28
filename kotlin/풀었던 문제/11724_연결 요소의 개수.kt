//import java.util.*
//
//import java.util.*
//import kotlin.collections.ArrayList
//
//lateinit var linkedlist: Array<ArrayList<Int>>
//lateinit var bfsVisit: BooleanArray
//
//fun bfs(node: Int){
//    bfsVisit[node] = true
//
//    var queue: Queue<Int> = LinkedList()
//    queue.add(node)
//
//    while(!queue.isEmpty()){
//        var front = queue.poll()
//
//        for(i in linkedlist[front]){
//            if(!bfsVisit[i]){
//                bfsVisit[i] = true
//                queue.add(i)
//            }
//        }
//    }
//
//}
//
//fun main(){
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    val (N, M) = br.readLine().split(" ").map{ it.toInt() }
//    linkedlist = Array(N + 1){ arrayListOf()}
//    bfsVisit = BooleanArray(N + 1){ false }
//    var count = 0
//
//    for(i in 1..M) {
//        var string = br.readLine().split(" ")
//        linkedlist[string[0].toInt()].add(string[1].toInt())
//        linkedlist[string[0].toInt()].sort()
//        linkedlist[string[1].toInt()].add(string[0].toInt())
//        linkedlist[string[1].toInt()].sort()
//    }
//
//    for(i in 1..N){
//        if(!bfsVisit[i]){
//            bfs(i)
//            count++
//        }
//    }
//
//    bw.append("$count")
//    bw.flush()
//    bw.close()
//}
//
// ---------------------- 위는 linkedlist / 밑에는 배열로
//
//lateinit var graph : Array<Array<Int>>
//lateinit var bfsVisit : BooleanArray
//
//fun bfs(node: Int, N: Int){
//    bfsVisit[node] = true
//
//    var queue: Queue<Int> = LinkedList()
//    queue.add(node)
//
//    while(!queue.isEmpty()){
//        var front = queue.poll()
//
//        for(i in 1..N){
//            if(graph[front][i] == 1 && !bfsVisit[i]){
//                bfsVisit[i] = true
//                queue.add(i)
//            }
//        }
//    }
//}
//
//fun main(){
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    val (N, M) = br.readLine().split(" ").map{ it.toInt() }
//    graph = Array(N + 1){ Array(N + 1){0} }
//    bfsVisit = BooleanArray(N + 1)
//    var count = 0
//
//    for(i in 1..M){
//        var string = br.readLine().split(" ")
//        graph[string[0].toInt()][string[1].toInt()] = 1
//        graph[string[1].toInt()][string[0].toInt()] = 1
//    }
//
//    for(i in 1..N){
//        if(!bfsVisit[i]){
//            bfs(i, N)
//            count++
//        }
//    }
//
//    bw.append("$count")
//    bw.flush()
//    bw.close()
//}