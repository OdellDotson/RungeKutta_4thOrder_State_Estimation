% verification script
% call to check whether you have the right answer

% testing sdof
sdof([-pi/2 0 0; 0.1 0 0.1 ]',[0 2],[0 1])
% should give you
%{
ans =  
      0       0
 0.8759  0.0018
      0  1.9000
%}

% testing eulerMet
eulerMet(@sdof,[-pi/2,0,0]',0,0,0.01)
% should give you
%{
ans = 
    -1.5708
     0.0088
          0
%}

% testing rungeKutta4
rungeKutta4(@sdof,[-pi/2,0,0]',0,0,0.01)
% should give you
%{
ans = 
    -1.5708
     0.0088
    -0.0004
%}

% testing forSim (non-modified)
forSim(@sdof,[-pi/2 0 0]',zeros(1,30),10,30,@eulerMet)
forSim(@sdof,[-pi/2 0 0]',zeros(1,30),10,30,@rungeKutta4)
% should give you
%{

ans = 

 1.0e+03 *

  Columns 1 through 13

   -0.0016   -0.0016   -0.0015   -0.0013   -0.0011   -0.0011   -0.0013   -0.0017   -0.0020   -0.0016   -0.0007    0.0003    0.0004
         0    0.0003    0.0006    0.0006    0.0001   -0.0007   -0.0012   -0.0006    0.0010    0.0028    0.0030    0.0003   -0.0047
         0         0   -0.0010   -0.0026   -0.0035   -0.0025    0.0008    0.0046    0.0052    0.0000   -0.0094   -0.0163   -0.0118

  Columns 14 through 26

   -0.0011   -0.0038   -0.0056   -0.0042    0.0010    0.0071    0.0085    0.0008   -0.0140   -0.0256   -0.0202    0.0076    0.0441
   -0.0081   -0.0053    0.0043    0.0156    0.0182    0.0042   -0.0230   -0.0445   -0.0348    0.0163    0.0834    0.1095    0.0416
    0.0076    0.0322    0.0391    0.0117   -0.0441   -0.0902   -0.0741    0.0274    0.1665    0.2272    0.0971   -0.2134   -0.5072

  Columns 27 through 31

    0.0580    0.0210   -0.0620   -0.1368   -0.1231
   -0.1110   -0.2490   -0.2244    0.0412    0.4335
   -0.4768    0.0521    0.8647    1.3245    0.7458

%}

% testing forSim (non-modified)
Kp = 5;
Kd = 1;
% CHANGE 0 TO THE EXPERSSION OF THE PD CONTROL LAW
u = @(x) -Kp*x(1,:) -Kd*x(2,:);

[X,t] = forSimMod(@sdof,[-pi/2 0 0]',u,10,100,@rungeKutta4);
%plot(t,X(1,:)') % should approach 0