function [yi] = props(species)
    table = load('thermo.mat');
    Cp = zeros(length(species),1);
    M = zeros(length(species),1);
    hf = zeros(length(species),1);
    for i=1:length(species)
        rowNum = find(strcmp(table.SpecieData.Species, species(i)));
        if isempty(rowNum)==true
            disp("A specie not in SpecieData table")
        end
        Cp(i) =  table.SpecieData{rowNum,2};
        M(i) = table.SpecieData{rowNum,3};
        hf(i) = table.SpecieData{rowNum,4};
    end
    yi = cat(2,species,Cp,M,hf); %array of specie data
end
