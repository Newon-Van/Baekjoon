fun main(){
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    var inputs:CharArray = br.readLine().toString().toCharArray()
    var result = "yes"

    while (inputs[0] != '0'){
        for(i in inputs.indices){
            if (inputs[i] != inputs[inputs.size - 1 - i])
                result = "no"
        }
        bw.append(result)
        result = "yes"
        inputs = br.readLine().toString().toCharArray()
        if(inputs[0] != '0')
            bw.append("\n")
    }

    bw.flush()
    bw.close()
}