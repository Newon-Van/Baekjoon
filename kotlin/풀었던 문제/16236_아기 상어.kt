import java.util.*

data class Graph(var map: Int, var visit:Boolean, var time:Int)
data class Coordinate(var row:Int, var cul: Int)
lateinit var graph: Array<Array<Graph>>
val direction = arrayOf(Coordinate(-1, 0), Coordinate(1, 0), Coordinate(0, -1), Coordinate(0, 1))

fun clear(N: Int){
    for(i in 0 until N){
        for(j in 0 until N){
            graph[i][j].time = 0
            graph[i][j].visit = false
        }
    }
}

fun bfs(N: Int, start: Coordinate, size: Int): Coordinate{
    clear(N)

    var queue: Queue<Coordinate> = LinkedList()
    var now: Coordinate
    var next: Coordinate = start
    var targets: Queue<Coordinate> = LinkedList()
    var result = start

    queue.add(start)
    graph[start.row][start.cul].visit = true

    while(queue.isNotEmpty()){

        now = queue.poll()

        if(targets.isNotEmpty() && graph[targets.peek().row][targets.peek().cul].time <= graph[now.row][now.cul].time)
            break

        for(i in 0..direction.lastIndex){
            next = Coordinate(now.row + direction[i].row, now.cul + direction[i].cul)

            if(next.row < 0 || next.row >= N || next.cul < 0 || next.cul >= N)
                continue
            if(graph[next.row][next.cul].visit || graph[next.row][next.cul].map > size)
                continue
            if(graph[next.row][next.cul].map in 1 until size){
                targets.add(next)
                result = next
                graph[next.row][next.cul].visit = true
                graph[next.row][next.cul].time = graph[now.row][now.cul].time + 1
                queue.add(next)
            }

            queue.add(next)
            graph[next.row][next.cul].time = graph[now.row][now.cul].time + 1
            graph[next.row][next.cul].visit = true
        }
    }

    for(i in targets){
        if(i.row < result.row)
            result = i
        else if (i.row < result.row && i.cul < result.cul)
            result = i
        else if (i.row == result.row && i.cul < result.cul)
            result = i
    }

    return result
}

fun solve(N: Int, Start: Coordinate):Int{
    var size = 2
    var eatenTimes = 0
    var survivingTimes = 0
    var target: Coordinate
    var start = Start

    while(true){
        target = bfs(N, start, size)

        if(target == start)
            return survivingTimes

        eatenTimes++
        if(eatenTimes == size){
            size++
            eatenTimes = 0
        }
        graph[start.row][start.cul].map = 0
        graph[target.row][target.cul].map = 9
        start = target
        survivingTimes += graph[target.row][target.cul].time
    }
}

fun main(){
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val N = br.readLine().toInt()
    var start = Coordinate(N, N)
    graph = Array(N){ Array(N){Graph(0, false, 0)} }

    for(i in 0 until N)
        graph[i] = br.readLine().split(" ").map{ Graph(it.toInt(), false, 0) }.toTypedArray()


    loop@for(i in 0 until N){
        for(j in 0 until N){
            if(graph[i][j].map == 9){
                start = Coordinate(i, j)
                break@loop
            }
        }
    }

    bw.write("${solve(N, start)}")
    bw.flush()
    bw.close()
}