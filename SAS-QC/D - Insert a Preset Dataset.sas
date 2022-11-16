data Preset;
    input Solvent RTemp Press Time Source;
    datalines;
 20 350 10 5 4
 20 150 10 4 3
 25 150 30 3 3
 25 250 10 5 3
 ;
 proc optex data=Candidate seed=12345;
    class Source;
    model Source Solvent|RTemp|Press|Time@2
          RTemp*RTemp Press*Press Time*Time;
    generate n=25 augment=preset;
    output out=Reactor2;
 run;