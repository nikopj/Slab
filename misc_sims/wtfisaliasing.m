theta = 30*pi/180;
f = 915e6;
fs = (4/3)*f;
T = 1/fs;
samp = 1e3;
SNR = 15;

v=10^(-SNR/20)*(1/sqrt(2))*(randn(4,samp+6)+1j*randn(4,samp+6));


lambda = 3e8/f;
d = lambda/4;
dol = d/lambda;

phaseShift = 2*pi*d*sin(theta)/lambda;

t = linspace(T,samp*T,samp);
x1 = sin(2*pi*f*t);
x2 = sin(2*pi*f*t + phaseShift);
x3 = sin(2*pi*f*t + 2*phaseShift);
x4 = sin(2*pi*f*t + 3*phaseShift);

sOdd = [1,0,-1,0];
sEven = [0,-1,0,1];

times = samp/(4);

sOdd = repmat(sOdd,1,times);
sEven = repmat(sEven,1,times);

[b,a] = butter(6,1/2);
freqz(b,a)

x1I = sOdd.*x1;
x1Q = sEven.*x1;

x2I = sOdd.*x2;
x2Q = sEven.*x2;

x3I = sOdd.*x3;
x3Q = sEven.*x3;

x4I = sOdd.*x4;
x4Q = sEven.*x4;

rec1 = butter6(b,a,x1I + 1j*x1Q);
rec2 = butter6(b,a,x2I + 1j*x2Q);
rec3 = butter6(b,a,x3I + 1j*x3Q);
rec4 = butter6(b,a,x4I + 1j*x4Q);
rec = [rec1;rec2;rec3;rec4] + v;

%%


Rhat=zeros(4);
%n=1000;
for ii=1:samp
Rhat = Rhat+rec(:,ii)*rec(:,ii)';
end
Rhat=Rhat/samp;
lambda=eig(Rhat);

p = linspace(-90,90,1e3); 
% electric angle
th = 2*pi*dol*sin(p*pi/180);

s = exp(-1j*th.*([0;1;2;3]));

S_music=zeros(length(th),1);

[V,lambda] = eig(Rhat)
G = V(:,1:3);

for ii=1:length(th)
  S_music(ii)= 1./(s(:,ii)'*(G*G')*s(:,ii));
end

S_music_db = 20*log10(abs(S_music));
figure
plot(p,S_music_db)
title('MUSIC Spectrum')

%%
% --- MUSIC spectrum ---
n= 200;
tt=linspace(0,pi/2,n);
pp=linspace(-pi,pi,n);
[TT, PP] = meshgrid(tt,pp);
S_music  = zeros(n,n);

ak=zeros(n,n,3);
ak(:,:,1) = sin(TT).*cos(PP);
ak(:,:,2) = sin(TT).*sin(PP);
ak(:,:,3) = cos(TT);

[V, ~] = eig(Rhat);
G = V(:,end);

for ii=1:n
  for jj=1:n
    aakk = reshape( ak(ii,jj,:), 1, 3);
    s =exp(-2*pi*1j*dol*r.'*aakk.');
    S_music(ii,jj) = 1./(s'*(G*G')*s);
  end
end

figure
surfc(TT*180/pi,PP*180/pi,20*log10(abs(S_music)))
xlabel('\Theta (deg)')
ylabel('\Phi (deg)')
title('MUSIC Spectrum')