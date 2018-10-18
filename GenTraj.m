function [Trajectory] = GenTraj(Pi,S0,pe)
%Generate and plots a trajectory of a robot given policy matrix/array Pi,
%initial state S0, and error probability pe
%   Detailed explanation goes here
Trajectory=S0;
s=S0;
while (abs(s(1)-3)+abs(s(2)-4))~=0;
    x=s(1); y=s(2); h=s(3);
    action=Pi(x+1,y+1,h+1);
    s=NextS(pe,s,action);
    Trajectory=cat(1,Trajectory,s);
end
Length=size(Trajectory,1);
figure
plot3(Trajectory(:,1),Trajectory(:,2),Trajectory(:,3))
xlabel('X')
ylabel('Y')
zlabel('H')
axis([0,5,0,5,0,11])
xticks([0:5])
yticks([0:5])
zticks([0:11])
grid on
hold on
scatter3(Trajectory(1,1),Trajectory(1,2),Trajectory(1,3),'r')
text(Trajectory(1,1),Trajectory(1,2),Trajectory(1,3),'Start')
scatter3(Trajectory(Length,1),Trajectory(Length,2),Trajectory(Length,3),'g')
text(Trajectory(Length,1),Trajectory(Length,2),Trajectory(Length,3),'Goal')
hold off


end

