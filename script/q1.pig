/*
Data:pig/data/baseball
Query: Extract the names of players who have played at more than one position.
*/

A = load 'pig/data/baseball' as (name, team, position:bag{t:(p:chararray)});
B = foreach A generate name, flatten($2);
C = group B by name;
D = foreach C generate group, COUNT(B);
E = filter D by $1 > 1;
F = foreach E generate $0;
