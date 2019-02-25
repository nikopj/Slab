%% IF
w = 2*pi*5e6;
RIF = 575;
XIF = 3.39e3; CIF = 1/(w*XIF);
RL = 200;

n = RIF/RL;
Q = sqrt(n-1);
Xc = RIF/Q;
C = 1/(w*Xc);
C3 = C-CIF
XL = RL*Q;
L2 = XL/(2*w)

RL = 50;
L11 = sqrt(RL*RIF)/w
C11 = 1/(w*sqrt(RL*RIF))
%% RF
w = 2*pi*85e6;
RRF = 31.3; XRF = 8.41;
Rs = 50;

n = Rs/RRF;
Q = sqrt(n-1);
Xc = Rs/Q;
C = 1/(w*Xc)
XL = RRF*Q;
Xext = XL-XRF;
Lext = Xext/w;
L = 0.5*Lext

L1 = sqrt(Rs*RRF)/w
C7 = 1/(w*sqrt(Rs*RRF))

%%
N = 1024;
a = [127,0,127,255]-127;
x = repmat(a,1,N/4);


%%

close all

f = 5.25e6;
fs = 1e6;
N = 1024;
t = linspace(0,N/fs,N);
a=127;
x = sin(2*pi*f*t+rand(1)*2*pi)*a;
x(x>127)=127; x(x<-127)=-127;


%%
x = x+a;
x = round(x);
plot(cumsum(x(1:50)))


%%

close all

f = 85.25e6;
fs = 1e6;
N = 1024;
t = linspace(0,N/fs,N);
a=127;
x = sin(2*pi*f*t+rand(1)*2*pi);
% x(x>127)=127; x(x<-127)=-127;

sOdd = [1,0,-1,0];
sEven = [0,-1,0,1];

sOdd = repmat(sOdd,1,N/4);
sEven = repmat(sEven,1,N/4);

xI = x.*sOdd;
xQ = x.*sEven;

b = [-0.002685546875,                                          
0.013641357421875,                                       
 0.00262451171875,                                        
-0.02392578125,                                           
-0.00335693359375,                                        
 0.046600341796875,                                       
 0.004119873046875,                                       
-0.095123291015625,                                       
-0.004608154296875,                                       
 0.31451416015625,                                        
 0.5047607421875,                                         
 0.31451416015625,                                        
-0.004608154296875,                                       
-0.095123291015625,                                       
 0.004119873046875,                                       
 0.046600341796875,                                       
-0.00335693359375,                                        
-0.02392578125,                                           
 0.00262451171875,                                        
 0.013641357421875,                                       
-0.002685546875];

xfI = filter(b,1,xI);
xfQ = filter(b,1,xQ);

X = fftshift(fft(xI+1j*xQ));
Xf = fftshift(fft(xfI+1j*xfQ));
figure
subplot(1,2,1), plot(linspace(-pi,pi,N),abs(X)), title('Not Filtered');
subplot(1,2,2), plot(linspace(-pi,pi,N),abs(Xf)), title('Filtered');
figure
subplot(2,2,1), plot(xfI), title('Filtered xI')
subplot(2,2,2), plot(xfQ), title('Filtered xQ')
subplot(2,2,3), plot(xI), title('xI')
subplot(2,2,4), plot(xQ), title('xQ')