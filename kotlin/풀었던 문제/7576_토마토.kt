//import java.util.*
//
//data class Coordinate(val row:Int, val cul:Int)
//data class Graph(var map: Int, var time: Int)
//lateinit var graph: Array<Array<Graph>>
//
//fun bfs(N: Int, M: Int):Int{
//    val queue:Queue<Coordinate> = LinkedList()
//    val direction = arrayOf( Coordinate(-1, 0), Coordinate(1, 0), Coordinate(0, -1), Coordinate(0, 1) )
//    lateinit var front:Coordinate
//
//    for(i in 0 until N){
//        for(j in 0 until M){
//            if(graph[i][j].map == 1)
//                queue.add(Coordinate(i, j))
//        }
//    }
//
//    while(queue.isNotEmpty()){
//        front = queue.poll()
//
//        for(i in 0..direction.lastIndex){
//            var next = Coordinate(front.row + direction[i].row, front.cul + direction[i].cul)
//
//            if(next.row < 0 || next.row >= N || next.cul < 0 || next.cul >= M || graph[next.row][next.cul].map == 1 || graph[next.row][next.cul].map == -1)
//                continue
//            graph[next.row][next.cul] = Graph(1, graph[front.row][front.cul].time + 1)
//            queue.add(Coordinate(next.row, next.cul))
//        }
//    }
//
//    for(i in 0 until N){
//        for(j in 0 until M){
//            if(graph[i][j].map == 0)
//                return -1
//        }
//    }
//    return graph[front.row][front.cul].time
//}
//
//fun main(){
//    val br = System.`in`.bufferedReader()
//    val bw = System.out.bufferedWriter()
//
//    val (M, N) = br.readLine().split(" ").map{it.toInt()}
//    graph = Array(N){ Array(M){Graph(0, 0)} }
//
//    for(i in 0 until N)
//        graph[i] = br.readLine().split(" ").map{ (Graph(it.toInt(), 0)) }.toTypedArray()
//
//    bw.append("${bfs(N, M)}")
//    bw.flush()
//    bw.close()
//}