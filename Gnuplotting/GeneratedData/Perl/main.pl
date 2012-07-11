use Math::Trig;
use IO::File;
use POSIX qw(tmpnam);

# frequency, Hz
use constant F => 5;
# Sampling rate
use constant SR => 8000;
# Seconds count
use constant SECS => 3;
# Overall samples count
use constant NSAMPLES => SECS*SR;
# Sine wave coefficient
use constant COEF => 2*pi*F;

do {$fpath = tmpnam();}
	until $fh = IO::File->new($fpath, O_RDWR|O_CREAT|O_EXCL);

for (0 .. NSAMPLES-1) {
	$x = $_/SR;
	print $fh $x . " " . sin($x*COEF) ."\n";
}

close ($fh);
system("../../plotter.gp " . $fpath . " ./result");

END { unlink($fpath) or die "Couldn't unlink $fpath : $!"; }
