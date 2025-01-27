function graf_tray(q, robot)
    
    x = zeros(size(q,2));
    y = x;
    z = x;
    
    i = 1;
    for pos = q
        tform = robot.getTransform(pos','ef');
        x(i) = tform(1,4);
        y(i) = tform(2,4);
        z(i) = tform(3,4);
        i = i + 1;
    end
    
    % Cavas simuladas como collision box
    % Cava 1
    box_c1 = collisionBox(4,0.3,1.8);
    box_c1.Pose = se3([2 -0.55 0.9],"trvec");
    
    box_c2 = collisionBox(4,0.3,1.8);
    box_c2.Pose = se3([2 1.15 0.9],"trvec");


    % plot3(x,y,z);
    % grid on;
    % hold on
    % [~, patch] = show(box_c1);
    % patch.FaceColor = [0 0 0];
    % patch.EdgeColor = [1 1 1];
    % show(box_c2);
    % hold off;
end