import java.util.*
lateinit var graph: Array<Array<Pair<Int, Int>>>

fun bfs(N: Int, M: Int): Int{
    val queue:Queue<Pair<Int, Int>> = LinkedList()
    val direction: Array<Pair<Int, Int>> = arrayOf(Pair(-1, 0), Pair(1, 0), Pair(0, -1), Pair(0, 1))
    lateinit var front:Pair<Int, Int>

    queue.add(Pair(0, 0))
    graph[0][0] = Pair(0, 1)

    while(queue.isNotEmpty()){
        front = queue.poll()

        for(i in 0..3){
            var nextRow = front.first + direction[i].first
            var nextCol = front.second + direction[i].second

            if(nextRow < 0 || nextRow >= N || nextCol < 0 || nextCol >= M || graph[nextRow][nextCol].first == 0)
                continue
            graph[nextRow][nextCol] = Pair(0, graph[front.first][front.second].second + 1)
            queue.add(Pair(nextRow, nextCol))
        }
    }
    return graph[N-1][M-1].second
}

fun main(){
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val (N, M) = br.readLine().split(" ").map{ it.toInt() }
    graph = Array(N){ Array(M){ Pair(0,0) } }
    for(i in 0 until N){
        var input = br.readLine()
        for(j in 0 until M){
            graph[i][j]= Pair(input[j] - '0', 0)
        }
    }

    bw.append("${bfs(N, M)}")
    bw.flush()
    bw.close()
}