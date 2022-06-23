import kotlin.math.pow

fun solve(N: Int, r: Int, c: Int): Int{
    if(N == 0) return 0

    val half = 2.toDouble().pow(N - 1).toInt()

    when{
        r < half && c < half -> return solve(N - 1, r, c)
        r < half && c >= half -> return half * half + solve(N - 1, r, c - half)
        r >= half && c < half -> return half * half * 2 + solve(N - 1, r - half, c)
        else -> return half * half * 3 + solve(N - 1, r - half, c - half)
    }
}

fun main(){
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val (N, r, c) = br.readLine().split(" ").map{ it.toInt() }
    bw.append("${solve(N, r, c)}")
    bw.flush()
    bw.close()
}