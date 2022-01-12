//fun solve(N: Int):Int{
//    var count = 0
//    var syom = 665
//    var temp: Int
//
//    while(count != N){
//        syom++
//        temp = syom
//        while (temp >= 666){
//            if (temp % 1000 == 666){
//                count++
//                break
//            }
//            else
//                temp /= 10
//        }
//    }
//    return syom
//}
//
//fun main(){
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    val N = br.readLine().toInt()
//    bw.append("${solve(N)}")
//    bw.flush()
//    bw.close()
//}