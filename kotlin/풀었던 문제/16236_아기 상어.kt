import java.util.*

data class Coordinate(var row:Int, var cul: Int)
lateinit var graph : Array<Array<Int>>
val direction = arrayOf(
    Coordinate(-1, 0),
    Coordinate(1, 0),
    Coordinate(0, -1),
    Coordinate(0, 1)
)
var sharkCondition = 2

fun bfs(N: Int, start: Coordinate){


}

fun main(){
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val N = br.readLine().toInt()
    graph = Array(N){ Array(N){ 0 } }

    for(i in 0 until N)
        graph[i] = br.readLine().split(" ").map{ it.toInt() }.toTypedArray()


}