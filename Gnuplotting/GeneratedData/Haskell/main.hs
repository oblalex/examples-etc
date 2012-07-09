import System.IO
import System.Directory(getTemporaryDirectory, removeFile)
import System.IO.Error(catch)
import Control.Exception(finally)
import System.Process
import System.Exit

-- frequency, Hz
f = 5
-- Sampling rate
sr = 8000
-- Seconds count
secs = 3
-- Overall samples count
nsamples = sr*secs
-- Sine wave coefficient
coef = 2*pi*f
-- Time domain
td = [fromIntegral x / fromIntegral sr | x <- [0..nsamples-1]]
-- Waveform
wf = [sin (x*coef) | x <- td]
-- Calculated data
plottingData = zip td wf

main :: IO ()
main = 
    do tempdir <- catch (getTemporaryDirectory) (\_ -> return ".")
       (temppath, temph) <- openTempFile tempdir "plottingData"
       finally (sequence_ [hPutStrLn temph $ (show x)++" "++(show y) | (x,y) <- plottingData]) 
               (do hClose temph
	           ExitSuccess <- system $ "../../plotter.gp "++temppath++" ./result"
	           removeFile temppath)
