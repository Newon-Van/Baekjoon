import java.util.*
import kotlin.collections.ArrayList

val br = System.`in`.bufferedReader()
val bwDFS = System.`out`.bufferedWriter()
val bwBFS = System.`out`.bufferedWriter()

lateinit var graph: Array<ArrayList<Int>>
lateinit var bfsVisit : BooleanArray
lateinit var dfsVisit : BooleanArray


fun bfs(node: Int){
    bfsVisit[node] = true

    var queue: Queue<Int> = LinkedList()
    queue.add(node)

    while(!queue.isEmpty()){
        var front = queue.poll()

        if(front != null && front != node) bwBFS.append(" ")
        bwBFS.append("$front")

        for(i in graph[front]){
            if(!bfsVisit[i]){
                bfsVisit[i] = true
                queue.add(i)
            }
        }
    }

}

fun dfs(node: Int){
    dfsVisit[node] = true
    bwDFS.append("$node")

    for(i in graph[node]){
        if(!dfsVisit[i]){
            bwDFS.append(" ")
            dfs(i)
        }
    }
}

fun main(){
    val (N, M, V) = br.readLine().split(" ").map{ it.toInt() }

    graph = Array(N + 1){ arrayListOf() }

    for(i in 1..M){
        var string = br.readLine().split(" ")
        graph[string[0].toInt()].add(string[1].toInt())
        graph[string[0].toInt()].sort()
        graph[string[1].toInt()].add(string[0].toInt())
        graph[string[1].toInt()].sort()
    }

    bfsVisit = BooleanArray(N + 1){false}
    dfsVisit = BooleanArray(N + 1){false}

    dfs(V)
    bwDFS.newLine()
    bfs(V)

    bwDFS.flush()
    bwBFS.flush()
    bwDFS.close()
    bwBFS.close()
}