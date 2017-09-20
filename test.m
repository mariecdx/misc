+function test

% %obtenir la courbe f
% x=-4:0.1:5;
% f=x.^2-4*x;
% figure;
% plot(x,f,'+')
% title('test')
% xlabel('x')
% ylabel('y')
% grid 
% hold on
% 
% %Obtenir la derivee de f: points min et max
% df = diff(f)./diff(x);
% xd = x(2:length(x));
% figure;plot(xd,df)
% title('dérivée de la fonction f')
% xlabel('abscisse')
% ylabel('ordonnés')
% grid


% %Obtenir la double dérivée: points concaves et convexes
% df = diff(f)./diff(x);
% xd = x(2:length(x));
% figure;plot(xd,df)
% title('dérivée de la fonction f')
% xlabel('abscisse')
% ylabel('ordonnés')
% grid




% produit = df(1:length(df)-1).*df(2:length(df));
% local =xd(find(produit<0))
% % [x,y]=meshgrid(-2 :0.2 :2,-2 :.2 :2) ;
% % z=x.^2-4*x;
% z=x.*exp(-x.^2-y.^2)
% mesh(z)
% % surfl(z)

%Simon
load DD_no_SG.k
f=DD_no_SG(:,4);
figure(1);
plot(f)
title(' fonction DDnoSG')
xlabel('abscisse x')
ylabel('ordonnée y')
grid
df=diff(f);
figure(2);
plot(df)
title('dérivée de la fonction f')
xlabel('abscisse x')
ylabel('ordonnée y')
grid
dia=[];
p=find((df<-4)| (df>0))
% t=1;
for i=1:length(p)
    t=1;
    var1=t:p(i);
    for j=1:p(i)
        dia(j)= var1(j);
    end
    t =p+1;
end
% t=1;
% for i=1:length(p)
% %     t=1;
%     dia=linspace(t,p(1),p(i))
%     t = p(i)+1;
%  end
   
    
    
    












