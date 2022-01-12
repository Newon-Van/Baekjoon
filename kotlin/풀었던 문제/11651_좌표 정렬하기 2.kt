import java.util.*

data class Coordinate(val row: Int, val cul: Int)
lateinit var coordinate: Array<Coordinate>

fun main(){
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val N = br.readLine().toInt()
    var inputs: StringTokenizer
    coordinate = Array(N){Coordinate(0, 0)}

    for(i in coordinate.indices){
        inputs = StringTokenizer(br.readLine(), " ")
        coordinate[i] = Coordinate(inputs.nextToken().toInt(), inputs.nextToken().toInt())
    }

    coordinate.sortWith(compareBy(Coordinate::cul).thenComparing(Coordinate::row))
    for(i in coordinate.indices){
        bw.append("${coordinate[i].row} ${coordinate[i].cul}")
        if (i != N - 1)
            bw.append("\n")
    }
    bw.flush()
    bw.close()
}