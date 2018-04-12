> Little tools when I study on **Astrometry.net**

- `logtime.sh`   
  usage: 
  - `cmd 2>&1 | path/to/logtime.sh > path/to/with_time.log`  -- new log info every time
  - `cmd 2>&1 | path/to/logtime.sh >> path/to/with_time.log` -- all log info in one file
  
  example:
  ```
  2018-04-12_17:23:50.424280237 : Reading input file 1 of 1: "/home/pi/Documents/ji/0331-bin2.fit"...
  2018-04-12_17:23:51.225134421 : Extracting sources...
  2018-04-12_17:23:51.341994737 : Downsampling by 2...
  2018-04-12_17:24:13.945739778 : simplexy: found 854 sources.
  2018-04-12_17:24:15.313962534 : Solving...
  2018-04-12_17:24:15.395572638 : Reading file "/home/pi/Documents/ji/0331-bin2.axy"...
  2018-04-12_17:24:16.042318294 : log-odds ratio 36.625 (8.05472e+15), 13 match, 0 conflict, 31 distract
  2018-04-12_17:24:16.045068018 : RA,Dec = (101.91,5.92753), pixel scale 38.7149 arcsec/pix.
  2018-04-12_17:24:16.047777898 : Hit/miss: Hit/miss: ++++-+++--+---+-+--+-------+---------------+(best)
  2018-04-12_17:24:16.576985637 : Field 1: solved with index index-4118.fits.
  2018-04-12_17:24:16.612665640 : Field 1 solved: writing to file /home/pi/Documents/ji/0331-bin2.solved
  2018-04-12_17:24:16.757922305 : Field: /home/pi/Documents/ji/0331-bin2.fit
  2018-04-12_17:24:16.760613018 : Field center: (RA,Dec) = (101.954863, 5.972055) deg.
  2018-04-12_17:24:16.763551439 : Field center: (RA H:M:S, Dec D:M:S) = (06:47:49.167, +05:58:19.397).
  2018-04-12_17:24:16.766343715 : Field size: 26.18 x 17.5663 degrees
  2018-04-12_17:24:16.769205261 : Field rotation angle: up is 92.4531 degrees E of N
  2018-04-12_17:24:16.772111129 : Field parity: neg
  2018-04-12_17:24:16.775015227 : Creating new FITS file "/home/pi/Documents/ji/0331-bin2.new"...

  ```
