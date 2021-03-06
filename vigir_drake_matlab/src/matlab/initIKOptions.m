function ikoptions = initIKOptions(robot_model)
    nq = robot_model.getNumPositions();
    ikoptions = IKoptions(robot_model);
    cost = Point(robot_model.getStateFrame,1);
    cost.base_x = 100;
    cost.base_y = 100;
    cost.base_z = 100;
    cost.base_roll = 100;
    cost.base_pitch = 100;
    cost.base_yaw = 100;
    cost = double(cost);
    Q = diag(cost(1:nq));
    ikoptions = ikoptions.setQ(Q);
    ikoptions = ikoptions.setQa(0.001*Q);
    ikoptions = ikoptions.setMajorIterationsLimit(10000);
    ikoptions = ikoptions.setIterationsLimit(500000);
    ikoptions = ikoptions.setSuperbasicsLimit(1000);
    ikoptions = ikoptions.setMajorOptimalityTolerance(2e-4);
    ikoptions = ikoptions.setDebug(true);
    ikoptions = ikoptions.setMex(true);
end

