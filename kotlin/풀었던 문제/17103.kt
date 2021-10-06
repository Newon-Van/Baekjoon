import java.io.*

fun eratosSieve(eratos:IntArray):IntArray {
    for (i in 2..1000000) {
        for (j in i+i..1000000 step i) {
            eratos[j] = 0
        }
    }
    return eratos
}

fun main() {
    val br = System.`in`.bufferedReader()
    
    var eratos = IntArray(1000001) { i -> i }
    eratos = eratosSieve(eratos)
    var count = 0
    
    var T = br.readLine().toInt()
    while (T > 0) {
        var N = br.readLine().toInt()
        
        for (i in 2..N/2) {
            if (eratos[i] != 0) {
                if (eratos[N-i] != 0) {
                    count++
                }
            }
        }
        println(count)
        count = 0
        T--
    }
}
