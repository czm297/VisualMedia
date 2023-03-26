
semaName = 'H:\Text.png';
img2= imread(semaName);

[m,n,~]=size(img2);

M=18;N=28; % choose M¡¢N

Cnum=10;

xb=round(m/M)*M;yb=round(n/N)*N; % Find M,N that's divisible
rgb=imresize(img2,[xb,yb]);
[m,n,c]=size(rgb);
count =1;
colorsss=[];
for i=1:M
    for j=1:N
        block = rgb((i-1)*m/M+1:m/M*i,(j-1)*n/N+1:j*n/N,:); % Image block
        [C, label, J]=kmeansM(block,Cnum);
        
        
        [m1,n1]=find(isnan(C)==1);
        C(m1,:)=[];
        
        pro=tabulate(label(:));
        [m1,n1]=find(pro==0);
        pro(m1,:)=[];
      
        HSV = rgb2hsv(C/255);
        colors=[C,HSV,pro(:,3)];
        
        dlmwrite('test.csv',colors,'delimiter',',','-append');
        count = count+1;
        
    end
end




