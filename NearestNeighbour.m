distanceMatrix = [
    0, 2, 3, 1, 5;
    2, 0, 1, 2, 3;
    3, 1, 0, 1, 2;
    4, 2, 1, 0, 1;
    5, 3, 2, 1, 0];
% distances from city to city

startingCity = 1;
currentCity = startingCity;
[nCities,~] = size(distanceMatrix); 
i=1;%Counter variable for counting number of cities visited.
distances=[]; %For use inside the loop, assigned values of distances to each city from the city where the salesman is currently placed.
visited = zeros(1, nCities); %Array of cities, with each element 0 or 1 based on whether the city has been visited or not
visited(startingCity) = 1; %Setting the value of whether the starting City has been visited to 1.
totalDistance=0; %Total distance traveled by the salesman in this route plan.
count=2;
if startingCity > nCities
    disp("ERROR: Invalid starting city.")
else
    while i<nCities
        distances = distanceMatrix(startingCity,:);
        nextCity = nthLowestIndex(distances, count);
        if visited(nextCity) == 0
            totalDistance = totalDistance + distanceMatrix(currentCity,nextCity);
            currentCity=nextCity;
            visited(currentCity) = 1;
            i = i+1;
            count=3;
        else
            count=count+1;
            %distances(nextCity) = max(distances)+1;
        end
    end
    totalDistance = totalDistance + distanceMatrix(currentCity,startingCity);
end
fprintf("Shortest distance found via Nearest Neighbour algorithm: "+num2str(totalDistance)+"\n")