import java.util.*

data class Coordinate(val height: Int, val row: Int, val cul: Int, val time: Int)

lateinit var tomatoBox: Array<Array<Array<Int>>>

fun bfs(startList: MutableList<Coordinate>, size: Coordinate): Int {
    val queue: Queue<Coordinate> = LinkedList()
    var now: Coordinate
    var next: Coordinate
    var time = 0
    var checker = 0
    val directions = arrayOf(
        Coordinate(0, -1, 0, 1),
        Coordinate(0, 1, 0, 1),
        Coordinate(0, 0, -1, 1),
        Coordinate(0, 0, 1, 1),
        Coordinate(-1, 0, 0, 1),
        Coordinate(1, 0, 0, 1)
    )
    startList.forEach {
        queue.add(it)
    }

    while (queue.isNotEmpty()) {
        now = queue.poll()
        time = now.time

        for (direction in directions) {
            next = Coordinate(
                now.height + direction.height,
                now.row + direction.row,
                now.cul + direction.cul,
                now.time + direction.time
            )

            if (next.row < 0 || next.row >= size.row ||
                next.cul < 0 || next.cul >= size.cul ||
                next.height < 0 || next.height >= size.height
            ) continue

            if (tomatoBox[next.height][next.row][next.cul] != 0)
                continue

            queue.add(next)
            tomatoBox[next.height][next.row][next.cul] = 1
        }
    }

    for(height in 0 until size.height){
        for (row in 0 until size.row) {
            for (cul in 0 until size.cul) {
                if (tomatoBox[height][row][cul] == 0)
                    return -1
                if (tomatoBox[height][row][cul] == -1)
                    checker += 1
            }
        }
    }

    if(checker == size.row * size.cul * size.height)
        time = -1

    return time
}

fun main() {
    val br = System.`in`.bufferedReader()

    val (M, N, H) = br.readLine().split(" ").map { it.toInt() }
    val startList = mutableListOf<Coordinate>()
    // 높이 가로 세로
    tomatoBox = Array(H) { Array(N) { Array(M) { 0 } } }

    for (height in 0 until H) {
        for (row in 0 until N) {
            tomatoBox[height][row] = br.readLine().split(" ").map { it.toInt() }.toTypedArray()
            for (cul in 0 until M) {
                if (tomatoBox[height][row][cul] == 1)
                    startList.add(Coordinate(height, row, cul, 0))
            }
        }
    }

    print(bfs(startList, Coordinate(H, N, M, 0)))
}