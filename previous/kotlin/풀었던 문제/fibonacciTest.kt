fun main(){

var fibonacciArr:MutableList<Int> = mutableListOf(0,1)

var testCase = readLine()!!.toInt()
var N:Int
while (testCase > 0) {
     N = readLine()!!.toInt()
     if (fibonacciArr[N] != null) {
         println(fibonacciArr[N])
     } else {
       for (i in 2..N) {
           fibonacciArr[i] = fibonacciArr[i - 1] + fibonacciArr[i - 2]
       }
       println(fibonacciArr[N])
     }
     testCase--
}
}
