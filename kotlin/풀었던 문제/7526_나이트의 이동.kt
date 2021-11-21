//import java.util.*
//
//data class Coordinate(val row: Int, val cul: Int)
//data class Graph(var visit: Boolean, var turn: Int)
//
//lateinit var graph: Array<Array<Graph>>
//
//fun bfs(I: Int, start: Coordinate, goal: Coordinate):Int {
//    val queue: Queue<Coordinate> = LinkedList()
//    val dir = arrayOf(
//        (Coordinate(-2, -1)),
//        (Coordinate(-1, -2)),
//        (Coordinate(1, -2)),
//        (Coordinate(2, -1)),
//        (Coordinate(-2, 1)),
//        (Coordinate(-1, 2)),
//        (Coordinate(1, 2)),
//        (Coordinate(2, 1))
//    )
//    var front: Coordinate
//
//    graph[start.row][start.cul].visit = true
//    queue.add(start)
//
//    while (queue.isNotEmpty()) {
//        front = queue.poll()
//
//        for(i in dir){
//            var next = Coordinate(front.row + i.row, front.cul + i.cul)
//
//            if(next.row < 0 || next.row >= I || next.cul < 0 || next.cul >= I || graph[next.row][next.cul].visit)
//                continue
//            if(goal.row == next.row && goal.cul == next.cul)
//                return graph[front.row][front.cul].turn + 1
//
//            graph[next.row][next.cul].visit = true
//            graph[next.row][next.cul].turn = graph[front.row][front.cul].turn + 1
//            queue.add(Coordinate(next.row, next.cul))
//        }
//    }
//    return 0
//}
//
//fun main() {
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//    lateinit var input: List<String>
//    lateinit var start: Coordinate
//    lateinit var goal: Coordinate
//
//    var testCase = br.readLine().toInt()
//    while (testCase-- > 0) {
//        var I = br.readLine().toInt()
//
//        graph = Array(I) { Array(I) { Graph(false, 0) } }
//        input = br.readLine().split(" ")
//        start = Coordinate(input[0].toInt(), input[1].toInt())
//        input = br.readLine().split(" ")
//        goal = Coordinate(input[0].toInt(), input[1].toInt())
//
//        bw.append("${bfs(I, start, goal)}")
//        if(testCase > 0)
//            bw.newLine()
//    }
//    bw.flush()
//    bw.close()
//}