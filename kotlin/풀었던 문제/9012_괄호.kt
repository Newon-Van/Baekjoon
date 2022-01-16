import java.util.*

fun main(){
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    var N = br.readLine().toInt()
    var inputs:String
    var stack = Stack<Char>()
    while(N-- > 0){
        inputs = br.readLine()

        for(i in inputs){
            if (i == '(' || stack.isEmpty())
                stack.add(i)
            else
                stack.pop()

            if (stack.isNotEmpty() && stack.peek() == ')')
                break
        }

        if (stack.isEmpty())
            bw.append("YES")
        else
            bw.append("NO")

        if (N > 0)
            bw.append("\n")
        stack.clear()
    }
    bw.flush()
    bw.close()
}