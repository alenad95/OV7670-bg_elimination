
O
Command: %s
53*	vivadotcl2

opt_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-349h px? 
n
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_design2default:defaultZ4-22h px? 
R

Starting %s Task
103*constraints2
DRC2default:defaultZ18-103h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
U
DRC finished with %s
272*project2
0 Errors2default:defaultZ1-461h px? 
d
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:01 ; elapsed = 00:00:01 . Memory (MB): peak = 1540.855 ; gain = 0.0002default:defaulth px? 
g

Starting %s Task
103*constraints2,
Cache Timing Information2default:defaultZ18-103h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
P
;Ending Cache Timing Information Task | Checksum: 130fb0fae
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 1540.855 ; gain = 0.0002default:defaulth px? 
a

Starting %s Task
103*constraints2&
Logic Optimization2default:defaultZ18-103h px? 
i

Phase %s%s
101*constraints2
1 2default:default2
Retarget2default:defaultZ18-101h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
62default:default2
62default:defaultZ31-138h px? 
K
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49h px? 
<
'Phase 1 Retarget | Checksum: 25ea9762e
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 1634.141 ; gain = 1.0472default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2
Retarget2default:default2
2022default:default2
2992default:defaultZ31-389h px? 
?
?In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Retarget2default:default2
202default:defaultZ31-1021h px? 
u

Phase %s%s
101*constraints2
2 2default:default2(
Constant propagation2default:defaultZ18-101h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
22default:default2
52default:defaultZ31-138h px? 
H
3Phase 2 Constant propagation | Checksum: 1ae00d0b3
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:03 ; elapsed = 00:00:03 . Memory (MB): peak = 1634.141 ; gain = 1.0472default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2(
Constant propagation2default:default2
1982default:default2
16492default:defaultZ31-389h px? 
?
?In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2(
Constant propagation2default:default2
232default:defaultZ31-1021h px? 
f

Phase %s%s
101*constraints2
3 2default:default2
Sweep2default:defaultZ18-101h px? 
9
$Phase 3 Sweep | Checksum: 19108b6e4
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:07 ; elapsed = 00:00:06 . Memory (MB): peak = 1634.141 ; gain = 1.0472default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2
Sweep2default:default2
72default:default2
26862default:defaultZ31-389h px? 
?
?In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Sweep2default:default2
2782default:defaultZ31-1021h px? 
r

Phase %s%s
101*constraints2
4 2default:default2%
BUFG optimization2default:defaultZ18-101h px? 
E
0Phase 4 BUFG optimization | Checksum: 19108b6e4
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 1634.141 ; gain = 1.0472default:defaulth px? 
?
EPhase %s created %s cells of which %s are BUFGs and removed %s cells.395*opt2%
BUFG optimization2default:default2
02default:default2
02default:default2
02default:defaultZ31-662h px? 
|

Phase %s%s
101*constraints2
5 2default:default2/
Shift Register Optimization2default:defaultZ18-101h px? 
?
dSRL Remap converted %s SRLs to %s registers and converted %s registers of register chains to %s SRLs546*opt2
02default:default2
02default:default2
02default:default2
02default:defaultZ31-1064h px? 
O
:Phase 5 Shift Register Optimization | Checksum: 19108b6e4
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:08 ; elapsed = 00:00:08 . Memory (MB): peak = 1634.141 ; gain = 1.0472default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2/
Shift Register Optimization2default:default2
02default:default2
02default:defaultZ31-389h px? 
x

Phase %s%s
101*constraints2
6 2default:default2+
Post Processing Netlist2default:defaultZ18-101h px? 
K
6Phase 6 Post Processing Netlist | Checksum: 19108b6e4
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:08 ; elapsed = 00:00:08 . Memory (MB): peak = 1634.141 ; gain = 1.0472default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2+
Post Processing Netlist2default:default2
02default:default2
02default:defaultZ31-389h px? 
?
?In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2+
Post Processing Netlist2default:default2
472default:defaultZ31-1021h px? 
/
Opt_design Change Summary
*commonh px? 
/
=========================
*commonh px? 


*commonh px? 


*commonh px? 
?
z-------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  Phase                        |  #Cells created  |  #Cells Removed  |  #Constrained objects preventing optimizations  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  Retarget                     |             202  |             299  |                                             20  |
|  Constant propagation         |             198  |            1649  |                                             23  |
|  Sweep                        |               7  |            2686  |                                            278  |
|  BUFG optimization            |               0  |               0  |                                              0  |
|  Shift Register Optimization  |               0  |               0  |                                              0  |
|  Post Processing Netlist      |               0  |               0  |                                             47  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px? 


*commonh px? 


*commonh px? 
a

Starting %s Task
103*constraints2&
Connectivity Check2default:defaultZ18-103h px? 
?

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.088 . Memory (MB): peak = 1634.141 ; gain = 0.0002default:defaulth px? 
J
5Ending Logic Optimization Task | Checksum: 19383b7e9
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:09 ; elapsed = 00:00:09 . Memory (MB): peak = 1634.141 ; gain = 1.0472default:defaulth px? 
a

Starting %s Task
103*constraints2&
Power Optimization2default:defaultZ18-103h px? 
s
7Will skip clock gating for clocks with period < %s ns.
114*pwropt2
2.002default:defaultZ34-132h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
=
Applying IDT optimizations ...
9*pwroptZ34-9h px? 
?
Applying ODC optimizations ...
10*pwroptZ34-10h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
1.1912default:default2
0.0002default:defaultZ32-619h px? 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px? 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px? 


*pwropth px? 
e

Starting %s Task
103*constraints2*
PowerOpt Patch Enables2default:defaultZ18-103h px? 
?
?WRITE_MODE attribute of %s BRAM(s) out of a total of %s has been updated to save power.
    Run report_power_opt to get a complete listing of the BRAMs updated.
129*pwropt2
22default:default2
302default:defaultZ34-162h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
d
+Structural ODC has moved %s WE to EN ports
155*pwropt2
22default:defaultZ34-201h px? 
?
CNumber of BRAM Ports augmented: %s newly gated: %s Total Ports: %s
65*pwropt2
62default:default2
62default:default2
602default:defaultZ34-65h px? 
N
9Ending PowerOpt Patch Enables Task | Checksum: 1d17a0f69
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:01 ; elapsed = 00:00:01 . Memory (MB): peak = 2041.047 ; gain = 0.0002default:defaulth px? 
J
5Ending Power Optimization Task | Checksum: 1d17a0f69
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:11 . Memory (MB): peak = 2041.047 ; gain = 406.9062default:defaulth px? 
\

Starting %s Task
103*constraints2!
Final Cleanup2default:defaultZ18-103h px? 
E
0Ending Final Cleanup Task | Checksum: 1d17a0f69
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 2041.047 ; gain = 0.0002default:defaulth px? 
b

Starting %s Task
103*constraints2'
Netlist Obfuscation2default:defaultZ18-103h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.1142default:default2
2041.0472default:default2
0.0002default:defaultZ17-268h px? 
K
6Ending Netlist Obfuscation Task | Checksum: 11a80f9c7
*commonh px? 
?

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.114 . Memory (MB): peak = 2041.047 ; gain = 0.0002default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
532default:default2
372default:default2
272default:default2
02default:defaultZ4-41h px? 
\
%s completed successfully
29*	vivadotcl2

opt_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
opt_design: 2default:default2
00:00:352default:default2
00:00:262default:default2
2041.0472default:default2
500.1912default:defaultZ17-268h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0122default:default2
2041.0472default:default2
0.0002default:defaultZ17-268h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
H
&Writing timing data to binary archive.266*timingZ38-480h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:002default:default2 
00:00:00.1162default:default2
2041.0472default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?D:/Alessandro/Documents/GitHub/OV7670-bg_elimination/OV7670_Color/VIVADO_PROJECT/OV7670/OV7670.runs/impl_1/design_1_wrapper_opt.dcp2default:defaultZ17-1381h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
write_checkpoint: 2default:default2
00:00:092default:default2
00:00:062default:default2
2041.0472default:default2
0.0002default:defaultZ17-268h px? 
?
%s4*runtcl2?
?Executing : report_drc -file design_1_wrapper_drc_opted.rpt -pb design_1_wrapper_drc_opted.pb -rpx design_1_wrapper_drc_opted.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
ureport_drc -file design_1_wrapper_drc_opted.rpt -pb design_1_wrapper_drc_opted.pb -rpx design_1_wrapper_drc_opted.rpx2default:defaultZ4-113h px? 
>
Refreshing IP repositories
234*coregenZ19-234h px? 
?
 Loaded user IP repository '%s'.
1135*coregen2q
]d:/Alessandro/Documents/GitHub/OV7670-bg_elimination/OV7670_Color/VIVADO_HLS/OV7670_INTERFACE2default:defaultZ19-1700h px? 
?
 Loaded user IP repository '%s'.
1135*coregen2r
^d:/Alessandro/Desktop/SmartCamera-master/HLS_COMMON/PATTERN_GENERATORS/PATTERN_GENERATOR_CROSS2default:defaultZ19-1700h px? 
?
 Loaded user IP repository '%s'.
1135*coregen2{
gd:/Alessandro/Documents/GitHub/OV7670-bg_elimination/HLS_COMMON/FILTERS/Configurable_Convolution_Filter2default:defaultZ19-1700h px? 
?
 Loaded user IP repository '%s'.
1135*coregen2^
Jd:/Alessandro/Documents/GitHub/OV7670-bg_elimination/hls/background_eraser2default:defaultZ19-1700h px? 
?
 Loaded user IP repository '%s'.
1135*coregen2r
^d:/Alessandro/Documents/GitHub/OV7670-bg_elimination/HLS_COMMON/FILTERS/Sep_Convolution_Filter2default:defaultZ19-1700h px? 
?
 Loaded user IP repository '%s'.
1135*coregen2s
_d:/Alessandro/Documents/GitHub/OV7670-bg_elimination/OV7670_Color/VIVADO_HLS/OV7670_LUMA_CHROMA2default:defaultZ19-1700h px? 
?
 Loaded user IP repository '%s'.
1135*coregen2d
Pd:/Alessandro/Documents/GitHub/OV7670-bg_elimination/HLS_COMMON/VIDEO_STREAM_MUX2default:defaultZ19-1700h px? 
?
 Loaded user IP repository '%s'.
1135*coregen2q
]d:/Alessandro/Documents/GitHub/OV7670-bg_elimination/OV7670_Color/VIVADO_HLS/OV7670_GRAYSCALE2default:defaultZ19-1700h px? 
?
 Loaded user IP repository '%s'.
1135*coregen2d
Pd:/Alessandro/Documents/GitHub/OV7670-bg_elimination/HLS_COMMON/LF_VALID_TO_AXIS2default:defaultZ19-1700h px? 
?
 Loaded user IP repository '%s'.
1135*coregen2r
^d:/Alessandro/Documents/GitHub/OV7670-bg_elimination/HLS_COMMON/DDR/AXIS_TO_DDR_WRITER_AXILITE2default:defaultZ19-1700h px? 
?
 Loaded user IP repository '%s'.
1135*coregen2r
^d:/Alessandro/Documents/GitHub/OV7670-bg_elimination/HLS_COMMON/DDR/DDR_TO_AXIS_READER_AXILITE2default:defaultZ19-1700h px? 
?
 Loaded user IP repository '%s'.
1135*coregen2u
ad:/Alessandro/Documents/GitHub/OV7670-bg_elimination/HLS_COMMON/DDR/DDR_TO_AXIS_READER_AXILITE_SD2default:defaultZ19-1700h px? 
?
 Loaded user IP repository '%s'.
1135*coregen2n
Zd:/Alessandro/Documents/GitHub/OV7670-bg_elimination/HLS_COMMON/FILTERS/FILTER_CONVOLUTION2default:defaultZ19-1700h px? 
?
 Loaded user IP repository '%s'.
1135*coregen2i
Ud:/Alessandro/Documents/GitHub/OV7670-bg_elimination/HLS_COMMON/VGA/AXI_STREAM_TO_VGA2default:defaultZ19-1700h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
#The results of DRC are in file %s.
168*coretcl2?
?D:/Alessandro/Documents/GitHub/OV7670-bg_elimination/OV7670_Color/VIVADO_PROJECT/OV7670/OV7670.runs/impl_1/design_1_wrapper_drc_opted.rpt?D:/Alessandro/Documents/GitHub/OV7670-bg_elimination/OV7670_Color/VIVADO_PROJECT/OV7670/OV7670.runs/impl_1/design_1_wrapper_drc_opted.rpt2default:default8Z2-168h px? 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px? 


End Record