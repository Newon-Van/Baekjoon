//fun searchAndDelete(baskets: MutableList<Char>) {
//    if (baskets.isEmpty())
//        return
//
//    var targetBaskets:Char
//    while (true) {
//        targetBaskets = when (baskets.first()) {
//            '(' -> ')'
//            '[' -> ']'
//            else -> return
//        }
//
//        if (targetBaskets == baskets.last()){
//            baskets.removeFirst()
//            baskets.removeLast()
//        } else
//            return
//
//        if (baskets.isEmpty())
//            return
//    }
//}
//
//fun main() {
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    var inputs = br.readLine()
//    var baskets = mutableListOf<Char>()
//
//    while (inputs != ".") {
//        for (i in inputs) {
//            when (i) {
//                '(' -> baskets.add(i)
//                ')' -> {
//                    if (baskets.isNotEmpty() && baskets.last() == '(')
//                        baskets.removeLast()
//                    else
//                        baskets.add(i)
//                }
//                '[' -> baskets.add(i)
//                ']' -> {
//                    if (baskets.isNotEmpty() && baskets.last() == '[')
//                        baskets.removeLast()
//                    else
//                        baskets.add(i)
//                }
//            }
//        }
//
//        searchAndDelete(baskets)
//        if (baskets.isNotEmpty())
//            bw.append("no")
//        else
//            bw.append("yes")
//
//        inputs = br.readLine()
//        if (inputs != ".")
//            bw.append("\n")
//        baskets.clear()
//    }
//    bw.flush()
//    bw.close()
//}