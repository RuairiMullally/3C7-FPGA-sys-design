# File saved with Nlview 7.8.0 2024-04-26 e1825d835c VDI=44 GEI=38 GUI=JA:21.0 threadsafe
# 
# non-default properties - (restore without -noprops)
property -colorscheme classic
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 18
property maxzoom 7.5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #0095ff
property objecthighlight4 #8000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlaycolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 4
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 18
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 1
property timelimit 1
#
module new MINI_ALU work:MINI_ALU:NOFILE -nosplit
load symbol b6_ripple_adder work:abstract:NOFILE HIERBOX pin c_out output.right pin overflow output.right pin sel input.left pinBus sum output.right [5:0] pinBus x input.left [5:0] pinBus y input.left [5:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol mux8x1 work:mux8x1:NOFILE HIERBOX pinBus X output.right [5:0] pinBus fxn input.left [2:0] pinBus in0 input.left [5:0] pinBus in1 input.left [5:0] pinBus in2 input.left [5:0] pinBus in3 input.left [5:0] pinBus in4 input.left [5:0] pinBus in5 input.left [5:0] pinBus in6 input.left [5:0] pinBus in7 input.left [5:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol gteq8 work:gteq8:NOFILE HIERBOX pin agteqb output.right pinBus a input.left [7:0] pinBus b input.left [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol FullAdder work:abstract:NOFILE HIERBOX pin a input.left pin b input.left pin cin input.left pin cout output.right pin s output.right boxcolor 1 fillcolor 2 minwidth 13%
load symbol b6xnor work:b6xnor:NOFILE HIERBOX pinBus A input.left [5:0] pinBus B input.left [5:0] pinBus out output.right [5:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol b6_ripple_adder work:b6_ripple_adder:NOFILE HIERBOX pin c_out output.right pin overflow output.right pin sel input.left pinBus sum output.right [5:0] pinBus x input.left [5:0] pinBus y input.left [5:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_MUX work MUX pinBus I0 input.left [5:0] pinBus I1 input.left [5:0] pinBus I2 input.left [5:0] pinBus I3 input.left [5:0] pinBus I4 input.left [5:0] pinBus I5 input.left [5:0] pinBus I6 input.left [5:0] pinBus I7 input.left [5:0] pinBus O output.right [5:0] pinBus S input.bot [2:0] fillcolor 1
load portBus A input [5:0] -attr @name A[5:0] -pg 1 -lvl 0 -x 0 -y 70
load portBus B input [5:0] -attr @name B[5:0] -pg 1 -lvl 0 -x 0 -y 100
load portBus X output [5:0] -attr @name X[5:0] -pg 1 -lvl 4 -x 1130 -y 250
load portBus fxn input [2:0] -attr @name fxn[2:0] -pg 1 -lvl 0 -x 0 -y 170
load inst AaddB b6_ripple_adder work:abstract:NOFILE -autohide -attr @cell(#000000) b6_ripple_adder -pinAttr c_out @attr n/c -pinAttr overflow @attr n/c -pinBusAttr sum @name sum[5:0] -pinBusAttr x @name x[5:0] -pinBusAttr y @name y[5:0] -pg 1 -lvl 2 -x 380 -y 410
load inst AsubB b6_ripple_adder work:abstract:NOFILE -autohide -attr @cell(#000000) b6_ripple_adder -pinAttr c_out @attr n/c -pinAttr overflow @attr n/c -pinBusAttr sum @name sum[5:0] -pinBusAttr x @name x[5:0] -pinBusAttr y @name y[5:0] -pg 1 -lvl 2 -x 380 -y 570
load inst MUX8x1 mux8x1 work:mux8x1:NOFILE -autohide -attr @cell(#000000) mux8x1 -attr @fillcolor #fafafa -pinBusAttr X @name X[5:0] -pinBusAttr fxn @name fxn[2:0] -pinBusAttr in0 @name in0[5:0] -pinBusAttr in1 @name in1[5:0] -pinBusAttr in2 @name in2[5:0] -pinBusAttr in3 @name in3[5:0] -pinBusAttr in4 @name in4[5:0] -pinBusAttr in5 @name in5[5:0] -pinBusAttr in6 @name in6[5:0] -pinBusAttr in7 @name in7[5:0] -pg 1 -lvl 3 -x 760 -y 168
load inst agteqb gteq8 work:gteq8:NOFILE -autohide -attr @cell(#000000) gteq8 -pinBusAttr a @name a[7:0] -pinBusAttr b @name b[7:0] -pg 1 -lvl 1 -x 130 -y 60
load inst altb FullAdder work:abstract:NOFILE -autohide -attr @cell(#000000) FullAdder -pinAttr cout @attr n/c -pg 1 -lvl 2 -x 380 -y 60
load inst axnorb b6xnor work:b6xnor:NOFILE -autohide -attr @cell(#000000) b6xnor -pinBusAttr A @name A[5:0] -pinBusAttr B @name B[5:0] -pinBusAttr out @name out[5:0] -pg 1 -lvl 2 -x 380 -y 700
load inst invertA b6_ripple_adder work:b6_ripple_adder:NOFILE -autohide -attr @cell(#000000) b6_ripple_adder -pinAttr c_out @attr n/c -pinAttr overflow @attr n/c -pinBusAttr sum @name sum[5:0] -pinBusAttr x @name x[5:0] -pinBusAttr y @name y[5:0] -pg 1 -lvl 2 -x 380 -y 280
load inst invertB b6_ripple_adder work:abstract:NOFILE -autohide -attr @cell(#000000) b6_ripple_adder -pinAttr c_out @attr n/c -pinAttr overflow @attr n/c -pinBusAttr sum @name sum[5:0] -pinBusAttr x @name x[5:0] -pinBusAttr y @name y[5:0] -pg 1 -lvl 2 -x 380 -y 820
load inst MUX8x1|X_i RTL_MUX work -hier MUX8x1 -attr @cell(#000000) RTL_MUX -attr @name X_i -pinBusAttr I0 @name I0[5:0] -pinBusAttr I0 @attr S=3'b000 -pinBusAttr I1 @name I1[5:0] -pinBusAttr I1 @attr S=3'b001 -pinBusAttr I2 @name I2[5:0] -pinBusAttr I2 @attr S=3'b010 -pinBusAttr I3 @name I3[5:0] -pinBusAttr I3 @attr S=3'b011 -pinBusAttr I4 @name I4[5:0] -pinBusAttr I4 @attr S=3'b100 -pinBusAttr I5 @name I5[5:0] -pinBusAttr I5 @attr S=3'b101 -pinBusAttr I6 @name I6[5:0] -pinBusAttr I6 @attr S=3'b110 -pinBusAttr I7 @name I7[5:0] -pinBusAttr I7 @attr S=3'b111 -pinBusAttr O @name O[5:0] -pinBusAttr S @name S[2:0] -pg 1 -lvl 1 -x 910 -y 258
load net <const0> -ground -pin AaddB sel -pin MUX8x1 in4[5] -pin MUX8x1 in4[4] -pin MUX8x1 in4[3] -pin MUX8x1 in4[2] -pin MUX8x1 in4[1] -pin agteqb a[1] -pin agteqb a[0] -pin agteqb b[1] -pin agteqb b[0] -pin altb cin -pin invertA x[5] -pin invertA x[4] -pin invertA x[3] -pin invertA x[2] -pin invertA x[1] -pin invertA x[0] -pin invertB x[5] -pin invertB x[4] -pin invertB x[3] -pin invertB x[2] -pin invertB x[1] -pin invertB x[0]
load net <const1> -power -pin AsubB sel -pin altb b -pin invertA sel -pin invertB sel
load net A[0] -attr @rip A[0] -port A[0] -pin AaddB x[0] -pin AsubB x[0] -pin MUX8x1 in0[0] -pin agteqb a[2] -pin axnorb A[0] -pin invertA y[0]
load net A[1] -attr @rip A[1] -port A[1] -pin AaddB x[1] -pin AsubB x[1] -pin MUX8x1 in0[1] -pin agteqb a[3] -pin axnorb A[1] -pin invertA y[1]
load net A[2] -attr @rip A[2] -port A[2] -pin AaddB x[2] -pin AsubB x[2] -pin MUX8x1 in0[2] -pin agteqb a[4] -pin axnorb A[2] -pin invertA y[2]
load net A[3] -attr @rip A[3] -port A[3] -pin AaddB x[3] -pin AsubB x[3] -pin MUX8x1 in0[3] -pin agteqb a[5] -pin axnorb A[3] -pin invertA y[3]
load net A[4] -attr @rip A[4] -port A[4] -pin AaddB x[4] -pin AsubB x[4] -pin MUX8x1 in0[4] -pin agteqb a[6] -pin axnorb A[4] -pin invertA y[4]
load net A[5] -attr @rip A[5] -port A[5] -pin AaddB x[5] -pin AsubB x[5] -pin MUX8x1 in0[5] -pin agteqb a[7] -pin axnorb A[5] -pin invertA y[5]
load net AgteqB -pin agteqb agteqb -pin altb a
netloc AgteqB 1 1 1 NJ 70
load net AltB -attr @rip 0 -pin MUX8x1 in4[0] -pin altb s
netloc AltB 1 2 1 600 90n
load net AminusB[0] -attr @rip sum[0] -pin AsubB sum[0] -pin MUX8x1 in7[0]
load net AminusB[1] -attr @rip sum[1] -pin AsubB sum[1] -pin MUX8x1 in7[1]
load net AminusB[2] -attr @rip sum[2] -pin AsubB sum[2] -pin MUX8x1 in7[2]
load net AminusB[3] -attr @rip sum[3] -pin AsubB sum[3] -pin MUX8x1 in7[3]
load net AminusB[4] -attr @rip sum[4] -pin AsubB sum[4] -pin MUX8x1 in7[4]
load net AminusB[5] -attr @rip sum[5] -pin AsubB sum[5] -pin MUX8x1 in7[5]
load net AplusB[0] -attr @rip sum[0] -pin AaddB sum[0] -pin MUX8x1 in6[0]
load net AplusB[1] -attr @rip sum[1] -pin AaddB sum[1] -pin MUX8x1 in6[1]
load net AplusB[2] -attr @rip sum[2] -pin AaddB sum[2] -pin MUX8x1 in6[2]
load net AplusB[3] -attr @rip sum[3] -pin AaddB sum[3] -pin MUX8x1 in6[3]
load net AplusB[4] -attr @rip sum[4] -pin AaddB sum[4] -pin MUX8x1 in6[4]
load net AplusB[5] -attr @rip sum[5] -pin AaddB sum[5] -pin MUX8x1 in6[5]
load net AxnorB[0] -attr @rip out[0] -pin MUX8x1 in5[0] -pin axnorb out[0]
load net AxnorB[1] -attr @rip out[1] -pin MUX8x1 in5[1] -pin axnorb out[1]
load net AxnorB[2] -attr @rip out[2] -pin MUX8x1 in5[2] -pin axnorb out[2]
load net AxnorB[3] -attr @rip out[3] -pin MUX8x1 in5[3] -pin axnorb out[3]
load net AxnorB[4] -attr @rip out[4] -pin MUX8x1 in5[4] -pin axnorb out[4]
load net AxnorB[5] -attr @rip out[5] -pin MUX8x1 in5[5] -pin axnorb out[5]
load net B[0] -attr @rip B[0] -pin AaddB y[0] -pin AsubB y[0] -port B[0] -pin MUX8x1 in1[0] -pin agteqb b[2] -pin axnorb B[0] -pin invertB y[0]
load net B[1] -attr @rip B[1] -pin AaddB y[1] -pin AsubB y[1] -port B[1] -pin MUX8x1 in1[1] -pin agteqb b[3] -pin axnorb B[1] -pin invertB y[1]
load net B[2] -attr @rip B[2] -pin AaddB y[2] -pin AsubB y[2] -port B[2] -pin MUX8x1 in1[2] -pin agteqb b[4] -pin axnorb B[2] -pin invertB y[2]
load net B[3] -attr @rip B[3] -pin AaddB y[3] -pin AsubB y[3] -port B[3] -pin MUX8x1 in1[3] -pin agteqb b[5] -pin axnorb B[3] -pin invertB y[3]
load net B[4] -attr @rip B[4] -pin AaddB y[4] -pin AsubB y[4] -port B[4] -pin MUX8x1 in1[4] -pin agteqb b[6] -pin axnorb B[4] -pin invertB y[4]
load net B[5] -attr @rip B[5] -pin AaddB y[5] -pin AsubB y[5] -port B[5] -pin MUX8x1 in1[5] -pin agteqb b[7] -pin axnorb B[5] -pin invertB y[5]
load net X[0] -attr @rip X[0] -pin MUX8x1 X[0] -port X[0]
load net X[1] -attr @rip X[1] -pin MUX8x1 X[1] -port X[1]
load net X[2] -attr @rip X[2] -pin MUX8x1 X[2] -port X[2]
load net X[3] -attr @rip X[3] -pin MUX8x1 X[3] -port X[3]
load net X[4] -attr @rip X[4] -pin MUX8x1 X[4] -port X[4]
load net X[5] -attr @rip X[5] -pin MUX8x1 X[5] -port X[5]
load net fxn[0] -attr @rip fxn[0] -pin MUX8x1 fxn[0] -port fxn[0]
load net fxn[1] -attr @rip fxn[1] -pin MUX8x1 fxn[1] -port fxn[1]
load net fxn[2] -attr @rip fxn[2] -pin MUX8x1 fxn[2] -port fxn[2]
load net invertedA[0] -attr @rip sum[0] -pin MUX8x1 in2[0] -pin invertA sum[0]
load net invertedA[1] -attr @rip sum[1] -pin MUX8x1 in2[1] -pin invertA sum[1]
load net invertedA[2] -attr @rip sum[2] -pin MUX8x1 in2[2] -pin invertA sum[2]
load net invertedA[3] -attr @rip sum[3] -pin MUX8x1 in2[3] -pin invertA sum[3]
load net invertedA[4] -attr @rip sum[4] -pin MUX8x1 in2[4] -pin invertA sum[4]
load net invertedA[5] -attr @rip sum[5] -pin MUX8x1 in2[5] -pin invertA sum[5]
load net invertedB[0] -attr @rip sum[0] -pin MUX8x1 in3[0] -pin invertB sum[0]
load net invertedB[1] -attr @rip sum[1] -pin MUX8x1 in3[1] -pin invertB sum[1]
load net invertedB[2] -attr @rip sum[2] -pin MUX8x1 in3[2] -pin invertB sum[2]
load net invertedB[3] -attr @rip sum[3] -pin MUX8x1 in3[3] -pin invertB sum[3]
load net invertedB[4] -attr @rip sum[4] -pin MUX8x1 in3[4] -pin invertB sum[4]
load net invertedB[5] -attr @rip sum[5] -pin MUX8x1 in3[5] -pin invertB sum[5]
load net MUX8x1|X[0] -attr @rip O[0] -attr @name X[0] -hierPin MUX8x1 X[0] -pin MUX8x1|X_i O[0]
load net MUX8x1|X[1] -attr @rip O[1] -attr @name X[1] -hierPin MUX8x1 X[1] -pin MUX8x1|X_i O[1]
load net MUX8x1|X[2] -attr @rip O[2] -attr @name X[2] -hierPin MUX8x1 X[2] -pin MUX8x1|X_i O[2]
load net MUX8x1|X[3] -attr @rip O[3] -attr @name X[3] -hierPin MUX8x1 X[3] -pin MUX8x1|X_i O[3]
load net MUX8x1|X[4] -attr @rip O[4] -attr @name X[4] -hierPin MUX8x1 X[4] -pin MUX8x1|X_i O[4]
load net MUX8x1|X[5] -attr @rip O[5] -attr @name X[5] -hierPin MUX8x1 X[5] -pin MUX8x1|X_i O[5]
load net MUX8x1|fxn[0] -attr @rip fxn[0] -attr @name fxn[0] -hierPin MUX8x1 fxn[0] -pin MUX8x1|X_i S[0]
load net MUX8x1|fxn[1] -attr @rip fxn[1] -attr @name fxn[1] -hierPin MUX8x1 fxn[1] -pin MUX8x1|X_i S[1]
load net MUX8x1|fxn[2] -attr @rip fxn[2] -attr @name fxn[2] -hierPin MUX8x1 fxn[2] -pin MUX8x1|X_i S[2]
load net MUX8x1|in0[0] -attr @rip in0[0] -attr @name in0[0] -hierPin MUX8x1 in0[0] -pin MUX8x1|X_i I0[0]
load net MUX8x1|in0[1] -attr @rip in0[1] -attr @name in0[1] -hierPin MUX8x1 in0[1] -pin MUX8x1|X_i I0[1]
load net MUX8x1|in0[2] -attr @rip in0[2] -attr @name in0[2] -hierPin MUX8x1 in0[2] -pin MUX8x1|X_i I0[2]
load net MUX8x1|in0[3] -attr @rip in0[3] -attr @name in0[3] -hierPin MUX8x1 in0[3] -pin MUX8x1|X_i I0[3]
load net MUX8x1|in0[4] -attr @rip in0[4] -attr @name in0[4] -hierPin MUX8x1 in0[4] -pin MUX8x1|X_i I0[4]
load net MUX8x1|in0[5] -attr @rip in0[5] -attr @name in0[5] -hierPin MUX8x1 in0[5] -pin MUX8x1|X_i I0[5]
load net MUX8x1|in1[0] -attr @rip in1[0] -attr @name in1[0] -hierPin MUX8x1 in1[0] -pin MUX8x1|X_i I1[0]
load net MUX8x1|in1[1] -attr @rip in1[1] -attr @name in1[1] -hierPin MUX8x1 in1[1] -pin MUX8x1|X_i I1[1]
load net MUX8x1|in1[2] -attr @rip in1[2] -attr @name in1[2] -hierPin MUX8x1 in1[2] -pin MUX8x1|X_i I1[2]
load net MUX8x1|in1[3] -attr @rip in1[3] -attr @name in1[3] -hierPin MUX8x1 in1[3] -pin MUX8x1|X_i I1[3]
load net MUX8x1|in1[4] -attr @rip in1[4] -attr @name in1[4] -hierPin MUX8x1 in1[4] -pin MUX8x1|X_i I1[4]
load net MUX8x1|in1[5] -attr @rip in1[5] -attr @name in1[5] -hierPin MUX8x1 in1[5] -pin MUX8x1|X_i I1[5]
load net MUX8x1|in2[0] -attr @rip in2[0] -attr @name in2[0] -hierPin MUX8x1 in2[0] -pin MUX8x1|X_i I2[0]
load net MUX8x1|in2[1] -attr @rip in2[1] -attr @name in2[1] -hierPin MUX8x1 in2[1] -pin MUX8x1|X_i I2[1]
load net MUX8x1|in2[2] -attr @rip in2[2] -attr @name in2[2] -hierPin MUX8x1 in2[2] -pin MUX8x1|X_i I2[2]
load net MUX8x1|in2[3] -attr @rip in2[3] -attr @name in2[3] -hierPin MUX8x1 in2[3] -pin MUX8x1|X_i I2[3]
load net MUX8x1|in2[4] -attr @rip in2[4] -attr @name in2[4] -hierPin MUX8x1 in2[4] -pin MUX8x1|X_i I2[4]
load net MUX8x1|in2[5] -attr @rip in2[5] -attr @name in2[5] -hierPin MUX8x1 in2[5] -pin MUX8x1|X_i I2[5]
load net MUX8x1|in3[0] -attr @rip in3[0] -attr @name in3[0] -hierPin MUX8x1 in3[0] -pin MUX8x1|X_i I3[0]
load net MUX8x1|in3[1] -attr @rip in3[1] -attr @name in3[1] -hierPin MUX8x1 in3[1] -pin MUX8x1|X_i I3[1]
load net MUX8x1|in3[2] -attr @rip in3[2] -attr @name in3[2] -hierPin MUX8x1 in3[2] -pin MUX8x1|X_i I3[2]
load net MUX8x1|in3[3] -attr @rip in3[3] -attr @name in3[3] -hierPin MUX8x1 in3[3] -pin MUX8x1|X_i I3[3]
load net MUX8x1|in3[4] -attr @rip in3[4] -attr @name in3[4] -hierPin MUX8x1 in3[4] -pin MUX8x1|X_i I3[4]
load net MUX8x1|in3[5] -attr @rip in3[5] -attr @name in3[5] -hierPin MUX8x1 in3[5] -pin MUX8x1|X_i I3[5]
load net MUX8x1|in4[0] -attr @rip in4[0] -attr @name in4[0] -hierPin MUX8x1 in4[0] -pin MUX8x1|X_i I4[0]
load net MUX8x1|in4[1] -attr @rip in4[1] -attr @name in4[1] -hierPin MUX8x1 in4[1] -pin MUX8x1|X_i I4[1]
load net MUX8x1|in4[2] -attr @rip in4[2] -attr @name in4[2] -hierPin MUX8x1 in4[2] -pin MUX8x1|X_i I4[2]
load net MUX8x1|in4[3] -attr @rip in4[3] -attr @name in4[3] -hierPin MUX8x1 in4[3] -pin MUX8x1|X_i I4[3]
load net MUX8x1|in4[4] -attr @rip in4[4] -attr @name in4[4] -hierPin MUX8x1 in4[4] -pin MUX8x1|X_i I4[4]
load net MUX8x1|in4[5] -attr @rip in4[5] -attr @name in4[5] -hierPin MUX8x1 in4[5] -pin MUX8x1|X_i I4[5]
load net MUX8x1|in5[0] -attr @rip in5[0] -attr @name in5[0] -hierPin MUX8x1 in5[0] -pin MUX8x1|X_i I5[0]
load net MUX8x1|in5[1] -attr @rip in5[1] -attr @name in5[1] -hierPin MUX8x1 in5[1] -pin MUX8x1|X_i I5[1]
load net MUX8x1|in5[2] -attr @rip in5[2] -attr @name in5[2] -hierPin MUX8x1 in5[2] -pin MUX8x1|X_i I5[2]
load net MUX8x1|in5[3] -attr @rip in5[3] -attr @name in5[3] -hierPin MUX8x1 in5[3] -pin MUX8x1|X_i I5[3]
load net MUX8x1|in5[4] -attr @rip in5[4] -attr @name in5[4] -hierPin MUX8x1 in5[4] -pin MUX8x1|X_i I5[4]
load net MUX8x1|in5[5] -attr @rip in5[5] -attr @name in5[5] -hierPin MUX8x1 in5[5] -pin MUX8x1|X_i I5[5]
load net MUX8x1|in6[0] -attr @rip in6[0] -attr @name in6[0] -hierPin MUX8x1 in6[0] -pin MUX8x1|X_i I6[0]
load net MUX8x1|in6[1] -attr @rip in6[1] -attr @name in6[1] -hierPin MUX8x1 in6[1] -pin MUX8x1|X_i I6[1]
load net MUX8x1|in6[2] -attr @rip in6[2] -attr @name in6[2] -hierPin MUX8x1 in6[2] -pin MUX8x1|X_i I6[2]
load net MUX8x1|in6[3] -attr @rip in6[3] -attr @name in6[3] -hierPin MUX8x1 in6[3] -pin MUX8x1|X_i I6[3]
load net MUX8x1|in6[4] -attr @rip in6[4] -attr @name in6[4] -hierPin MUX8x1 in6[4] -pin MUX8x1|X_i I6[4]
load net MUX8x1|in6[5] -attr @rip in6[5] -attr @name in6[5] -hierPin MUX8x1 in6[5] -pin MUX8x1|X_i I6[5]
load net MUX8x1|in7[0] -attr @rip in7[0] -attr @name in7[0] -hierPin MUX8x1 in7[0] -pin MUX8x1|X_i I7[0]
load net MUX8x1|in7[1] -attr @rip in7[1] -attr @name in7[1] -hierPin MUX8x1 in7[1] -pin MUX8x1|X_i I7[1]
load net MUX8x1|in7[2] -attr @rip in7[2] -attr @name in7[2] -hierPin MUX8x1 in7[2] -pin MUX8x1|X_i I7[2]
load net MUX8x1|in7[3] -attr @rip in7[3] -attr @name in7[3] -hierPin MUX8x1 in7[3] -pin MUX8x1|X_i I7[3]
load net MUX8x1|in7[4] -attr @rip in7[4] -attr @name in7[4] -hierPin MUX8x1 in7[4] -pin MUX8x1|X_i I7[4]
load net MUX8x1|in7[5] -attr @rip in7[5] -attr @name in7[5] -hierPin MUX8x1 in7[5] -pin MUX8x1|X_i I7[5]
load netBundle @MUX8x1|fxn 3 MUX8x1|fxn[2] MUX8x1|fxn[1] MUX8x1|fxn[0] -autobundled
netbloc @MUX8x1|fxn 1 0 1 790 168n
load netBundle @MUX8x1|in0 6 MUX8x1|in0[5] MUX8x1|in0[4] MUX8x1|in0[3] MUX8x1|in0[2] MUX8x1|in0[1] MUX8x1|in0[0] -autobundled
netbloc @MUX8x1|in0 1 0 1 N 188
load netBundle @MUX8x1|in1 6 MUX8x1|in1[5] MUX8x1|in1[4] MUX8x1|in1[3] MUX8x1|in1[2] MUX8x1|in1[1] MUX8x1|in1[0] -autobundled
netbloc @MUX8x1|in1 1 0 1 N 208
load netBundle @MUX8x1|in2 6 MUX8x1|in2[5] MUX8x1|in2[4] MUX8x1|in2[3] MUX8x1|in2[2] MUX8x1|in2[1] MUX8x1|in2[0] -autobundled
netbloc @MUX8x1|in2 1 0 1 N 228
load netBundle @MUX8x1|in3 6 MUX8x1|in3[5] MUX8x1|in3[4] MUX8x1|in3[3] MUX8x1|in3[2] MUX8x1|in3[1] MUX8x1|in3[0] -autobundled
netbloc @MUX8x1|in3 1 0 1 N 248
load netBundle @MUX8x1|in4 6 MUX8x1|in4[5] MUX8x1|in4[4] MUX8x1|in4[3] MUX8x1|in4[2] MUX8x1|in4[1] MUX8x1|in4[0] -autobundled
netbloc @MUX8x1|in4 1 0 1 N 268
load netBundle @MUX8x1|in5 6 MUX8x1|in5[5] MUX8x1|in5[4] MUX8x1|in5[3] MUX8x1|in5[2] MUX8x1|in5[1] MUX8x1|in5[0] -autobundled
netbloc @MUX8x1|in5 1 0 1 N 288
load netBundle @MUX8x1|in6 6 MUX8x1|in6[5] MUX8x1|in6[4] MUX8x1|in6[3] MUX8x1|in6[2] MUX8x1|in6[1] MUX8x1|in6[0] -autobundled
netbloc @MUX8x1|in6 1 0 1 N 308
load netBundle @MUX8x1|in7 6 MUX8x1|in7[5] MUX8x1|in7[4] MUX8x1|in7[3] MUX8x1|in7[2] MUX8x1|in7[1] MUX8x1|in7[0] -autobundled
netbloc @MUX8x1|in7 1 0 1 N 328
load netBundle @MUX8x1|X 6 MUX8x1|X[5] MUX8x1|X[4] MUX8x1|X[3] MUX8x1|X[2] MUX8x1|X[1] MUX8x1|X[0] -autobundled
netbloc @MUX8x1|X 1 1 1 N 258
load netBundle @A 6 A[5] A[4] A[3] A[2] A[1] A[0] -autobundled
netbloc @A 1 0 3 20 150 290 190 540J
load netBundle @B 6 B[5] B[4] B[3] B[2] B[1] B[0] -autobundled
netbloc @B 1 0 3 40 200 270 210 560J
load netBundle @fxn 3 fxn[2] fxn[1] fxn[0] -autobundled
netbloc @fxn 1 0 3 NJ 170 NJ 170 520J
load netBundle @X 6 X[5] X[4] X[3] X[2] X[1] X[0] -autobundled
netbloc @X 1 3 1 1110 250n
load netBundle @AplusB 6 AplusB[5] AplusB[4] AplusB[3] AplusB[2] AplusB[1] AplusB[0] -autobundled
netbloc @AplusB 1 2 1 600 308n
load netBundle @AminusB 6 AminusB[5] AminusB[4] AminusB[3] AminusB[2] AminusB[1] AminusB[0] -autobundled
netbloc @AminusB 1 2 1 660 328n
load netBundle @AxnorB 6 AxnorB[5] AxnorB[4] AxnorB[3] AxnorB[2] AxnorB[1] AxnorB[0] -autobundled
netbloc @AxnorB 1 2 1 640 288n
load netBundle @invertedA 6 invertedA[5] invertedA[4] invertedA[3] invertedA[2] invertedA[1] invertedA[0] -autobundled
netbloc @invertedA 1 2 1 580J 228n
load netBundle @invertedB 6 invertedB[5] invertedB[4] invertedB[3] invertedB[2] invertedB[1] invertedB[0] -autobundled
netbloc @invertedB 1 2 1 620 248n
levelinfo -pg 1 0 130 380 760 1130
levelinfo -hier MUX8x1 * 910 *
pagesize -pg 1 -db -bbox -sgen -100 0 1220 930
pagesize -hier MUX8x1 -db -bbox -sgen 760 138 1040 388
show
fullfit
#
# initialize ictrl to current module MINI_ALU work:MINI_ALU:NOFILE
ictrl init topinfo |
