
line([0 3],[0 0]);
line([0 0],[0 3]);
line([3 3],[0 3]);
line([0 3],[3 3]);
line([-0.4 0.4],[0.4 0.4]);
line([0.4 0.4],[-0.4 0.4]);
line([-0.4 -0.4],[-0.4 0.4]);
line([-0.4 0.4],[-0.4 -0.4]);

line([-0.4 0.4],[2.6 2.6]);
line([0.4 0.4],[2.6 3.4]);
line([-0.4 -0.4],[2.6 3.4]);
line([-0.4 0.4],[3.4 3.4]);

line([2.6 3.4],[2.6 2.6]);
line([2.6 2.6],[2.6 3.4]);
line([3.4 3.4],[2.6 3.4]);
line([2.6 3.4],[3.4 3.4]);

line([2.6 3.4],[0.4 0.4]);
line([2.6 2.6],[-0.4 0.4]);
line([3.4 3.4],[-0.4 0.4]);
line([2.6 3.4],[-0.4 -0.4]);

line([-3 0],[0 0]);
line([-3 -3],[0 3]);
line([-3 0],[3 3]);
line([-2.6 -2.6],[0 0.4]);
line([-3 -2.6],[0.4 0.4]);
line([-3 -2.6],[2.6 2.6]);
line([-2.6 -2.6],[2.6 3]);

line([0 0],[3 6]);
line([3 3],[3 6]);
line([0 3],[6 6]);
line([0 0.4],[5.6 5.6]);
line([0.4 0.4],[5.6 6]);
line([2.6 2.6],[5.6 6]);
line([2.6 3],[5.6 5.6]);

line([3 6],[0 0]);
line([3 6],[3 3]);
line([6 6],[0 3]);
line([5.6 5.6],[2.6 3]);
line([5.6 5.6],[0 0.4]);
line([5.6 6],[2.6 2.6]);
line([5.6 6],[0.4 0.4]);

line([0 0],[-3 0]);
line([3 3],[-3 0]);
line([0 3],[-3 -3]);
line([0.4 0.4],[-2.6 -3]);
line([0 0.4],[-2.6 -2.6]);
line([2.6 2.6],[-2.6 -3]);
line([2.6 3],[-2.6 -2.6]);
hold on;
plot(1.5,1.5,'k:*',1.9,2.7,'b:o',1.4,1.2,'r:s');
line([1.4 3],[1.2 6]);

axis([-3 6 -3 6]);