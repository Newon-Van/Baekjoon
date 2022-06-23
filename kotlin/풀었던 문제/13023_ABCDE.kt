//lateinit var array : ArrayList<ArrayList<Int>>
//lateinit var visit : BooleanArray
//var check = 0
//
//fun dfs(node: Int, count: Int) {
//    if(check == 1)
//        return
//
//    if(count >= 4){
//        check = 1
//        return
//    }
//
//    for(i in array[node]){
//        if(!visit[i]){
//            visit[node] = true
//            dfs(i, count + 1)
//            visit[node] = false
//        }
//    }
//}
//
//fun main(){
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//
//    val (N, M) = br.readLine().split(" ").map{ it.toInt() }
//    array = arrayListOf()
//
//    for(i in 0 until N)
//        array.add(ArrayList())
//
//    visit = BooleanArray(N + 1){false}
//
//    for(i in 1..M){
//        var string = br.readLine().split(" ")
//        array[string[0].toInt()].add(string[1].toInt())
//        array[string[1].toInt()].add(string[0].toInt())
//    }
//
//    for(i in 0..array.lastIndex){
//        if(!visit[i]) dfs(i, 0)
//    }
//
//    bw.append("$check")
//    bw.flush()
//    bw.close()
//}