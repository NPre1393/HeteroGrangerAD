function [series] = data_gen(features,lag,dependencies,n)

% features = 3
% lag = 2
% dependencies = 2

series = zeros(features, n);
[rowIdx, colIdx] = find(dependencies~=0);
deps = unique(rowIdx);
deps_len = length(deps);
deps_per = sum(dependencies,2);
coeff_min = 0.1;
coeff_max = 0.9;

coefficients = cell(features);
for i = 1:features
   for j = 1:features
      if dependencies(i,j) == 1
          
      end
   end
    
end

%rnd_coeff = round(coeff_min+rand*(coeff_max-coeff_min),1);

for i = 1:features
    if ~ismember(i,deps)
        series(i,:) = normrnd(rand, rand, [1,n]);
    end
    
end
%nonzeros(dependencies(1,:).*series(:,j-lag:j-1)');
for i = 1:deps_len
   %coeffs = round(coeff_min+rand(deps_per(i),lag)*(coeff_max-coeff_min),1)
   coeffs = round(coeff_min+rand(deps_per(i)*lag,1)*(coeff_max-coeff_min),1)

   %coeffs = round(coeff_min+rand(1,lag)*(coeff_max-coeff_min),1)
   for j = lag+1:n
      %val = 0;
      lagged_vals = nonzeros(dependencies(deps(i),:).*series(:,j-lag:j-1)');
      val = sum(coeffs.*lagged_vals);
      %for c = 1:deps_per(i)
          %val = val+sum(series(colIdx(c), j-lag:j-1).*coeffs(c,:));
          %for d = 1:lag
          %  val = val+(series(colIdx(c), j-d)*coeffs(c,d));
          %end
      %end
      %series(i,j) = val;
      series(i,j) = val;
   end
    
end



end
