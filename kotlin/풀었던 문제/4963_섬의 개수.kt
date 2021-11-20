//lateinit var graph: Array<Array<Int>>
//
//fun dfs(row: Int, col: Int, w: Int, h: Int){
//    graph[row][col] = 0
//    val dir:Array<Pair<Int, Int>> = arrayOf(Pair(-1, 0), Pair(1, 0), Pair(0, -1), Pair(0, 1),
//        Pair(-1, -1), Pair(1, 1), Pair(-1, 1), Pair(1, -1))
//
//    for(i in 0..7){
//        var nextRow = row + dir[i].first
//        var nextCol = col + dir[i].second
//
//        if(nextRow < 0 || nextRow >= h || nextCol < 0 || nextCol >= w)
//            continue
//        if(graph[nextRow][nextCol] == 0)
//            continue
//
//        dfs(nextRow, nextCol, w, h)
//    }
//}
//
//fun main(){
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    var first = true
//    while(true){
//        val (w, h) = br.readLine().split(" ").map{ it.toInt() }
//        if(w == 0 && h == 0)
//            break
//
//        if(!first) bw.newLine()
//        var count = 0
//
//        graph = Array(h){ Array(w){0} }
//        for(i in 0 until h)
//            graph[i] = br.readLine().split(" ").map{ it.toInt() }.toTypedArray()
//
//        for(i in 0 until h){
//            for(j in 0 until w){
//                if(graph[i][j] == 1){
//                    graph[i][j] = 0
//                    count++
//                    dfs(i, j, w, h)
//                }
//            }
//        }
//        first = false
//        bw.append("$count")
//    }
//    bw.flush()
//    bw.close()
//}