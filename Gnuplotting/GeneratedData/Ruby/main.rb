require 'tempfile'

# frequency, Hz
F=5
# Sampling rate
SR=8000
# Seconds count
SECS=3
# Overall samples count
NSAMPLES=SR*SECS
# Sine wave coefficient
COEF=2*Math::PI*F

file = Tempfile.new("PlottingData")
path = file.path

begin
	for i in 0...NSAMPLES
		x = Float(i)/SR
		y = Math.sin(x*COEF)
		file.write(x.to_s+"\t"+y.to_s+"\n")
	end

	command = "../../plotter.gp "+path+" ./result"
	exec command 
ensure
	file.close
	file.unlink
end
