robot = rigidBodyTree("DataFormat","column");
base = robot.Base;
rotatingBase = rigidBody("rotating_base");
arm1 = rigidBody("arm1");
arm2 = rigidBody("arm2");
gripper = rigidBody("gripper");
collBase = collisionCylinder(0.1,0.01); % cylinder: radius,length
collBase.Pose = trvec2tform([0 0 0.01/2]);
coll1 = collisionCylinder(0.01,0.25);
coll1.Pose = trvec2tform([0 0 0.25/2]);
coll2 = collisionCylinder(0.01,0.25);
coll2.Pose = trvec2tform([0 0 0.25/2]);
collGripper = collisionCylinder(0.1,0.01);
collGripper.Pose = trvec2tform([0 0 0.01/2]);
addCollision(rotatingBase,collBase)
addCollision(arm1,coll1)
addCollision(arm2,coll2)
addCollision(gripper,collGripper)
jntBase = rigidBodyJoint("base_joint");
jnt1 = rigidBodyJoint("jnt1","revolute");
jntGripper = rigidBodyJoint("gripper_joint","revolute");
jnt2 = rigidBodyJoint("jnt2","revolute");
jntGripper = rigidBodyJoint("gripper_joint","revolute");
jnt1.JointAxis = [1 1 0];
jnt2.JointAxis = [1 1 0];
jntGripper.JointAxis = [1 1 0];
setFixedTransform(jnt1,trvec2tform([0 0 0]))
setFixedTransform(jnt2,trvec2tform([0 0 0.25]))
setFixedTransform(jntGripper,trvec2tform([0 0 0.25]))
bodies = {base,rotatingBase,arm1,arm2,gripper};
joints = {[],jntBase,jnt1,jnt2,jntGripper};

figure("Name","Assemble Robot","Visible","on")
for i = 2:length(bodies) % Skip base. Iterate through adding bodies and joints.
            bodies{i}.Joint = joints{i};
            addBody(robot,bodies{i},bodies{i-1}.Name)
            show(robot,"Collisions","on","Frames","on");
            drawnow;
end
showdetails(robot)
gui = interactiveRigidBodyTree(robot,"MarkerScaleFactor",0.25);