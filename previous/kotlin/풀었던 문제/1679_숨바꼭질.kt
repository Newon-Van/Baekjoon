import java.util.*

var position = Array<Int>(100002){0}
lateinit var direction: Array<Int>

fun bfs(N: Int, K: Int): Int{
    if (N == K)
        return 0
    var queue: Queue<Int> = LinkedList()
    var now: Int
    var result = -1
    queue.add(N)
    position[N] = 0

    while(queue.isNotEmpty()){
        now = queue.poll()
        direction = arrayOf(now - 1, now + 1, now * 2)

        for (next in direction){
            if (next < 0 || next > 100000)
                continue
            if (position[next] != 0 && position[next] <= position[now] + 1)
                continue
            if (next == K && (position[next] == 0 || position[now] + 1 < position[next])){
                result = position[now] + 1
            }
            queue.add(next)
            position[next] = position[now] + 1
        }
    }

    return result
}


fun main(){
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val (N, K) = br.readLine().split(" ").map{it.toInt()}
    bw.append("${bfs(N, K)}")
    bw.flush()
    bw.close()
}