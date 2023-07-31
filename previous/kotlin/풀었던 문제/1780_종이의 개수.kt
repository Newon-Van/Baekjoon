var graph : Array<IntArray> = arrayOf()
var minusCount = 0
var zeroCount = 0
var plusCount = 0

fun check(row: Int, col: Int, n: Int):Boolean {
    var start = graph[row][col]

    for(i in row until row + n){
        for(j in col until col + n){
            if(start != graph[i][j]) return false
        }
    }
    return true
}

fun divide(row: Int, col: Int, n: Int){

    if (check(row, col, n)) {
        var start = graph[row][col]

        when(start){
            -1 -> minusCount++
            0 -> zeroCount++
            1 -> plusCount++
        }
    } else {
        var size = n / 3

        for (i in 0 until 3){
            for(j in 0 until 3){
                divide(row + size * i, col + size * j, size)
            }
        }
    }

}

fun main(){
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val N = br.readLine().toInt()

    graph = Array(N){ IntArray(N) }

    for(i in 0..graph.lastIndex){
        graph[i] = br.readLine().split(" ").map{ it.toInt() }.toIntArray()
    }

    divide(0, 0, N)

    bw.append("$minusCount\n")
    bw.append("$zeroCount\n")
    bw.append("$plusCount")
    bw.flush()
    bw.close()
}