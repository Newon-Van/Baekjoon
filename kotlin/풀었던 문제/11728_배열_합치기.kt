//lateinit var A:List<Int>
//lateinit var B:List<Int>
//
//fun main(){
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    val (N, M) = br.readLine().split(" ").map{ it.toInt() }
//    A = br.readLine().split(" ").map{ it.toInt() }
//    B = br.readLine().split(" ").map{ it.toInt() }
//
//    for(i in (A+B).sorted()){
//        bw.append("$i")
//        if(i <= (A+B).last()){
//            bw.append(" ")
//        }
//    }
//    bw.flush()
//    bw.close()
//}