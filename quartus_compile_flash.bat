@ECHO OFF
\Quartus\quartus\bin64\quartus_sh.exe --flow compile PingPong
\Quartus\quartus\bin64\quartus_pgm.exe -c 1 output_files/Chain.cdf
:End