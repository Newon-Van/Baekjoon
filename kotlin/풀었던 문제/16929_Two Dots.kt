data class Coordinate(var row: Int, var cul: Int, var move: Int)

lateinit var graph:Array<Array<Char>>
val direction = arrayOf(Coordinate(-1, 0, 1), Coordinate(1, 0, 1), Coordinate(0, -1, 1), Coordinate(0, 1, 1))
var startRow: Int = 0
var startCul: Int = 0
var result = "No"

fun dfs(N: Int, M: Int, state:Coordinate, theColor: Char) {
    if(state.move >= 4 && state.row == startRow && state.cul == startCul){
        result = "Yes"
        return
    }

    for(i in direction){
        val next:Coordinate = Coordinate(state.row + i.row, state.cul + i.cul, state.move + i.move )

        if(next.row < 0 || next.row >= N || next.cul < 0 || next.cul >= M || graph[next.row][next.cul] != theColor )
            continue

        var color = graph[next.row][next.cul]
        graph[next.row][next.cul] = '0'
        dfs(N, M, next, theColor)
        graph[next.row][next.cul] = color
    }
}

fun main(){
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val (N, M) = br.readLine().split(" ").map{ it.toInt() }
    graph = Array(N){ Array(M){ '0' } }

    for(i in 0 until N)
        graph[i] = br.readLine().map{ it }.toTypedArray()

    loop@ for(i in 0 until N){
        for(j in 0 until M){
            if(result == "Yes")
                break@loop
            startRow = i
            startCul = j
            var state = Coordinate(i, j, 0)
            dfs(N, M, state, graph[i][j])
        }
    }
    bw.append("$result")
    bw.flush()
    bw.close()
}