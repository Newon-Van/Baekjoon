import java.io.*
import java.util.*

fun Gcd(a:Int, b:Int):Int {
    var r = a % b
    if (r == 0){
        return b
    } else {
        return Gcd(b, r)
    }
}

fun main(){
    val br = System.`in`.bufferedReader()
    val (N, S) = br.readLine().split(' ').map { it.toInt() }
    val arr = IntArray(N + 1)
    val stringToken = StringTokenizer(br.readLine())

    var value = 0
    var temp = 0
    var i = 0
    while(i in 0..N){
        if(stringToken.hasMoreTokens()){
            value = stringToken.nextToken().toInt()
        }
        
        if (value > S) {
            arr[i] = value
            continue
        } else if (value < S) {
            arr[i] = value
            continue
        } else if (temp != 0) {
            arr[i] = temp
            temp = 0
        }
        if (value > S && arr[i - 1] < S && i != 0) {
            arr[i] = S
            temp = value
        }
    }
    
    var d = Gcd(arr[0], arr[1])
    for (i in 1..N-1) {
        if (d < Gcd(arr[i], arr[i + 1])) {
            d = Gcd(arr[i], arr[i + 1])
        }
    }
    println(d)
}
