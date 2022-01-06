import java.util.*

data class Coordinate(val row:Int, val cul:Int)
lateinit var graph:Array<Coordinate>

fun main(){
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val N = br.readLine().toInt()
    var inputs:StringTokenizer
    graph = Array(N) { Coordinate(0, 0) }
    for(i in 0 until N){
        inputs = StringTokenizer(br.readLine(), " ")
        graph[i] = Coordinate(inputs.nextToken().toInt(), inputs.nextToken().toInt())
    }

    graph = graph.sortedWith(compareBy(Coordinate::row).thenComparing(Coordinate::cul)).toTypedArray()
    for(i in graph.indices){
        bw.append("${graph[i].row} ${graph[i].cul}")
        if (i != N - 1)
            bw.append("\n")
    }
    bw.flush()
    bw.close()
}