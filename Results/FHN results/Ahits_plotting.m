% aHits plotting
figure()
system=["Hyperbolic","Cubic","Hopf","VanDerPol"];
%%
for i=4
%sys=strcat(system(i),'.mat');
load VanDerPol.mat
ind=[1,3,5,7]
k=[2,4,6,8];
subplot(4,2,ind(i))
semilogy(time,norm_uni,'linewidth',1.5)
hold on
semilogy(time,norm_ahits,'k','linewidth',2)
legend('$\Delta t$','2$\Delta t$','4$\Delta t$','8$\Delta t$','16$\Delta t$','32$\Delta t$','64$\Delta t$','128$\Delta t$','256$\Delta t$','512$\Delta t$','1024$\Delta t$','ahits','Interpreter','LaTeX')
set(gca,'FontSize',15,'TickLabelInterpreter','latex')
grid on
xlim([0 51.20])
xlabel('$t [s]$', 'Interpreter', 'LaTex')
ylabel('$e [t]$', 'Interpreter', 'LaTex')



subplot(4,2,k(i))
plot(time,test_out,'linewidth',2)
xlim([0 51.20])
hold on
plot(time,ahits_out,'k--','linewidth',2)
legend('$x_{1}$', '$x_{2}$','ahits','Interpreter','LaTex')
grid on
xlabel('$t [s]$', 'Interpreter', 'LaTex')
ylabel('$x [t]$', 'Interpreter', 'LaTex')
k=k+1;
set(gca,'FontSize',15,'TickLabelInterpreter','latex')
set(groot,'defaulttextinterpreter','latex')
end


%% for FHN system
t=0:0.01:(51.20-0.01);
x=linspace(0,10,50);
load FHN.mat

% figure(2)
idc=1; %8 #testing ic
idx=1;
u=squeeze(test_out(idc,:,1:50));
%u_pred=squeeze(ahits_out(idc,:,1:50));
v=squeeze(test_out(idc,:,51:end));
%v_pred=squeeze(ahits_out(idc,:,51:end));

u_pred_hits=squeeze(hits_out(idc,:,1:50));
v_pred_hits=squeeze(hits_out(idc,:,51:end));

figure()
subplot(3,2,1)
imagesc(t,x,u)
xlim([0 51.20])
%xticks(0,10,20,30,40,50)
axis xy
shading interp
colormap(jet)
colorbar
% 
subplot(3,2,3)
imagesc(t,x,u_pred)
xlim([0 51.20])
shading interp
colormap(jet)
axis xy
colorbar

subplot(3,2,5)
plot(t,u(:,idx),'b','linewidth',2)
xlim([0 51.20])
hold on
plot(t,u_pred(:,idx),'k--','linewidth',2)
grid on



subplot(3,2,2)
imagesc(t,x,v)
axis xy
xlim([0 51.20])
shading interp
colormap(jet)
colorbar

subplot(3,2,4)
imagesc(t,x,v_pred)
xlim([0 51.20])
shading interp
colormap(jet)
axis xy
colorbar

subplot(3,2,6)
plot(t,v(:,idx),'r','linewidth',2)
xlim([0 51.20])
hold on
plot(t,v_pred(:,idx),'k--','linewidth',2)
grid on
% subplot(2,3,3)
% imagesc(t,x,abs(u-u_pred))
% shading interp
% colormap(jet)
% axis xy
% colorbar
% 
% subplot(2,3,6)
% imagesc(t,x,abs(v-v_pred))
% shading interp
% colormap(jet)
% colorbar
% axis xy

%output response
% figure()
% %subplot(2,1,1)
% plot(t,u(:,idx),'b','linewidth',2)
% hold on
% plot(t,u_pred(:,idx),'k--','linewidth',2)
% grid on

%subplot(2,1,2)

% 
left_u=u(:,idx);
left_v=v(:,idx);
left_u_pred=u_pred(:,idx);
left_v_pred=v_pred(:,idx);
left_u_pred_hits=u_pred_hits(:,idx);
left_v_pred_hits=v_pred_hits(:,idx);
norm(abs(left_u-left_u_pred))
norm(abs(left_v-left_v_pred))

%figure(plot(abs(left_u-left_u_pred)))

%
% phase portrait
% figure()
% plot3(t',left_u,left_v,'linewidth',2)
% xlabel('t')
% ylabel('u')
% zlabel('v')
% hold on
% plot3(t',left_u_pred_hits,left_v_pred_hits,'k--','linewidth',2)
% figure()
% plot(left_u,left_v,'r','linewidth',2)
% hold on
% plot(left_u_pred,left_v_pred,'k--','linewidth',2)
% grid on
%% For KS equation
load KS.mat
u=squeeze(test_out)';
u_pred=squeeze(ahits_out)';
figure()
subplot(2,1,1)
pcolor(u); shading interp; colorbar
subplot(2,1,2)
pcolor(u_pred); shading interp; colorbar
colormap('jet')