w = rand(3,1);
expMapped = expoMap(w);
invMapped = logMap(expMapped);
expMapped = expoMapRodrigues(w);
invMappedRodrigues = logMap(expMapped);
disp("Difference between the two approaches ");
disp(invMappedRodrigues - invMapped);

xi = rand(6,1);
expTwist = twist(xi);
invMapped = invTwist(expTwist);
expTwist = twistRodrigues(xi);
invMappedRodrigues = invTwist(expTwist);
disp("Difference between the two approaches ");
disp(invMappedRodrigues - invMapped);

%% Write a function which takes a vector w ∈ R^3 as input and returns its
% corresponding element R = e^(w^) ∈ SO(3) ⊂ R from the Lie group.
function expo = expoMap(w)
    wHat = [0 -w(3,1) w(2,1); w(3,1) 0 -w(1,1); -w(2,1) w(1,1) 0];
    expo = expm(wHat);
end

function expo = expoMapRodrigues(w)
    wHat = [0 -w(3,1) w(2,1); w(3,1) 0 -w(1,1); -w(2,1) w(1,1) 0];
    expo = eye(3) + (wHat / norm(wHat)) * sin(norm(wHat)) + ...
        ((wHat * wHat) / (norm(wHat)*norm(wHat))) * (1 - cos(norm(wHat)));
end

%% Implement another function which performs the corresponding inverse
% transformationand test the two functions on some examples.
function w = logMap(expo)
    wHat = logm(expo);
    w = [wHat(3,2) ; wHat(1,3) ; wHat(2,1)];
end

%% Implement similar functions which calculate the transformation for
% twists.
function expTwist = twist(xi)
    xiHat = [
        0 -xi(6,1) xi(5,1) xi(1,1);
        xi(6,1) 0 -xi(4,1) xi(2,1);
        -xi(5,1) xi(4,1) 0 xi(3,1);
        0 0 0 0];
    expTwist = expm(xiHat);
end

function expTwist = twistRodrigues(xi)
    w = xi(4:6,1);
    wHat = [0 -xi(6,1) xi(5,1); xi(6,1) 0 -xi(4,1); -xi(5,1) xi(4,1) 0];
    v = xi(1:3,1);
    expW = expoMapRodrigues(w);
    subTerm = ((eye(3) - expW) * wHat * v + w * w.' * v) / (norm(w)*norm(w));
    expTwist = [
        expW(1,1) expW(1,2) expW(1,3) subTerm(1,1);
        expW(2,1) expW(2,2) expW(2,3) subTerm(2,1);
        expW(3,1) expW(3,2) expW(3,3) subTerm(3,1);
        0 0 0 1];
end

function xi = invTwist(expTwist)
    xiHat = logm(expTwist);
    xi = [xiHat(1,4); xiHat(2,4); xiHat(3,4);
        xiHat(3,2); xiHat(1,3); xiHat(2,1)];
end