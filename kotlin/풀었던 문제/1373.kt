import java.io.*

fun main() {
    val br = System.`in`.bufferedReader()
    
    val N = br.readLine().toString()
    var arr = LongArray(N.length)
    var result:Long = 0
   
    for (i in 0 .. N.length-1) {
        arr[i] = N.substring(N.length-1-i).toLong() /
    }

    for (o in 0..N.length-1) {
        println(arr[o])
    }
    

    var n = 1
    var m = 1
    var positionCheck = 0
    for (j in N.length-1 downTo 0) {
        if (positionCheck == 3) {
            positionCheck = 0
            n *= 10
            m = 1
        }
        result += arr[j] * m * n
        println("j = $j / result = $result")
        positionCheck++
        m *= 2
    }
    
    println(result)
}
