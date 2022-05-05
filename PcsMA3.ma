[top]
components : PCS mobilePhone1@Generator mobilePhone2@Generator mobilePhone3@Generator mobilePhone4@Generator
link : out@mobilePhone1 in1@PCS
link : out@mobilePhone2 in2@PCS
link : out@mobilePhone3 in3@PCS
link : out@mobilePhone4 in4@PCS

[mobilePhone1]
distribution : poisson
mean : 2
initial : 1
increment : 0

[mobilePhone2]
distribution : poisson
mean : 3
initial : 1
increment : 0

[mobilePhone3]
distribution : poisson
mean : 4
initial : 1
increment : 0

[mobilePhone4]
distribution : poisson
mean : 7
initial : 1
increment : 0

[PCS]
type : cell
dim : (10,10)
delay : inertial
defaultDelayTime : 1000
border : nowrapped
neighbors : PCS(-1,-1)  PCS(-1,0) PCS(-1,1)
neighbors : PCS(0,-1)   PCS(0,0)   PCS(0,1)
neighbors : PCS(1,-1)   PCS(1,0)  PCS(1,1)
initialValue : 0

in : in1 in2 in3 in4
link : in1 in@PCS(5,9)
link : in2 in@PCS(6,0)
link : in3 in@PCS(0,5)
link : in4 in@PCS(9,6)

localTransition : move-rule

portInTransition : in@PCS(5,9) GenMobile1
portInTransition : in@PCS(6,0) GenMobile2
portInTransition : in@PCS(0,5) GenMobile3
portInTransition : in@PCS(9,6) GenMobile4

[move-rule]
rule : 1 1000 {(0,1)=1 }
rule : 2 1000 {(0,-1)=2 }
rule : 3 1000 {(-1,0)=3 }
rule : 4 1000 {(1,0)=4 }
rule : 0 1000 { t }

%--If more than three mobiel phone in the area, blocked occure.
rule : 0 1000 { (0,1)=1 and (0,-1)>0 and (1,-1)>0 and (1,0)>0}
rule : 0 1000 { (0,-1)=2 and (-1,0)>0 and (-1,1)>0 and (0,1)>0}
rule : 0 1000 { (-1,0)=3 and (0,1)>0 and (1,1)>0 and (1,0)>0}
rule : 0 1000 { (1,0)=4 and (0,-1)>0 and (-1,-1)>0 and (-1,0)>0}
rule : 0 1000 { t }


[GenMobile1]
rule : 1 0 { t }

[GenMobile2]
rule : 2 0 { t }

[GenMobile3]
rule : 3 0 { t }

[GenMobile4]
rule : 4 0 { t }
