import java.util.*

data class Coordinate(var row: Int, var cul: Int)
data class Graph(var map: Int, var time: Int)
lateinit var graph:Array<Array<Graph>>
val direction = arrayOf(
    Coordinate(-1, 0),
    Coordinate(1, 0),
    Coordinate(0, -1),
    Coordinate(0, 1)
    )

fun clearTime(N: Int){
    for(i in 0 until N){
        for(j in 0 until N){
            graph[i][j].time = 0
        }
    }
}

fun bfs(start: Coordinate, size: Int, N: Int):Coordinate{
    clearTime(N)

    var queue: Queue<Coordinate> = LinkedList()
    var target = Coordinate(N, N)
    var sharkSize = size

    queue.add(start)

    while(queue.isNotEmpty()){
        var now = queue.poll()

        for(i in 0..direction.lastIndex){
            var next = Coordinate(now.row + direction[i].row, now.cul + direction[i].cul)

            if(next.row < 0 || next.row >= N || next.cul < 0 || next.cul >= N)
                continue
            if(graph[next.row][next.cul].time > 0 || graph[next.row][next.cul].map > sharkSize) // sharkSize 에 의해 시작하는 지점을 밟지 않게된다. 참고로 N의 최대 크기는 20 -> 420개를 먹어야 사이즈 10 이 되는데, 최대 먹이수가 399개여서 넘지 못한다.
                continue
            if(graph[next.row][next.cul].map < sharkSize &&
                graph[next.row][next.cul].map != 0 &&
                graph[next.row][next.cul].time <= graph[now.row][now.cul].time &&
                next.row < target.row && next.cul < target.cul ) {
                target = next
            }
            graph[next.row][next.cul].time = graph[now.row][now.cul].time + 1
            queue.add(next)
        }
    }

    for(i in 0 until N){
        for(j in 0 until N){
            if(target.row == i && target.cul == j)
                print("${graph[i][j].time}* ")
            else
                print("${graph[i][j].time} ")
        }
        println()
    }

    return target
}

fun main(){
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val N = br.readLine().toInt()
    graph = Array(N){ Array(N){ Graph(0, 0) } }

    for(i in 0 until N){
        graph[i] = br.readLine().split(" ").map { Graph(it.toInt(), 0) }.toTypedArray()
    }


    var startPoint = Coordinate(0, 0)
    loop@ for(i in 0 until N){
        for(j in 0 until N){
            if(graph[i][j].map == 9){
                startPoint = Coordinate(i, j)
                break@loop
            }
        }
    }
    var size = 2
    var time = 0
    var eatenNumber = 0

    while(true){
        var target = bfs(startPoint, size, N)

        if(target.row == N && target.cul == N){
            bw.append("$time")
            bw.flush()
            bw.close()
            return
        }

        graph[target.row][target.cul].map = 0
        time += graph[target.row][target.cul].time
        startPoint = target
        eatenNumber++
        if(eatenNumber == size){
            size++
            eatenNumber = 0
        }
        println()
    }
}