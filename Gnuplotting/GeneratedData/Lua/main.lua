-- frequency, Hz
f = 5
-- Sampling rate
sr = 8000
-- Seconds count
secs = 3
-- Overall samples count
nsamples = sr*secs
-- Sine wave coefficient
coef = 2*math.pi*f

filename = os.tmpname()
fh = assert(io.open(filename, 'w'))

for i = 0, nsamples-1 do
	x = i/sr
	y = math.sin(x*coef)
	fh:write(x .. " " .. y .. "\n")
end

fh:close()

os.execute("../../plotter.gp " .. filename .. " ./result")
