function grabacion(nombre, q, robot)
    r = rateControl(60);

    figure('Position', [100 100 1320 650]);
    
    % F = zeros(size(q,2),1);
    for i = 1:size(q,2)
        robot.show(q(:,i)',FastUpdate=true,PreservePlot=false);


        view(-45,15);
        % campos([-1 1 1]);

        xlim([-0.5 4]);
        ylim([-2 2]);
        zlim([-0.2 2]);
        axis off
        
        % Para grabar en .avi
        F(i) = getframe(gcf);
    
        r.waitfor;
    end
    
    video = VideoWriter(strcat('videos\',nombre,'.avi'),'Uncompressed AVI');
    open(video);
    writeVideo(video,F);
    close(video)
    disp('Fin video');
end