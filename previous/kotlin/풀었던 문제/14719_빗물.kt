fun binarySearch(wallDepth: Array<Int>, start: Int): Int {
    var lowIndex = start
    var highIndex = wallDepth.lastIndex
    var midIndex = (lowIndex + highIndex) / 2

    while (lowIndex <= highIndex) {
        midIndex = (lowIndex + highIndex) / 2

        when {
            wallDepth[midIndex] > wallDepth[start] -> highIndex = midIndex - 1
            wallDepth[midIndex] < wallDepth[start] -> lowIndex = midIndex + 1
            wallDepth[midIndex] == wallDepth[start] -> return midIndex
        }
    }

    return midIndex
}

fun solve(W: Int, H: Int, wallDepth: Array<Int>) {
    var startIndex = 0
    var endIndex = binarySearch(wallDepth, startIndex)
    var rainCounter = 0

    while (startIndex < endIndex) {
        for (i in startIndex + 1 until endIndex) {
            rainCounter += (wallDepth[startIndex] - wallDepth[i])
        }

        startIndex = endIndex
        endIndex = binarySearch(wallDepth, startIndex)
    }
    println(rainCounter)
}

fun main() {
    val br = System.`in`.bufferedReader()

    val (H, W) = br.readLine().split(" ").map { it.toInt() }
    val wallDepth = br.readLine().split(" ").map { it.toInt() }.toTypedArray()
    solve(W, H, wallDepth)
}