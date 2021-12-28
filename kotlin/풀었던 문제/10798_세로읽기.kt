//lateinit var input: Array<String>
//
//fun main(){
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    input = Array(5){ "" }
//    for(i in 0..4){
//        input[i] = br.readLine()
//    }
//
//    var i = 0
//    for(cul in 0..14){
//        for(row in 0..4){
//            if(cul <= input[row].lastIndex  && input[row][cul].toString() != "")
//                bw.append("${input[row][cul]}")
//        }
//        i++
//    }
//
//    bw.flush()
//    bw.close()
//}