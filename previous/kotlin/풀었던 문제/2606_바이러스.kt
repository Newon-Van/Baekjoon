import kotlin.collections.ArrayList

lateinit var linkedlist: Array<ArrayList<Int>>
lateinit var visit: BooleanArray
var virusedComputer = -1

fun dfs(start: Int){
    for(i in linkedlist[start]){
        if(!visit[i]){
            visit[i] = true
            virusedComputer++
            dfs(i)
        }
    }
}

fun main(){
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val N = br.readLine().toInt()
    val M = br.readLine().toInt()
    var input:Array<Int>

    linkedlist = Array(N + 1){ArrayList()}
    for(i in 1..M){
        input = br.readLine().split(" ").map{it.toInt()}.toTypedArray()
        linkedlist[input[0]].add(input[1])
        linkedlist[input[1]].add(input[0])
    }
    visit = BooleanArray(N + 1){ false }

    dfs(1)
    bw.write("$virusedComputer")
    bw.flush()
    bw.close()
}