import math._
import java.io._

object Main {

        // frequency, Hz
        val F = 5
        // Sampling rate
        val SR = 8000
        // Seconds count
        val SECS = 3
        // Overall samples count
        val NSAMPLES = SR*SECS
        // Sine wave coefficient
        val COEF = 2*Pi*F

        def main(args: Array[String]) {

                val f = File.createTempFile("plottingData", "")
                f.deleteOnExit()

                val writer = new PrintWriter(f)

                for(i <- 0 until NSAMPLES) {
                        var x = (i).toDouble/SR
                        var y = sin(x*COEF)                        
                        writer.write(x.toString+'\t'+y.toString+'\n')
                }
                
                writer.close()
                Runtime.getRuntime().exec("../../plotter.gp "+f.getAbsolutePath()+" ./result");
        }
}
