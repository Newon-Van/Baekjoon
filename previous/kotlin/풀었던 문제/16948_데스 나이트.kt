//import java.util.*
//
//data class Coordinate(var row: Int, var cul: Int)
//lateinit var board:Array<Array<Int>>
//
//fun bfs(N: Int, r1: Int, c1: Int, r2: Int, c2: Int): Int{
//    var queue: Queue<Coordinate> = LinkedList()
//    var now: Coordinate
//    var next: Coordinate
//    var result = -1
//    val direction = arrayOf(
//        Coordinate(-2, -1),
//        Coordinate(-2, 1),
//        Coordinate(0, -2),
//        Coordinate(0, 2),
//        Coordinate(2, -1),
//        Coordinate(2, 1))
//    queue.add(Coordinate(r1,c1))
//
//    while(queue.isNotEmpty()){
//        now = queue.poll()
//
//        for(i in direction){
//            next = Coordinate(now.row + i.row, now.cul + i.cul)
//
//            if (next.row < 0 || next.row >= N || next.cul < 0 || next.cul >= N)
//                continue
//            if (board[next.row][next.cul] != 0)
//                continue
//            if (next.row == r2 && next.cul == c2){
//                result = board[now.row][now.cul] + 1
//                return result
//            }
//
//            queue.add(Coordinate(next.row, next.cul))
//            board[next.row][next.cul] = board[now.row][now.cul] + 1
//        }
//    }
//
//    return result
//}
//
//
//fun main(){
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    val N = br.readLine().toInt()
//    board = Array(N){ Array(N){0} }
//    val (r1,c1,r2,c2) = br.readLine().split(" ").map{it.toInt()}
//
//    bw.append("${bfs(N, r1, c1, r2, c2)}")
//    bw.flush()
//    bw.close()
//}